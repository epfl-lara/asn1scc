; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37156 () Bool)

(assert start!37156)

(declare-datatypes ((array!8880 0))(
  ( (array!8881 (arr!4852 (Array (_ BitVec 32) (_ BitVec 8))) (size!3931 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7018 0))(
  ( (BitStream!7019 (buf!4383 array!8880) (currentByte!8355 (_ BitVec 32)) (currentBit!8350 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11759 0))(
  ( (Unit!11760) )
))
(declare-datatypes ((tuple3!966 0))(
  ( (tuple3!967 (_1!7933 Unit!11759) (_2!7933 (_ BitVec 8)) (_3!609 BitStream!7018)) )
))
(declare-fun e!117466 () tuple3!966)

(declare-fun thiss!1894 () BitStream!7018)

(declare-fun b!168929 () Bool)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((tuple2!14648 0))(
  ( (tuple2!14649 (_1!7934 Unit!11759) (_2!7934 BitStream!7018)) )
))
(declare-fun lt!261898 () tuple2!14648)

(assert (=> b!168929 (= e!117466 (tuple3!967 (_1!7934 lt!261898) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4852 (buf!4383 thiss!1894)) (currentByte!8355 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8350 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7934 lt!261898)))))

(declare-fun moveBitIndex!0 (BitStream!7018 (_ BitVec 64)) tuple2!14648)

(assert (=> b!168929 (= lt!261898 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun e!117468 () Bool)

(declare-fun lt!261895 () (_ BitVec 64))

(declare-fun lt!261897 () (_ BitVec 64))

(declare-fun b!168930 () Bool)

(assert (=> b!168930 (= e!117468 (and (= lt!261895 (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!261895 (bvand (bvadd lt!261897 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!168930 (= lt!261895 (bvand lt!261897 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168930 (= lt!261897 (bitIndex!0 (size!3931 (buf!4383 thiss!1894)) (currentByte!8355 thiss!1894) (currentBit!8350 thiss!1894)))))

(declare-fun b!168931 () Bool)

(declare-fun res!140512 () Bool)

(assert (=> b!168931 (=> (not res!140512) (not e!117468))))

(assert (=> b!168931 (= res!140512 (= (buf!4383 (_3!609 e!117466)) (buf!4383 thiss!1894)))))

(declare-fun c!8708 () Bool)

(assert (=> b!168931 (= c!8708 (bvsle (bvadd (currentBit!8350 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun res!140513 () Bool)

(assert (=> start!37156 (=> (not res!140513) (not e!117468))))

(assert (=> start!37156 (= res!140513 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!37156 e!117468))

(assert (=> start!37156 true))

(declare-fun e!117467 () Bool)

(declare-fun inv!12 (BitStream!7018) Bool)

(assert (=> start!37156 (and (inv!12 thiss!1894) e!117467)))

(declare-fun b!168928 () Bool)

(declare-fun array_inv!3672 (array!8880) Bool)

(assert (=> b!168928 (= e!117467 (array_inv!3672 (buf!4383 thiss!1894)))))

(declare-fun lt!261896 () (_ BitVec 32))

(declare-fun b!168932 () Bool)

(declare-fun Unit!11761 () Unit!11759)

(assert (=> b!168932 (= e!117466 (tuple3!967 Unit!11761 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4852 (buf!4383 thiss!1894)) (currentByte!8355 thiss!1894))) lt!261896))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4852 (buf!4383 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8355 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261896))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!7019 (buf!4383 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8355 thiss!1894)) lt!261896)))))

(assert (=> b!168932 (= lt!261896 (bvsub (bvadd (currentBit!8350 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168933 () Bool)

(declare-fun res!140511 () Bool)

(assert (=> b!168933 (=> (not res!140511) (not e!117468))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168933 (= res!140511 (validate_offset_bits!1 ((_ sign_extend 32) (size!3931 (buf!4383 thiss!1894))) ((_ sign_extend 32) (currentByte!8355 thiss!1894)) ((_ sign_extend 32) (currentBit!8350 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(assert (= (and start!37156 res!140513) b!168933))

(assert (= (and b!168933 res!140511) b!168931))

(assert (= (and b!168931 c!8708) b!168929))

(assert (= (and b!168931 (not c!8708)) b!168932))

(assert (= (and b!168931 res!140512) b!168930))

(assert (= start!37156 b!168928))

(declare-fun m!268509 () Bool)

(assert (=> start!37156 m!268509))

(declare-fun m!268511 () Bool)

(assert (=> b!168929 m!268511))

(declare-fun m!268513 () Bool)

(assert (=> b!168929 m!268513))

(declare-fun m!268515 () Bool)

(assert (=> b!168929 m!268515))

(declare-fun m!268517 () Bool)

(assert (=> b!168930 m!268517))

(assert (=> b!168932 m!268511))

(declare-fun m!268519 () Bool)

(assert (=> b!168932 m!268519))

(assert (=> b!168932 m!268513))

(declare-fun m!268521 () Bool)

(assert (=> b!168933 m!268521))

(declare-fun m!268523 () Bool)

(assert (=> b!168928 m!268523))

(push 1)

(assert (not start!37156))

(assert (not b!168933))

(assert (not b!168929))

(assert (not b!168928))

(assert (not b!168930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59719 () Bool)

(declare-fun lt!261971 () (_ BitVec 32))

(assert (=> d!59719 (= lt!261971 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261973 () (_ BitVec 32))

(assert (=> d!59719 (= lt!261973 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117504 () Bool)

(assert (=> d!59719 e!117504))

(declare-fun res!140549 () Bool)

(assert (=> d!59719 (=> (not res!140549) (not e!117504))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7018 (_ BitVec 64)) Bool)

(assert (=> d!59719 (= res!140549 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11768 () Unit!11759)

(declare-fun Unit!11769 () Unit!11759)

(declare-fun Unit!11770 () Unit!11759)

(assert (=> d!59719 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8350 thiss!1894) lt!261971) #b00000000000000000000000000000000) (tuple2!14649 Unit!11768 (BitStream!7019 (buf!4383 thiss!1894) (bvsub (bvadd (currentByte!8355 thiss!1894) lt!261973) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261971 (currentBit!8350 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8350 thiss!1894) lt!261971) #b00000000000000000000000000001000) (tuple2!14649 Unit!11769 (BitStream!7019 (buf!4383 thiss!1894) (bvadd (currentByte!8355 thiss!1894) lt!261973 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8350 thiss!1894) lt!261971) #b00000000000000000000000000001000))) (tuple2!14649 Unit!11770 (BitStream!7019 (buf!4383 thiss!1894) (bvadd (currentByte!8355 thiss!1894) lt!261973) (bvadd (currentBit!8350 thiss!1894) lt!261971))))))))

(declare-fun b!168986 () Bool)

(declare-fun e!117503 () Bool)

(assert (=> b!168986 (= e!117504 e!117503)))

(declare-fun res!140548 () Bool)

(assert (=> b!168986 (=> (not res!140548) (not e!117503))))

(declare-fun lt!261976 () (_ BitVec 64))

(declare-fun lt!261972 () tuple2!14648)

(assert (=> b!168986 (= res!140548 (= (bvadd lt!261976 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3931 (buf!4383 (_2!7934 lt!261972))) (currentByte!8355 (_2!7934 lt!261972)) (currentBit!8350 (_2!7934 lt!261972)))))))

(assert (=> b!168986 (or (not (= (bvand lt!261976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261976 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168986 (= lt!261976 (bitIndex!0 (size!3931 (buf!4383 thiss!1894)) (currentByte!8355 thiss!1894) (currentBit!8350 thiss!1894)))))

(declare-fun lt!261974 () (_ BitVec 32))

(declare-fun lt!261975 () (_ BitVec 32))

(declare-fun Unit!11771 () Unit!11759)

(declare-fun Unit!11772 () Unit!11759)

(declare-fun Unit!11773 () Unit!11759)

(assert (=> b!168986 (= lt!261972 (ite (bvslt (bvadd (currentBit!8350 thiss!1894) lt!261974) #b00000000000000000000000000000000) (tuple2!14649 Unit!11771 (BitStream!7019 (buf!4383 thiss!1894) (bvsub (bvadd (currentByte!8355 thiss!1894) lt!261975) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261974 (currentBit!8350 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8350 thiss!1894) lt!261974) #b00000000000000000000000000001000) (tuple2!14649 Unit!11772 (BitStream!7019 (buf!4383 thiss!1894) (bvadd (currentByte!8355 thiss!1894) lt!261975 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8350 thiss!1894) lt!261974) #b00000000000000000000000000001000))) (tuple2!14649 Unit!11773 (BitStream!7019 (buf!4383 thiss!1894) (bvadd (currentByte!8355 thiss!1894) lt!261975) (bvadd (currentBit!8350 thiss!1894) lt!261974))))))))

(assert (=> b!168986 (= lt!261974 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168986 (= lt!261975 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168987 () Bool)

(assert (=> b!168987 (= e!117503 (and (= (size!3931 (buf!4383 thiss!1894)) (size!3931 (buf!4383 (_2!7934 lt!261972)))) (= (buf!4383 thiss!1894) (buf!4383 (_2!7934 lt!261972)))))))

(assert (= (and d!59719 res!140549) b!168986))

(assert (= (and b!168986 res!140548) b!168987))

(declare-fun m!268565 () Bool)

(assert (=> d!59719 m!268565))

(declare-fun m!268567 () Bool)

(assert (=> b!168986 m!268567))

(assert (=> b!168986 m!268517))

(assert (=> b!168929 d!59719))

(declare-fun d!59737 () Bool)

(assert (=> d!59737 (= (array_inv!3672 (buf!4383 thiss!1894)) (bvsge (size!3931 (buf!4383 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168928 d!59737))

(declare-fun d!59739 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59739 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3931 (buf!4383 thiss!1894))) ((_ sign_extend 32) (currentByte!8355 thiss!1894)) ((_ sign_extend 32) (currentBit!8350 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3931 (buf!4383 thiss!1894))) ((_ sign_extend 32) (currentByte!8355 thiss!1894)) ((_ sign_extend 32) (currentBit!8350 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14812 () Bool)

(assert (= bs!14812 d!59739))

(declare-fun m!268569 () Bool)

(assert (=> bs!14812 m!268569))

(assert (=> b!168933 d!59739))

(declare-fun d!59741 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!59741 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8350 thiss!1894) (currentByte!8355 thiss!1894) (size!3931 (buf!4383 thiss!1894))))))

(declare-fun bs!14813 () Bool)

(assert (= bs!14813 d!59741))

(declare-fun m!268571 () Bool)

(assert (=> bs!14813 m!268571))

(assert (=> start!37156 d!59741))

(declare-fun d!59743 () Bool)

(declare-fun e!117507 () Bool)

(assert (=> d!59743 e!117507))

(declare-fun res!140555 () Bool)

(assert (=> d!59743 (=> (not res!140555) (not e!117507))))

(declare-fun lt!261992 () (_ BitVec 64))

(declare-fun lt!261994 () (_ BitVec 64))

(declare-fun lt!261990 () (_ BitVec 64))

(assert (=> d!59743 (= res!140555 (= lt!261994 (bvsub lt!261992 lt!261990)))))

(assert (=> d!59743 (or (= (bvand lt!261992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261990 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261992 lt!261990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59743 (= lt!261990 (remainingBits!0 ((_ sign_extend 32) (size!3931 (buf!4383 thiss!1894))) ((_ sign_extend 32) (currentByte!8355 thiss!1894)) ((_ sign_extend 32) (currentBit!8350 thiss!1894))))))

(declare-fun lt!261989 () (_ BitVec 64))

(declare-fun lt!261993 () (_ BitVec 64))

(assert (=> d!59743 (= lt!261992 (bvmul lt!261989 lt!261993))))

(assert (=> d!59743 (or (= lt!261989 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261993 (bvsdiv (bvmul lt!261989 lt!261993) lt!261989)))))

(assert (=> d!59743 (= lt!261993 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59743 (= lt!261989 ((_ sign_extend 32) (size!3931 (buf!4383 thiss!1894))))))

(assert (=> d!59743 (= lt!261994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8355 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8350 thiss!1894))))))

(assert (=> d!59743 (invariant!0 (currentBit!8350 thiss!1894) (currentByte!8355 thiss!1894) (size!3931 (buf!4383 thiss!1894)))))

(assert (=> d!59743 (= (bitIndex!0 (size!3931 (buf!4383 thiss!1894)) (currentByte!8355 thiss!1894) (currentBit!8350 thiss!1894)) lt!261994)))

(declare-fun b!168992 () Bool)

(declare-fun res!140554 () Bool)

(assert (=> b!168992 (=> (not res!140554) (not e!117507))))

(assert (=> b!168992 (= res!140554 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261994))))

(declare-fun b!168993 () Bool)

(declare-fun lt!261991 () (_ BitVec 64))

(assert (=> b!168993 (= e!117507 (bvsle lt!261994 (bvmul lt!261991 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168993 (or (= lt!261991 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261991 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261991)))))

(assert (=> b!168993 (= lt!261991 ((_ sign_extend 32) (size!3931 (buf!4383 thiss!1894))))))

(assert (= (and d!59743 res!140555) b!168992))

(assert (= (and b!168992 res!140554) b!168993))

(assert (=> d!59743 m!268569))

(assert (=> d!59743 m!268571))

(assert (=> b!168930 d!59743))

(push 1)

(assert (not d!59743))

(assert (not d!59741))

(assert (not b!168986))

(assert (not d!59739))

(assert (not d!59719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

