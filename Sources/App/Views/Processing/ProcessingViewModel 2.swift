import Foundation
import UIKit
import RxSwift
import RxCocoa

class ProcessingViewModel: BaseViewModel {
    
    private var modelManager: ModelManager {
        ModelManagerImpl.shared
    }
    
    var ratingConfig: Observable<RatingPopupModel> {
        modelManager.ratingConfig
    }
    
    var ratingConfigValue: RatingPopupModel {
        modelManager.ratingConfigValue
    }
}

extension ProcessingViewModel {
    func updateGalleryPrompt(galleryPromptModel: GalleryPromptModel, dataImage: Data, prompt: String) {
        modelManager.updateGalleryPrompt(galleryPromptModel: galleryPromptModel, dataImage: dataImage, prompt: prompt)
    }
}
