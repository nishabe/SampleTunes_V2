//
//  DownloadService.swift
//  SampleTunes
//
//  Created by Abraham, Aneesh on 8/23/18.
//  Copyright © 2018 Ammini Inc. All rights reserved.
//

import Foundation

class DownloadService {

    var downloadsSession = URLSession(configuration: URLSessionConfiguration.default) // Derfault urlsession
    var activeDownloads: [URL: Download] = [:] // Dictionary to track the downloads. Key is the file url, which will be unique.
    
    func startDownload(_ track: Track) {
        let download = Download(track: track)
        download.task = downloadsSession.downloadTask(with: track.previewURL)
        download.task!.resume()
        download.isDownloading = true
        activeDownloads[download.track.previewURL] = download
    }
}
