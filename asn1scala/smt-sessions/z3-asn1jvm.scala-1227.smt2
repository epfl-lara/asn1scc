; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34830 () Bool)

(assert start!34830)

(declare-fun b!164685 () Bool)

(declare-fun res!137232 () Bool)

(declare-fun e!113808 () Bool)

(assert (=> b!164685 (=> (not res!137232) (not e!113808))))

(declare-datatypes ((array!8255 0))(
  ( (array!8256 (arr!4616 (Array (_ BitVec 32) (_ BitVec 8))) (size!3695 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6546 0))(
  ( (BitStream!6547 (buf!4147 array!8255) (currentByte!7728 (_ BitVec 32)) (currentBit!7723 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6546)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164685 (= res!137232 (validate_offset_bits!1 ((_ sign_extend 32) (size!3695 (buf!4147 thiss!1577))) ((_ sign_extend 32) (currentByte!7728 thiss!1577)) ((_ sign_extend 32) (currentBit!7723 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164686 () Bool)

(declare-fun res!137233 () Bool)

(assert (=> b!164686 (=> (not res!137233) (not e!113808))))

(assert (=> b!164686 (= res!137233 (bvsgt (bvadd (currentBit!7723 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun res!137234 () Bool)

(assert (=> start!34830 (=> (not res!137234) (not e!113808))))

(assert (=> start!34830 (= res!137234 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34830 e!113808))

(assert (=> start!34830 true))

(declare-fun e!113806 () Bool)

(declare-fun inv!12 (BitStream!6546) Bool)

(assert (=> start!34830 (and (inv!12 thiss!1577) e!113806)))

(declare-fun lt!258455 () (_ BitVec 32))

(declare-fun lt!258448 () (_ BitVec 8))

(declare-fun b!164687 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164687 (= e!113808 (not (byteRangesEq!0 (select (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577)) lt!258448 #b00000000000000000000000000000000 lt!258455)))))

(declare-fun lt!258449 () array!8255)

(declare-fun arrayRangesEq!629 (array!8255 array!8255 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!164687 (arrayRangesEq!629 (buf!4147 thiss!1577) lt!258449 #b00000000000000000000000000000000 (currentByte!7728 thiss!1577))))

(declare-datatypes ((Unit!11470 0))(
  ( (Unit!11471) )
))
(declare-fun lt!258454 () Unit!11470)

(declare-fun lt!258456 () array!8255)

(declare-fun arrayRangesEqTransitive!170 (array!8255 array!8255 array!8255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11470)

(assert (=> b!164687 (= lt!258454 (arrayRangesEqTransitive!170 (buf!4147 thiss!1577) lt!258456 lt!258449 #b00000000000000000000000000000000 (currentByte!7728 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))))))

(assert (=> b!164687 (arrayRangesEq!629 lt!258456 lt!258449 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)))))

(declare-fun lt!258452 () (_ BitVec 8))

(declare-fun lt!258447 () Unit!11470)

(declare-fun arrayUpdatedAtPrefixLemma!237 (array!8255 (_ BitVec 32) (_ BitVec 8)) Unit!11470)

(assert (=> b!164687 (= lt!258447 (arrayUpdatedAtPrefixLemma!237 lt!258456 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) lt!258452))))

(assert (=> b!164687 (arrayRangesEq!629 (buf!4147 thiss!1577) (array!8256 (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) lt!258448) (size!3695 (buf!4147 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7728 thiss!1577))))

(declare-fun lt!258453 () Unit!11470)

(assert (=> b!164687 (= lt!258453 (arrayUpdatedAtPrefixLemma!237 (buf!4147 thiss!1577) (currentByte!7728 thiss!1577) lt!258448))))

(declare-fun lt!258450 () (_ BitVec 32))

(assert (=> b!164687 (= lt!258448 (select (store (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7723 thiss!1577)))))))) (bvlshr (bvand lt!258450 #b00000000000000000000000011111111) lt!258455)))) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) lt!258452) (currentByte!7728 thiss!1577)))))

(assert (=> b!164687 (= lt!258449 (array!8256 (store (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7723 thiss!1577)))))))) (bvlshr (bvand lt!258450 #b00000000000000000000000011111111) lt!258455)))) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) lt!258452) (size!3695 (buf!4147 thiss!1577))))))

(declare-fun lt!258451 () (_ BitVec 32))

(assert (=> b!164687 (= lt!258452 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7723 thiss!1577)))))))) (bvlshr (bvand lt!258450 #b00000000000000000000000011111111) lt!258455)))) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258451))) (bvshl lt!258450 lt!258451))))))

(assert (=> b!164687 (= lt!258451 (bvsub #b00000000000000000000000000001000 lt!258455))))

(assert (=> b!164687 (= lt!258456 (array!8256 (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7723 thiss!1577)))))))) (bvlshr (bvand lt!258450 #b00000000000000000000000011111111) lt!258455)))) (size!3695 (buf!4147 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164687 (= lt!258450 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!164687 (= lt!258455 (bvsub (bvadd (currentBit!7723 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!164688 () Bool)

(declare-fun array_inv!3436 (array!8255) Bool)

(assert (=> b!164688 (= e!113806 (array_inv!3436 (buf!4147 thiss!1577)))))

(assert (= (and start!34830 res!137234) b!164685))

(assert (= (and b!164685 res!137232) b!164686))

(assert (= (and b!164686 res!137233) b!164687))

(assert (= start!34830 b!164688))

(declare-fun m!261933 () Bool)

(assert (=> b!164685 m!261933))

(declare-fun m!261935 () Bool)

(assert (=> start!34830 m!261935))

(declare-fun m!261937 () Bool)

(assert (=> b!164687 m!261937))

(declare-fun m!261939 () Bool)

(assert (=> b!164687 m!261939))

(declare-fun m!261941 () Bool)

(assert (=> b!164687 m!261941))

(assert (=> b!164687 m!261939))

(declare-fun m!261943 () Bool)

(assert (=> b!164687 m!261943))

(declare-fun m!261945 () Bool)

(assert (=> b!164687 m!261945))

(declare-fun m!261947 () Bool)

(assert (=> b!164687 m!261947))

(declare-fun m!261949 () Bool)

(assert (=> b!164687 m!261949))

(declare-fun m!261951 () Bool)

(assert (=> b!164687 m!261951))

(declare-fun m!261953 () Bool)

(assert (=> b!164687 m!261953))

(declare-fun m!261955 () Bool)

(assert (=> b!164687 m!261955))

(declare-fun m!261957 () Bool)

(assert (=> b!164687 m!261957))

(declare-fun m!261959 () Bool)

(assert (=> b!164687 m!261959))

(declare-fun m!261961 () Bool)

(assert (=> b!164687 m!261961))

(declare-fun m!261963 () Bool)

(assert (=> b!164687 m!261963))

(declare-fun m!261965 () Bool)

(assert (=> b!164687 m!261965))

(declare-fun m!261967 () Bool)

(assert (=> b!164687 m!261967))

(declare-fun m!261969 () Bool)

(assert (=> b!164688 m!261969))

(check-sat (not start!34830) (not b!164687) (not b!164688) (not b!164685))
(check-sat)
(get-model)

(declare-fun d!56851 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56851 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7723 thiss!1577) (currentByte!7728 thiss!1577) (size!3695 (buf!4147 thiss!1577))))))

(declare-fun bs!14091 () Bool)

(assert (= bs!14091 d!56851))

(declare-fun m!262009 () Bool)

(assert (=> bs!14091 m!262009))

(assert (=> start!34830 d!56851))

(declare-fun d!56853 () Bool)

(declare-fun res!137248 () Bool)

(declare-fun e!113822 () Bool)

(assert (=> d!56853 (=> res!137248 e!113822)))

(assert (=> d!56853 (= res!137248 (= #b00000000000000000000000000000000 (currentByte!7728 thiss!1577)))))

(assert (=> d!56853 (= (arrayRangesEq!629 (buf!4147 thiss!1577) lt!258449 #b00000000000000000000000000000000 (currentByte!7728 thiss!1577)) e!113822)))

(declare-fun b!164705 () Bool)

(declare-fun e!113823 () Bool)

(assert (=> b!164705 (= e!113822 e!113823)))

(declare-fun res!137249 () Bool)

(assert (=> b!164705 (=> (not res!137249) (not e!113823))))

(assert (=> b!164705 (= res!137249 (= (select (arr!4616 (buf!4147 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4616 lt!258449) #b00000000000000000000000000000000)))))

(declare-fun b!164706 () Bool)

(assert (=> b!164706 (= e!113823 (arrayRangesEq!629 (buf!4147 thiss!1577) lt!258449 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7728 thiss!1577)))))

(assert (= (and d!56853 (not res!137248)) b!164705))

(assert (= (and b!164705 res!137249) b!164706))

(declare-fun m!262011 () Bool)

(assert (=> b!164705 m!262011))

(declare-fun m!262013 () Bool)

(assert (=> b!164705 m!262013))

(declare-fun m!262015 () Bool)

(assert (=> b!164706 m!262015))

(assert (=> b!164687 d!56853))

(declare-fun d!56855 () Bool)

(assert (=> d!56855 (arrayRangesEq!629 (buf!4147 thiss!1577) lt!258449 #b00000000000000000000000000000000 (currentByte!7728 thiss!1577))))

(declare-fun lt!258489 () Unit!11470)

(declare-fun choose!212 (array!8255 array!8255 array!8255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11470)

(assert (=> d!56855 (= lt!258489 (choose!212 (buf!4147 thiss!1577) lt!258456 lt!258449 #b00000000000000000000000000000000 (currentByte!7728 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))))))

(assert (=> d!56855 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!7728 thiss!1577)) (bvsle (currentByte!7728 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))))))

(assert (=> d!56855 (= (arrayRangesEqTransitive!170 (buf!4147 thiss!1577) lt!258456 lt!258449 #b00000000000000000000000000000000 (currentByte!7728 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))) lt!258489)))

(declare-fun bs!14096 () Bool)

(assert (= bs!14096 d!56855))

(assert (=> bs!14096 m!261947))

(declare-fun m!262025 () Bool)

(assert (=> bs!14096 m!262025))

(assert (=> b!164687 d!56855))

(declare-fun d!56871 () Bool)

(declare-fun res!137250 () Bool)

(declare-fun e!113824 () Bool)

(assert (=> d!56871 (=> res!137250 e!113824)))

(assert (=> d!56871 (= res!137250 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))))))

(assert (=> d!56871 (= (arrayRangesEq!629 lt!258456 lt!258449 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))) e!113824)))

(declare-fun b!164707 () Bool)

(declare-fun e!113825 () Bool)

(assert (=> b!164707 (= e!113824 e!113825)))

(declare-fun res!137251 () Bool)

(assert (=> b!164707 (=> (not res!137251) (not e!113825))))

(assert (=> b!164707 (= res!137251 (= (select (arr!4616 lt!258456) #b00000000000000000000000000000000) (select (arr!4616 lt!258449) #b00000000000000000000000000000000)))))

(declare-fun b!164708 () Bool)

(assert (=> b!164708 (= e!113825 (arrayRangesEq!629 lt!258456 lt!258449 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))))))

(assert (= (and d!56871 (not res!137250)) b!164707))

(assert (= (and b!164707 res!137251) b!164708))

(declare-fun m!262027 () Bool)

(assert (=> b!164707 m!262027))

(assert (=> b!164707 m!262013))

(declare-fun m!262029 () Bool)

(assert (=> b!164708 m!262029))

(assert (=> b!164687 d!56871))

(declare-fun d!56873 () Bool)

(declare-fun e!113835 () Bool)

(assert (=> d!56873 e!113835))

(declare-fun res!137261 () Bool)

(assert (=> d!56873 (=> (not res!137261) (not e!113835))))

(assert (=> d!56873 (= res!137261 (and (bvsge (currentByte!7728 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7728 thiss!1577) (size!3695 (buf!4147 thiss!1577)))))))

(declare-fun lt!258495 () Unit!11470)

(declare-fun choose!214 (array!8255 (_ BitVec 32) (_ BitVec 8)) Unit!11470)

(assert (=> d!56873 (= lt!258495 (choose!214 (buf!4147 thiss!1577) (currentByte!7728 thiss!1577) lt!258448))))

(assert (=> d!56873 (and (bvsle #b00000000000000000000000000000000 (currentByte!7728 thiss!1577)) (bvslt (currentByte!7728 thiss!1577) (size!3695 (buf!4147 thiss!1577))))))

(assert (=> d!56873 (= (arrayUpdatedAtPrefixLemma!237 (buf!4147 thiss!1577) (currentByte!7728 thiss!1577) lt!258448) lt!258495)))

(declare-fun b!164718 () Bool)

(assert (=> b!164718 (= e!113835 (arrayRangesEq!629 (buf!4147 thiss!1577) (array!8256 (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) lt!258448) (size!3695 (buf!4147 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7728 thiss!1577)))))

(assert (= (and d!56873 res!137261) b!164718))

(declare-fun m!262037 () Bool)

(assert (=> d!56873 m!262037))

(assert (=> b!164718 m!261945))

(assert (=> b!164718 m!261937))

(assert (=> b!164687 d!56873))

(declare-fun d!56879 () Bool)

(assert (=> d!56879 (= (byteRangesEq!0 (select (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577)) lt!258448 #b00000000000000000000000000000000 lt!258455) (or (= #b00000000000000000000000000000000 lt!258455) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258455))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258448) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!258455))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14099 () Bool)

(assert (= bs!14099 d!56879))

(declare-fun m!262053 () Bool)

(assert (=> bs!14099 m!262053))

(declare-fun m!262057 () Bool)

(assert (=> bs!14099 m!262057))

(assert (=> b!164687 d!56879))

(declare-fun d!56887 () Bool)

(declare-fun e!113842 () Bool)

(assert (=> d!56887 e!113842))

(declare-fun res!137268 () Bool)

(assert (=> d!56887 (=> (not res!137268) (not e!113842))))

(assert (=> d!56887 (= res!137268 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) (size!3695 lt!258456))))))

(declare-fun lt!258500 () Unit!11470)

(assert (=> d!56887 (= lt!258500 (choose!214 lt!258456 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) lt!258452))))

(assert (=> d!56887 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) (size!3695 lt!258456)))))

(assert (=> d!56887 (= (arrayUpdatedAtPrefixLemma!237 lt!258456 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) lt!258452) lt!258500)))

(declare-fun b!164725 () Bool)

(assert (=> b!164725 (= e!113842 (arrayRangesEq!629 lt!258456 (array!8256 (store (arr!4616 lt!258456) (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577)) lt!258452) (size!3695 lt!258456)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!7728 thiss!1577))))))

(assert (= (and d!56887 res!137268) b!164725))

(declare-fun m!262061 () Bool)

(assert (=> d!56887 m!262061))

(declare-fun m!262063 () Bool)

(assert (=> b!164725 m!262063))

(declare-fun m!262065 () Bool)

(assert (=> b!164725 m!262065))

(assert (=> b!164687 d!56887))

(declare-fun d!56891 () Bool)

(declare-fun res!137273 () Bool)

(declare-fun e!113847 () Bool)

(assert (=> d!56891 (=> res!137273 e!113847)))

(assert (=> d!56891 (= res!137273 (= #b00000000000000000000000000000000 (currentByte!7728 thiss!1577)))))

(assert (=> d!56891 (= (arrayRangesEq!629 (buf!4147 thiss!1577) (array!8256 (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) lt!258448) (size!3695 (buf!4147 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7728 thiss!1577)) e!113847)))

(declare-fun b!164730 () Bool)

(declare-fun e!113848 () Bool)

(assert (=> b!164730 (= e!113847 e!113848)))

(declare-fun res!137274 () Bool)

(assert (=> b!164730 (=> (not res!137274) (not e!113848))))

(assert (=> b!164730 (= res!137274 (= (select (arr!4616 (buf!4147 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4616 (array!8256 (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) lt!258448) (size!3695 (buf!4147 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!164731 () Bool)

(assert (=> b!164731 (= e!113848 (arrayRangesEq!629 (buf!4147 thiss!1577) (array!8256 (store (arr!4616 (buf!4147 thiss!1577)) (currentByte!7728 thiss!1577) lt!258448) (size!3695 (buf!4147 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7728 thiss!1577)))))

(assert (= (and d!56891 (not res!137273)) b!164730))

(assert (= (and b!164730 res!137274) b!164731))

(assert (=> b!164730 m!262011))

(declare-fun m!262067 () Bool)

(assert (=> b!164730 m!262067))

(declare-fun m!262069 () Bool)

(assert (=> b!164731 m!262069))

(assert (=> b!164687 d!56891))

(declare-fun d!56893 () Bool)

(assert (=> d!56893 (= (array_inv!3436 (buf!4147 thiss!1577)) (bvsge (size!3695 (buf!4147 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164688 d!56893))

(declare-fun d!56895 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56895 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3695 (buf!4147 thiss!1577))) ((_ sign_extend 32) (currentByte!7728 thiss!1577)) ((_ sign_extend 32) (currentBit!7723 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3695 (buf!4147 thiss!1577))) ((_ sign_extend 32) (currentByte!7728 thiss!1577)) ((_ sign_extend 32) (currentBit!7723 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14100 () Bool)

(assert (= bs!14100 d!56895))

(declare-fun m!262077 () Bool)

(assert (=> bs!14100 m!262077))

(assert (=> b!164685 d!56895))

(check-sat (not d!56873) (not b!164725) (not d!56887) (not b!164708) (not b!164706) (not d!56851) (not d!56855) (not b!164718) (not d!56895) (not b!164731))
(check-sat)
