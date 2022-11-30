//
//  YIMOrderMessageCell.m
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/30.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import "YIMOrderMessageCell.h"
#import <Masonry/Masonry.h>

@implementation YIMOrderMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _productImageView = [[UIImageView alloc] init];
        _productImageView.contentMode = UIViewContentModeScaleAspectFit;
        _productNameLabel = [[UILabel alloc] init];
        [self setupView];
    }
    return self;
}

- (void)setupView {
    UIStackView *vstack = [[UIStackView alloc] initWithArrangedSubviews:@[self.productImageView, self.productNameLabel]];
    vstack.axis = UILayoutConstraintAxisVertical;
    vstack.spacing = 10;
    [self.container addSubview:vstack];
    [vstack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.container);
    }];
    [self.productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@50);
    }];
}

- (void)fillWithData:(YIMOrderMeaageCellData *)data {
    [super fillWithData:data];
    self.customData = data;
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:data.productImageURLString]];
    self.productNameLabel.text = data.productName;
}

@end
