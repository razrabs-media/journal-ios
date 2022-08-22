//
//  PRazrabsApi.swift
//  Razrabs
//
//  Created by Anatoliy on 23.08.2022.
//

protocol PRazrabsApi {
    func requestFeed(callback: @escaping (_ result: Result<FeedResponse, Swift.Error>) -> ())
}
