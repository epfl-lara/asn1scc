; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33612 () Bool)

(assert start!33612)

(declare-fun res!134310 () Bool)

(declare-fun e!110858 () Bool)

(assert (=> start!33612 (=> (not res!134310) (not e!110858))))

(declare-datatypes ((array!7942 0))(
  ( (array!7943 (arr!4487 (Array (_ BitVec 32) (_ BitVec 8))) (size!3566 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6300 0))(
  ( (BitStream!6301 (buf!4024 array!7942) (currentByte!7496 (_ BitVec 32)) (currentBit!7491 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6300)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33612 (= res!134310 (validate_offset_byte!0 ((_ sign_extend 32) (size!3566 (buf!4024 thiss!1602))) ((_ sign_extend 32) (currentByte!7496 thiss!1602)) ((_ sign_extend 32) (currentBit!7491 thiss!1602))))))

(assert (=> start!33612 e!110858))

(declare-fun e!110859 () Bool)

(declare-fun inv!12 (BitStream!6300) Bool)

(assert (=> start!33612 (and (inv!12 thiss!1602) e!110859)))

(assert (=> start!33612 true))

(declare-fun e!110856 () Bool)

(declare-fun b!161144 () Bool)

(declare-fun lt!253731 () (_ BitVec 32))

(declare-datatypes ((Unit!11034 0))(
  ( (Unit!11035) )
))
(declare-datatypes ((tuple3!860 0))(
  ( (tuple3!861 (_1!7781 Unit!11034) (_2!7781 (_ BitVec 8)) (_3!547 BitStream!6300)) )
))
(declare-fun lt!253737 () tuple3!860)

(assert (=> b!161144 (= e!110856 (or (bvsle lt!253731 #b00000000000000000000000000000000) (and (bvsle #b00000000000000000000000000000000 (currentByte!7496 (_3!547 lt!253737))) (bvslt (currentByte!7496 (_3!547 lt!253737)) (size!3566 (buf!4024 thiss!1602))))))))

(declare-fun b!161143 () Bool)

(declare-fun e!110857 () Bool)

(declare-fun lt!253734 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161143 (= e!110857 (byteRangesEq!0 (select (arr!4487 (buf!4024 thiss!1602)) (currentByte!7496 thiss!1602)) lt!253734 #b00000000000000000000000000000000 (currentBit!7491 thiss!1602)))))

(declare-fun b!161142 () Bool)

(assert (=> b!161142 (= e!110858 (not e!110856))))

(declare-fun res!134312 () Bool)

(assert (=> b!161142 (=> res!134312 e!110856)))

(declare-fun lt!253730 () array!7942)

(declare-fun arrayRangesEq!518 (array!7942 array!7942 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161142 (= res!134312 (not (arrayRangesEq!518 (buf!4024 thiss!1602) lt!253730 #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001))))))

(declare-fun lt!253735 () (_ BitVec 8))

(assert (=> b!161142 (arrayRangesEq!518 (buf!4024 thiss!1602) (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001))))

(declare-fun lt!253729 () Unit!11034)

(declare-fun arrayUpdatedAtPrefixLemma!126 (array!7942 (_ BitVec 32) (_ BitVec 8)) Unit!11034)

(assert (=> b!161142 (= lt!253729 (arrayUpdatedAtPrefixLemma!126 (buf!4024 thiss!1602) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735))))

(assert (=> b!161142 (= lt!253735 (select (arr!4487 (buf!4024 (_3!547 lt!253737))) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253728 () (_ BitVec 32))

(declare-fun lt!253733 () (_ BitVec 32))

(declare-fun lt!253732 () (_ BitVec 8))

(declare-fun lt!253736 () (_ BitVec 8))

(declare-fun Unit!11036 () Unit!11034)

(declare-fun Unit!11037 () Unit!11034)

(assert (=> b!161142 (= lt!253737 (ite (bvsgt lt!253731 #b00000000000000000000000000000000) (let ((bdg!9597 ((_ extract 7 0) (bvnot lt!253733)))) (let ((bdg!9598 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4487 (buf!4024 thiss!1602)) (currentByte!7496 thiss!1602) lt!253736) (currentByte!7496 thiss!1602) lt!253734) (bvadd #b00000000000000000000000000000001 (currentByte!7496 thiss!1602)))) ((_ sign_extend 24) bdg!9597))))) (tuple3!861 Unit!11036 bdg!9597 (BitStream!6301 (array!7943 (store (arr!4487 (array!7943 (store (arr!4487 lt!253730) (bvadd #b00000000000000000000000000000001 (currentByte!7496 thiss!1602)) bdg!9598) (size!3566 lt!253730))) (bvadd #b00000000000000000000000000000001 (currentByte!7496 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9598) (bvshl ((_ sign_extend 24) v!222) lt!253728)))) (size!3566 (array!7943 (store (arr!4487 lt!253730) (bvadd #b00000000000000000000000000000001 (currentByte!7496 thiss!1602)) bdg!9598) (size!3566 lt!253730)))) (bvadd #b00000000000000000000000000000001 (currentByte!7496 thiss!1602)) (currentBit!7491 thiss!1602))))) (tuple3!861 Unit!11037 lt!253732 (BitStream!6301 lt!253730 (bvadd #b00000000000000000000000000000001 (currentByte!7496 thiss!1602)) (currentBit!7491 thiss!1602)))))))

(assert (=> b!161142 e!110857))

(declare-fun res!134311 () Bool)

(assert (=> b!161142 (=> res!134311 e!110857)))

(assert (=> b!161142 (= res!134311 (bvsge (currentByte!7496 thiss!1602) (size!3566 (buf!4024 thiss!1602))))))

(assert (=> b!161142 (= lt!253730 (array!7943 (store (store (arr!4487 (buf!4024 thiss!1602)) (currentByte!7496 thiss!1602) lt!253736) (currentByte!7496 thiss!1602) lt!253734) (size!3566 (buf!4024 thiss!1602))))))

(assert (=> b!161142 (= lt!253734 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253736) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253731))))))

(assert (=> b!161142 (= lt!253736 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4487 (buf!4024 thiss!1602)) (currentByte!7496 thiss!1602))) lt!253733)))))

(assert (=> b!161142 (= lt!253733 ((_ sign_extend 24) lt!253732))))

(assert (=> b!161142 (= lt!253732 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253728)))))))

(assert (=> b!161142 (= lt!253728 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253731))))))

(assert (=> b!161142 (= lt!253731 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7491 thiss!1602))))))

(declare-fun b!161145 () Bool)

(declare-fun array_inv!3313 (array!7942) Bool)

(assert (=> b!161145 (= e!110859 (array_inv!3313 (buf!4024 thiss!1602)))))

(assert (= (and start!33612 res!134310) b!161142))

(assert (= (and b!161142 (not res!134311)) b!161143))

(assert (= (and b!161142 (not res!134312)) b!161144))

(assert (= start!33612 b!161145))

(declare-fun m!254949 () Bool)

(assert (=> start!33612 m!254949))

(declare-fun m!254951 () Bool)

(assert (=> start!33612 m!254951))

(declare-fun m!254953 () Bool)

(assert (=> b!161143 m!254953))

(assert (=> b!161143 m!254953))

(declare-fun m!254955 () Bool)

(assert (=> b!161143 m!254955))

(declare-fun m!254957 () Bool)

(assert (=> b!161142 m!254957))

(declare-fun m!254959 () Bool)

(assert (=> b!161142 m!254959))

(declare-fun m!254961 () Bool)

(assert (=> b!161142 m!254961))

(declare-fun m!254963 () Bool)

(assert (=> b!161142 m!254963))

(declare-fun m!254965 () Bool)

(assert (=> b!161142 m!254965))

(declare-fun m!254967 () Bool)

(assert (=> b!161142 m!254967))

(declare-fun m!254969 () Bool)

(assert (=> b!161142 m!254969))

(declare-fun m!254971 () Bool)

(assert (=> b!161142 m!254971))

(assert (=> b!161142 m!254953))

(declare-fun m!254973 () Bool)

(assert (=> b!161142 m!254973))

(declare-fun m!254975 () Bool)

(assert (=> b!161142 m!254975))

(declare-fun m!254977 () Bool)

(assert (=> b!161142 m!254977))

(declare-fun m!254979 () Bool)

(assert (=> b!161145 m!254979))

(check-sat (not b!161145) (not b!161142) (not start!33612) (not b!161143))
(check-sat)
(get-model)

(declare-fun d!55059 () Bool)

(assert (=> d!55059 (= (array_inv!3313 (buf!4024 thiss!1602)) (bvsge (size!3566 (buf!4024 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161145 d!55059))

(declare-fun d!55061 () Bool)

(declare-fun res!134348 () Bool)

(declare-fun e!110901 () Bool)

(assert (=> d!55061 (=> res!134348 e!110901)))

(assert (=> d!55061 (= res!134348 (= #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (=> d!55061 (= (arrayRangesEq!518 (buf!4024 thiss!1602) lt!253730 #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)) e!110901)))

(declare-fun b!161184 () Bool)

(declare-fun e!110902 () Bool)

(assert (=> b!161184 (= e!110901 e!110902)))

(declare-fun res!134349 () Bool)

(assert (=> b!161184 (=> (not res!134349) (not e!110902))))

(assert (=> b!161184 (= res!134349 (= (select (arr!4487 (buf!4024 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4487 lt!253730) #b00000000000000000000000000000000)))))

(declare-fun b!161185 () Bool)

(assert (=> b!161185 (= e!110902 (arrayRangesEq!518 (buf!4024 thiss!1602) lt!253730 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (= (and d!55061 (not res!134348)) b!161184))

(assert (= (and b!161184 res!134349) b!161185))

(declare-fun m!255053 () Bool)

(assert (=> b!161184 m!255053))

(declare-fun m!255055 () Bool)

(assert (=> b!161184 m!255055))

(declare-fun m!255057 () Bool)

(assert (=> b!161185 m!255057))

(assert (=> b!161142 d!55061))

(declare-fun d!55063 () Bool)

(declare-fun res!134350 () Bool)

(declare-fun e!110903 () Bool)

(assert (=> d!55063 (=> res!134350 e!110903)))

(assert (=> d!55063 (= res!134350 (= #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (=> d!55063 (= (arrayRangesEq!518 (buf!4024 thiss!1602) (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)) e!110903)))

(declare-fun b!161186 () Bool)

(declare-fun e!110904 () Bool)

(assert (=> b!161186 (= e!110903 e!110904)))

(declare-fun res!134351 () Bool)

(assert (=> b!161186 (=> (not res!134351) (not e!110904))))

(assert (=> b!161186 (= res!134351 (= (select (arr!4487 (buf!4024 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4487 (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161187 () Bool)

(assert (=> b!161187 (= e!110904 (arrayRangesEq!518 (buf!4024 thiss!1602) (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (= (and d!55063 (not res!134350)) b!161186))

(assert (= (and b!161186 res!134351) b!161187))

(assert (=> b!161186 m!255053))

(declare-fun m!255059 () Bool)

(assert (=> b!161186 m!255059))

(declare-fun m!255061 () Bool)

(assert (=> b!161187 m!255061))

(assert (=> b!161142 d!55063))

(declare-fun d!55065 () Bool)

(declare-fun e!110907 () Bool)

(assert (=> d!55065 e!110907))

(declare-fun res!134354 () Bool)

(assert (=> d!55065 (=> (not res!134354) (not e!110907))))

(assert (=> d!55065 (= res!134354 (and (bvsge (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) (size!3566 (buf!4024 thiss!1602)))))))

(declare-fun lt!253776 () Unit!11034)

(declare-fun choose!158 (array!7942 (_ BitVec 32) (_ BitVec 8)) Unit!11034)

(assert (=> d!55065 (= lt!253776 (choose!158 (buf!4024 thiss!1602) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735))))

(assert (=> d!55065 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) (size!3566 (buf!4024 thiss!1602))))))

(assert (=> d!55065 (= (arrayUpdatedAtPrefixLemma!126 (buf!4024 thiss!1602) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) lt!253776)))

(declare-fun b!161190 () Bool)

(assert (=> b!161190 (= e!110907 (arrayRangesEq!518 (buf!4024 thiss!1602) (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (= (and d!55065 res!134354) b!161190))

(declare-fun m!255063 () Bool)

(assert (=> d!55065 m!255063))

(assert (=> b!161190 m!254961))

(assert (=> b!161190 m!254971))

(assert (=> b!161142 d!55065))

(declare-fun d!55067 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55067 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3566 (buf!4024 thiss!1602))) ((_ sign_extend 32) (currentByte!7496 thiss!1602)) ((_ sign_extend 32) (currentBit!7491 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3566 (buf!4024 thiss!1602))) ((_ sign_extend 32) (currentByte!7496 thiss!1602)) ((_ sign_extend 32) (currentBit!7491 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13705 () Bool)

(assert (= bs!13705 d!55067))

(declare-fun m!255065 () Bool)

(assert (=> bs!13705 m!255065))

(assert (=> start!33612 d!55067))

(declare-fun d!55069 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55069 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7491 thiss!1602) (currentByte!7496 thiss!1602) (size!3566 (buf!4024 thiss!1602))))))

(declare-fun bs!13706 () Bool)

(assert (= bs!13706 d!55069))

(declare-fun m!255067 () Bool)

(assert (=> bs!13706 m!255067))

(assert (=> start!33612 d!55069))

(declare-fun d!55071 () Bool)

(assert (=> d!55071 (= (byteRangesEq!0 (select (arr!4487 (buf!4024 thiss!1602)) (currentByte!7496 thiss!1602)) lt!253734 #b00000000000000000000000000000000 (currentBit!7491 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7491 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4487 (buf!4024 thiss!1602)) (currentByte!7496 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7491 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253734) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7491 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13707 () Bool)

(assert (= bs!13707 d!55071))

(declare-fun m!255069 () Bool)

(assert (=> bs!13707 m!255069))

(declare-fun m!255071 () Bool)

(assert (=> bs!13707 m!255071))

(assert (=> b!161143 d!55071))

(check-sat (not d!55065) (not b!161185) (not b!161187) (not b!161190) (not d!55067) (not d!55069))
(check-sat)
(get-model)

(declare-fun d!55077 () Bool)

(declare-fun res!134357 () Bool)

(declare-fun e!110910 () Bool)

(assert (=> d!55077 (=> res!134357 e!110910)))

(assert (=> d!55077 (= res!134357 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (=> d!55077 (= (arrayRangesEq!518 (buf!4024 thiss!1602) (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)) e!110910)))

(declare-fun b!161193 () Bool)

(declare-fun e!110911 () Bool)

(assert (=> b!161193 (= e!110910 e!110911)))

(declare-fun res!134358 () Bool)

(assert (=> b!161193 (=> (not res!134358) (not e!110911))))

(assert (=> b!161193 (= res!134358 (= (select (arr!4487 (buf!4024 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4487 (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161194 () Bool)

(assert (=> b!161194 (= e!110911 (arrayRangesEq!518 (buf!4024 thiss!1602) (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (= (and d!55077 (not res!134357)) b!161193))

(assert (= (and b!161193 res!134358) b!161194))

(declare-fun m!255079 () Bool)

(assert (=> b!161193 m!255079))

(declare-fun m!255081 () Bool)

(assert (=> b!161193 m!255081))

(declare-fun m!255083 () Bool)

(assert (=> b!161194 m!255083))

(assert (=> b!161187 d!55077))

(declare-fun d!55079 () Bool)

(assert (=> d!55079 (= (invariant!0 (currentBit!7491 thiss!1602) (currentByte!7496 thiss!1602) (size!3566 (buf!4024 thiss!1602))) (and (bvsge (currentBit!7491 thiss!1602) #b00000000000000000000000000000000) (bvslt (currentBit!7491 thiss!1602) #b00000000000000000000000000001000) (bvsge (currentByte!7496 thiss!1602) #b00000000000000000000000000000000) (or (bvslt (currentByte!7496 thiss!1602) (size!3566 (buf!4024 thiss!1602))) (and (= (currentBit!7491 thiss!1602) #b00000000000000000000000000000000) (= (currentByte!7496 thiss!1602) (size!3566 (buf!4024 thiss!1602)))))))))

(assert (=> d!55069 d!55079))

(declare-fun d!55083 () Bool)

(assert (=> d!55083 (arrayRangesEq!518 (buf!4024 thiss!1602) (array!7943 (store (arr!4487 (buf!4024 thiss!1602)) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) (size!3566 (buf!4024 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001))))

(assert (=> d!55083 true))

(declare-fun _$8!127 () Unit!11034)

(assert (=> d!55083 (= (choose!158 (buf!4024 thiss!1602) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001) lt!253735) _$8!127)))

(declare-fun bs!13709 () Bool)

(assert (= bs!13709 d!55083))

(assert (=> bs!13709 m!254961))

(assert (=> bs!13709 m!254971))

(assert (=> d!55065 d!55083))

(declare-fun d!55085 () Bool)

(assert (=> d!55085 (= (remainingBits!0 ((_ sign_extend 32) (size!3566 (buf!4024 thiss!1602))) ((_ sign_extend 32) (currentByte!7496 thiss!1602)) ((_ sign_extend 32) (currentBit!7491 thiss!1602))) (bvsub (bvmul ((_ sign_extend 32) (size!3566 (buf!4024 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7496 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7491 thiss!1602)))))))

(assert (=> d!55067 d!55085))

(declare-fun d!55089 () Bool)

(declare-fun res!134359 () Bool)

(declare-fun e!110912 () Bool)

(assert (=> d!55089 (=> res!134359 e!110912)))

(assert (=> d!55089 (= res!134359 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (=> d!55089 (= (arrayRangesEq!518 (buf!4024 thiss!1602) lt!253730 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)) e!110912)))

(declare-fun b!161195 () Bool)

(declare-fun e!110913 () Bool)

(assert (=> b!161195 (= e!110912 e!110913)))

(declare-fun res!134360 () Bool)

(assert (=> b!161195 (=> (not res!134360) (not e!110913))))

(assert (=> b!161195 (= res!134360 (= (select (arr!4487 (buf!4024 thiss!1602)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4487 lt!253730) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!161196 () Bool)

(assert (=> b!161196 (= e!110913 (arrayRangesEq!518 (buf!4024 thiss!1602) lt!253730 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub (currentByte!7496 (_3!547 lt!253737)) #b00000000000000000000000000000001)))))

(assert (= (and d!55089 (not res!134359)) b!161195))

(assert (= (and b!161195 res!134360) b!161196))

(assert (=> b!161195 m!255079))

(declare-fun m!255085 () Bool)

(assert (=> b!161195 m!255085))

(declare-fun m!255087 () Bool)

(assert (=> b!161196 m!255087))

(assert (=> b!161185 d!55089))

(assert (=> b!161190 d!55063))

(check-sat (not b!161196) (not d!55083) (not b!161194))
(check-sat)
