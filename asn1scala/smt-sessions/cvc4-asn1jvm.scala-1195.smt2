; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33888 () Bool)

(assert start!33888)

(declare-fun b!161927 () Bool)

(declare-datatypes ((Unit!11174 0))(
  ( (Unit!11175) )
))
(declare-fun e!111644 () Unit!11174)

(declare-fun Unit!11176 () Unit!11174)

(assert (=> b!161927 (= e!111644 Unit!11176)))

(declare-fun call!2732 () Bool)

(assert (=> b!161927 call!2732))

(declare-fun b!161928 () Bool)

(declare-fun Unit!11177 () Unit!11174)

(assert (=> b!161928 (= e!111644 Unit!11177)))

(declare-fun lt!255033 () Unit!11174)

(declare-datatypes ((array!8026 0))(
  ( (array!8027 (arr!4521 (Array (_ BitVec 32) (_ BitVec 8))) (size!3600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6368 0))(
  ( (BitStream!6369 (buf!4058 array!8026) (currentByte!7552 (_ BitVec 32)) (currentBit!7547 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6368)

(declare-datatypes ((tuple3!928 0))(
  ( (tuple3!929 (_1!7815 Unit!11174) (_2!7815 (_ BitVec 8)) (_3!581 BitStream!6368)) )
))
(declare-fun lt!255038 () tuple3!928)

(declare-fun arrayUpdatedAtPrefixLemma!160 (array!8026 (_ BitVec 32) (_ BitVec 8)) Unit!11174)

(assert (=> b!161928 (= lt!255033 (arrayUpdatedAtPrefixLemma!160 (buf!4058 thiss!1602) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))))))

(declare-fun arrayRangesEq!552 (array!8026 array!8026 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161928 (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038)))))

(declare-fun lt!255044 () Unit!11174)

(declare-fun lt!255048 () array!8026)

(assert (=> b!161928 (= lt!255044 (arrayUpdatedAtPrefixLemma!160 lt!255048 (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))))))

(declare-fun lt!255043 () (_ BitVec 8))

(declare-fun lt!255041 () (_ BitVec 8))

(assert (=> b!161928 (arrayRangesEq!552 lt!255048 (array!8027 (store (store (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) lt!255043) (currentByte!7552 thiss!1602) lt!255041) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038)))))

(declare-fun lt!255034 () Unit!11174)

(declare-fun arrayRangesEqTransitive!147 (array!8026 array!8026 array!8026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11174)

(assert (=> b!161928 (= lt!255034 (arrayRangesEqTransitive!147 (buf!4058 thiss!1602) lt!255048 (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) (currentByte!7552 (_3!581 lt!255038))))))

(declare-fun res!134981 () Bool)

(assert (=> b!161928 (= res!134981 (arrayRangesEq!552 (buf!4058 thiss!1602) (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(declare-fun e!111648 () Bool)

(assert (=> b!161928 (=> (not res!134981) (not e!111648))))

(assert (=> b!161928 e!111648))

(declare-fun b!161929 () Bool)

(declare-fun e!111646 () Bool)

(declare-fun lt!255036 () (_ BitVec 64))

(declare-fun lt!255047 () (_ BitVec 64))

(assert (=> b!161929 (= e!111646 (or (not (= lt!255036 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!255036 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!255047) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!161929 (= lt!255036 (bvand lt!255047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!161929 (= lt!255047 (bitIndex!0 (size!3600 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) (currentBit!7547 thiss!1602)))))

(declare-fun b!161930 () Bool)

(declare-fun e!111645 () Bool)

(assert (=> b!161930 (= e!111645 e!111646)))

(declare-fun res!134979 () Bool)

(assert (=> b!161930 (=> res!134979 e!111646)))

(assert (=> b!161930 (= res!134979 (not (= (size!3600 (buf!4058 thiss!1602)) (size!3600 (buf!4058 (_3!581 lt!255038))))))))

(declare-fun lt!255035 () Unit!11174)

(assert (=> b!161930 (= lt!255035 e!111644)))

(declare-fun c!8471 () Bool)

(declare-fun lt!255042 () Bool)

(assert (=> b!161930 (= c!8471 lt!255042)))

(declare-fun bm!2729 () Bool)

(assert (=> bm!2729 (= call!2732 (arrayRangesEq!552 (buf!4058 thiss!1602) (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (currentByte!7552 thiss!1602)))))

(declare-fun b!161932 () Bool)

(declare-fun e!111647 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161932 (= e!111647 (byteRangesEq!0 (select (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602)) lt!255041 #b00000000000000000000000000000000 (currentBit!7547 thiss!1602)))))

(declare-fun b!161933 () Bool)

(declare-fun e!111649 () Bool)

(assert (=> b!161933 (= e!111649 (not e!111645))))

(declare-fun res!134980 () Bool)

(assert (=> b!161933 (=> res!134980 e!111645)))

(assert (=> b!161933 (= res!134980 (not (arrayRangesEq!552 (buf!4058 thiss!1602) lt!255048 #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001))))))

(declare-fun lt!255045 () (_ BitVec 8))

(assert (=> b!161933 (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001))))

(declare-fun lt!255037 () Unit!11174)

(assert (=> b!161933 (= lt!255037 (arrayUpdatedAtPrefixLemma!160 (buf!4058 thiss!1602) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045))))

(assert (=> b!161933 (= lt!255045 (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!255046 () (_ BitVec 8))

(declare-fun lt!255040 () (_ BitVec 32))

(declare-fun lt!255039 () (_ BitVec 32))

(declare-fun Unit!11178 () Unit!11174)

(declare-fun Unit!11179 () Unit!11174)

(assert (=> b!161933 (= lt!255038 (ite lt!255042 (let ((bdg!9748 ((_ extract 7 0) (bvnot lt!255040)))) (let ((bdg!9749 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) lt!255043) (currentByte!7552 thiss!1602) lt!255041) (bvadd #b00000000000000000000000000000001 (currentByte!7552 thiss!1602)))) ((_ sign_extend 24) bdg!9748))))) (tuple3!929 Unit!11178 bdg!9748 (BitStream!6369 (array!8027 (store (arr!4521 (array!8027 (store (arr!4521 lt!255048) (bvadd #b00000000000000000000000000000001 (currentByte!7552 thiss!1602)) bdg!9749) (size!3600 lt!255048))) (bvadd #b00000000000000000000000000000001 (currentByte!7552 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9749) (bvshl ((_ sign_extend 24) v!222) lt!255039)))) (size!3600 (array!8027 (store (arr!4521 lt!255048) (bvadd #b00000000000000000000000000000001 (currentByte!7552 thiss!1602)) bdg!9749) (size!3600 lt!255048)))) (bvadd #b00000000000000000000000000000001 (currentByte!7552 thiss!1602)) (currentBit!7547 thiss!1602))))) (tuple3!929 Unit!11179 lt!255046 (BitStream!6369 lt!255048 (bvadd #b00000000000000000000000000000001 (currentByte!7552 thiss!1602)) (currentBit!7547 thiss!1602)))))))

(declare-fun lt!255032 () (_ BitVec 32))

(assert (=> b!161933 (= lt!255042 (bvsgt lt!255032 #b00000000000000000000000000000000))))

(assert (=> b!161933 e!111647))

(declare-fun res!134978 () Bool)

(assert (=> b!161933 (=> res!134978 e!111647)))

(assert (=> b!161933 (= res!134978 (bvsge (currentByte!7552 thiss!1602) (size!3600 (buf!4058 thiss!1602))))))

(assert (=> b!161933 (= lt!255048 (array!8027 (store (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) lt!255043) (currentByte!7552 thiss!1602) lt!255041) (size!3600 (buf!4058 thiss!1602))))))

(assert (=> b!161933 (= lt!255041 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!255043) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!255032))))))

(assert (=> b!161933 (= lt!255043 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602))) lt!255040)))))

(assert (=> b!161933 (= lt!255040 ((_ sign_extend 24) lt!255046))))

(assert (=> b!161933 (= lt!255046 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!255039)))))))

(assert (=> b!161933 (= lt!255039 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!255032))))))

(assert (=> b!161933 (= lt!255032 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7547 thiss!1602))))))

(declare-fun b!161934 () Bool)

(declare-fun e!111650 () Bool)

(declare-fun array_inv!3347 (array!8026) Bool)

(assert (=> b!161934 (= e!111650 (array_inv!3347 (buf!4058 thiss!1602)))))

(declare-fun b!161931 () Bool)

(assert (=> b!161931 (= e!111648 call!2732)))

(declare-fun res!134977 () Bool)

(assert (=> start!33888 (=> (not res!134977) (not e!111649))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33888 (= res!134977 (validate_offset_byte!0 ((_ sign_extend 32) (size!3600 (buf!4058 thiss!1602))) ((_ sign_extend 32) (currentByte!7552 thiss!1602)) ((_ sign_extend 32) (currentBit!7547 thiss!1602))))))

(assert (=> start!33888 e!111649))

(declare-fun inv!12 (BitStream!6368) Bool)

(assert (=> start!33888 (and (inv!12 thiss!1602) e!111650)))

(assert (=> start!33888 true))

(assert (= (and start!33888 res!134977) b!161933))

(assert (= (and b!161933 (not res!134978)) b!161932))

(assert (= (and b!161933 (not res!134980)) b!161930))

(assert (= (and b!161930 c!8471) b!161928))

(assert (= (and b!161930 (not c!8471)) b!161927))

(assert (= (and b!161928 res!134981) b!161931))

(assert (= (or b!161931 b!161927) bm!2729))

(assert (= (and b!161930 (not res!134979)) b!161929))

(assert (= start!33888 b!161934))

(declare-fun m!256953 () Bool)

(assert (=> b!161934 m!256953))

(declare-fun m!256955 () Bool)

(assert (=> b!161929 m!256955))

(declare-fun m!256957 () Bool)

(assert (=> b!161933 m!256957))

(declare-fun m!256959 () Bool)

(assert (=> b!161933 m!256959))

(declare-fun m!256961 () Bool)

(assert (=> b!161933 m!256961))

(declare-fun m!256963 () Bool)

(assert (=> b!161933 m!256963))

(declare-fun m!256965 () Bool)

(assert (=> b!161933 m!256965))

(declare-fun m!256967 () Bool)

(assert (=> b!161933 m!256967))

(declare-fun m!256969 () Bool)

(assert (=> b!161933 m!256969))

(declare-fun m!256971 () Bool)

(assert (=> b!161933 m!256971))

(declare-fun m!256973 () Bool)

(assert (=> b!161933 m!256973))

(declare-fun m!256975 () Bool)

(assert (=> b!161933 m!256975))

(declare-fun m!256977 () Bool)

(assert (=> b!161933 m!256977))

(declare-fun m!256979 () Bool)

(assert (=> b!161933 m!256979))

(declare-fun m!256981 () Bool)

(assert (=> bm!2729 m!256981))

(declare-fun m!256983 () Bool)

(assert (=> start!33888 m!256983))

(declare-fun m!256985 () Bool)

(assert (=> start!33888 m!256985))

(declare-fun m!256987 () Bool)

(assert (=> b!161928 m!256987))

(declare-fun m!256989 () Bool)

(assert (=> b!161928 m!256989))

(declare-fun m!256991 () Bool)

(assert (=> b!161928 m!256991))

(assert (=> b!161928 m!256991))

(declare-fun m!256993 () Bool)

(assert (=> b!161928 m!256993))

(declare-fun m!256995 () Bool)

(assert (=> b!161928 m!256995))

(assert (=> b!161928 m!256961))

(assert (=> b!161928 m!256991))

(declare-fun m!256997 () Bool)

(assert (=> b!161928 m!256997))

(declare-fun m!256999 () Bool)

(assert (=> b!161928 m!256999))

(assert (=> b!161928 m!256965))

(declare-fun m!257001 () Bool)

(assert (=> b!161928 m!257001))

(declare-fun m!257003 () Bool)

(assert (=> b!161928 m!257003))

(assert (=> b!161932 m!256967))

(assert (=> b!161932 m!256967))

(declare-fun m!257005 () Bool)

(assert (=> b!161932 m!257005))

(push 1)

(assert (not b!161934))

(assert (not b!161929))

(assert (not b!161932))

(assert (not b!161928))

(assert (not b!161933))

(assert (not bm!2729))

(assert (not start!33888))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55417 () Bool)

(assert (=> d!55417 (= (byteRangesEq!0 (select (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602)) lt!255041 #b00000000000000000000000000000000 (currentBit!7547 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7547 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7547 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!255041) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7547 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13787 () Bool)

(assert (= bs!13787 d!55417))

(declare-fun m!257053 () Bool)

(assert (=> bs!13787 m!257053))

(declare-fun m!257055 () Bool)

(assert (=> bs!13787 m!257055))

(assert (=> b!161932 d!55417))

(declare-fun d!55419 () Bool)

(declare-fun res!135013 () Bool)

(declare-fun e!111680 () Bool)

(assert (=> d!55419 (=> res!135013 e!111680)))

(assert (=> d!55419 (= res!135013 (= #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))))))

(assert (=> d!55419 (= (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))) e!111680)))

(declare-fun b!161966 () Bool)

(declare-fun e!111681 () Bool)

(assert (=> b!161966 (= e!111680 e!111681)))

(declare-fun res!135014 () Bool)

(assert (=> b!161966 (=> (not res!135014) (not e!111681))))

(assert (=> b!161966 (= res!135014 (= (select (arr!4521 (buf!4058 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4521 (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161967 () Bool)

(assert (=> b!161967 (= e!111681 (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7552 (_3!581 lt!255038))))))

(assert (= (and d!55419 (not res!135013)) b!161966))

(assert (= (and b!161966 res!135014) b!161967))

(declare-fun m!257057 () Bool)

(assert (=> b!161966 m!257057))

(declare-fun m!257059 () Bool)

(assert (=> b!161966 m!257059))

(declare-fun m!257061 () Bool)

(assert (=> b!161967 m!257061))

(assert (=> b!161928 d!55419))

(declare-fun d!55421 () Bool)

(declare-fun res!135015 () Bool)

(declare-fun e!111682 () Bool)

(assert (=> d!55421 (=> res!135015 e!111682)))

(assert (=> d!55421 (= res!135015 (= #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(assert (=> d!55421 (= (arrayRangesEq!552 (buf!4058 thiss!1602) (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)) e!111682)))

(declare-fun b!161968 () Bool)

(declare-fun e!111683 () Bool)

(assert (=> b!161968 (= e!111682 e!111683)))

(declare-fun res!135016 () Bool)

(assert (=> b!161968 (=> (not res!135016) (not e!111683))))

(assert (=> b!161968 (= res!135016 (= (select (arr!4521 (buf!4058 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) #b00000000000000000000000000000000)))))

(declare-fun b!161969 () Bool)

(assert (=> b!161969 (= e!111683 (arrayRangesEq!552 (buf!4058 thiss!1602) (buf!4058 (_3!581 lt!255038)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(assert (= (and d!55421 (not res!135015)) b!161968))

(assert (= (and b!161968 res!135016) b!161969))

(assert (=> b!161968 m!257057))

(declare-fun m!257063 () Bool)

(assert (=> b!161968 m!257063))

(declare-fun m!257065 () Bool)

(assert (=> b!161969 m!257065))

(assert (=> b!161928 d!55421))

(declare-fun d!55423 () Bool)

(declare-fun e!111686 () Bool)

(assert (=> d!55423 e!111686))

(declare-fun res!135019 () Bool)

(assert (=> d!55423 (=> (not res!135019) (not e!111686))))

(assert (=> d!55423 (= res!135019 (and (bvsge (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000000) (bvslt (currentByte!7552 (_3!581 lt!255038)) (size!3600 (buf!4058 thiss!1602)))))))

(declare-fun lt!255077 () Unit!11174)

(declare-fun choose!172 (array!8026 (_ BitVec 32) (_ BitVec 8)) Unit!11174)

(assert (=> d!55423 (= lt!255077 (choose!172 (buf!4058 thiss!1602) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))))))

(assert (=> d!55423 (and (bvsle #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))) (bvslt (currentByte!7552 (_3!581 lt!255038)) (size!3600 (buf!4058 thiss!1602))))))

(assert (=> d!55423 (= (arrayUpdatedAtPrefixLemma!160 (buf!4058 thiss!1602) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) lt!255077)))

(declare-fun b!161972 () Bool)

(assert (=> b!161972 (= e!111686 (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))))))

(assert (= (and d!55423 res!135019) b!161972))

(assert (=> d!55423 m!256991))

(declare-fun m!257067 () Bool)

(assert (=> d!55423 m!257067))

(assert (=> b!161972 m!257003))

(assert (=> b!161972 m!256989))

(assert (=> b!161928 d!55423))

(declare-fun d!55425 () Bool)

(assert (=> d!55425 (arrayRangesEq!552 (buf!4058 thiss!1602) (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001))))

(declare-fun lt!255080 () Unit!11174)

(declare-fun choose!173 (array!8026 array!8026 array!8026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11174)

(assert (=> d!55425 (= lt!255080 (choose!173 (buf!4058 thiss!1602) lt!255048 (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) (currentByte!7552 (_3!581 lt!255038))))))

(assert (=> d!55425 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) (currentByte!7552 (_3!581 lt!255038))))))

(assert (=> d!55425 (= (arrayRangesEqTransitive!147 (buf!4058 thiss!1602) lt!255048 (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) (currentByte!7552 (_3!581 lt!255038))) lt!255080)))

(declare-fun bs!13788 () Bool)

(assert (= bs!13788 d!55425))

(assert (=> bs!13788 m!256995))

(declare-fun m!257069 () Bool)

(assert (=> bs!13788 m!257069))

(assert (=> b!161928 d!55425))

(declare-fun d!55427 () Bool)

(declare-fun res!135020 () Bool)

(declare-fun e!111687 () Bool)

(assert (=> d!55427 (=> res!135020 e!111687)))

(assert (=> d!55427 (= res!135020 (= #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))))))

(assert (=> d!55427 (= (arrayRangesEq!552 lt!255048 (array!8027 (store (store (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) lt!255043) (currentByte!7552 thiss!1602) lt!255041) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))) e!111687)))

(declare-fun b!161973 () Bool)

(declare-fun e!111688 () Bool)

(assert (=> b!161973 (= e!111687 e!111688)))

(declare-fun res!135021 () Bool)

(assert (=> b!161973 (=> (not res!135021) (not e!111688))))

(assert (=> b!161973 (= res!135021 (= (select (arr!4521 lt!255048) #b00000000000000000000000000000000) (select (arr!4521 (array!8027 (store (store (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) lt!255043) (currentByte!7552 thiss!1602) lt!255041) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161974 () Bool)

(assert (=> b!161974 (= e!111688 (arrayRangesEq!552 lt!255048 (array!8027 (store (store (store (arr!4521 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) lt!255043) (currentByte!7552 thiss!1602) lt!255041) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 (buf!4058 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7552 (_3!581 lt!255038))))))

(assert (= (and d!55427 (not res!135020)) b!161973))

(assert (= (and b!161973 res!135021) b!161974))

(declare-fun m!257071 () Bool)

(assert (=> b!161973 m!257071))

(declare-fun m!257073 () Bool)

(assert (=> b!161973 m!257073))

(declare-fun m!257075 () Bool)

(assert (=> b!161974 m!257075))

(assert (=> b!161928 d!55427))

(declare-fun d!55429 () Bool)

(declare-fun e!111689 () Bool)

(assert (=> d!55429 e!111689))

(declare-fun res!135022 () Bool)

(assert (=> d!55429 (=> (not res!135022) (not e!111689))))

(assert (=> d!55429 (= res!135022 (and (bvsge (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000000) (bvslt (currentByte!7552 (_3!581 lt!255038)) (size!3600 lt!255048))))))

(declare-fun lt!255081 () Unit!11174)

(assert (=> d!55429 (= lt!255081 (choose!172 lt!255048 (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))))))

(assert (=> d!55429 (and (bvsle #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))) (bvslt (currentByte!7552 (_3!581 lt!255038)) (size!3600 lt!255048)))))

(assert (=> d!55429 (= (arrayUpdatedAtPrefixLemma!160 lt!255048 (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) lt!255081)))

(declare-fun b!161975 () Bool)

(assert (=> b!161975 (= e!111689 (arrayRangesEq!552 lt!255048 (array!8027 (store (arr!4521 lt!255048) (currentByte!7552 (_3!581 lt!255038)) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) (currentByte!7552 (_3!581 lt!255038)))) (size!3600 lt!255048)) #b00000000000000000000000000000000 (currentByte!7552 (_3!581 lt!255038))))))

(assert (= (and d!55429 res!135022) b!161975))

(assert (=> d!55429 m!256991))

(declare-fun m!257077 () Bool)

(assert (=> d!55429 m!257077))

(declare-fun m!257079 () Bool)

(assert (=> b!161975 m!257079))

(declare-fun m!257081 () Bool)

(assert (=> b!161975 m!257081))

(assert (=> b!161928 d!55429))

(declare-fun d!55431 () Bool)

(declare-fun e!111692 () Bool)

(assert (=> d!55431 e!111692))

(declare-fun res!135028 () Bool)

(assert (=> d!55431 (=> (not res!135028) (not e!111692))))

(declare-fun lt!255097 () (_ BitVec 64))

(declare-fun lt!255095 () (_ BitVec 64))

(declare-fun lt!255094 () (_ BitVec 64))

(assert (=> d!55431 (= res!135028 (= lt!255094 (bvsub lt!255097 lt!255095)))))

(assert (=> d!55431 (or (= (bvand lt!255097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255097 lt!255095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55431 (= lt!255095 (remainingBits!0 ((_ sign_extend 32) (size!3600 (buf!4058 thiss!1602))) ((_ sign_extend 32) (currentByte!7552 thiss!1602)) ((_ sign_extend 32) (currentBit!7547 thiss!1602))))))

(declare-fun lt!255096 () (_ BitVec 64))

(declare-fun lt!255099 () (_ BitVec 64))

(assert (=> d!55431 (= lt!255097 (bvmul lt!255096 lt!255099))))

(assert (=> d!55431 (or (= lt!255096 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255099 (bvsdiv (bvmul lt!255096 lt!255099) lt!255096)))))

(assert (=> d!55431 (= lt!255099 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55431 (= lt!255096 ((_ sign_extend 32) (size!3600 (buf!4058 thiss!1602))))))

(assert (=> d!55431 (= lt!255094 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7552 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7547 thiss!1602))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55431 (invariant!0 (currentBit!7547 thiss!1602) (currentByte!7552 thiss!1602) (size!3600 (buf!4058 thiss!1602)))))

(assert (=> d!55431 (= (bitIndex!0 (size!3600 (buf!4058 thiss!1602)) (currentByte!7552 thiss!1602) (currentBit!7547 thiss!1602)) lt!255094)))

(declare-fun b!161980 () Bool)

(declare-fun res!135027 () Bool)

(assert (=> b!161980 (=> (not res!135027) (not e!111692))))

(assert (=> b!161980 (= res!135027 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255094))))

(declare-fun b!161981 () Bool)

(declare-fun lt!255098 () (_ BitVec 64))

(assert (=> b!161981 (= e!111692 (bvsle lt!255094 (bvmul lt!255098 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!161981 (or (= lt!255098 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255098 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255098)))))

(assert (=> b!161981 (= lt!255098 ((_ sign_extend 32) (size!3600 (buf!4058 thiss!1602))))))

(assert (= (and d!55431 res!135028) b!161980))

(assert (= (and b!161980 res!135027) b!161981))

(declare-fun m!257083 () Bool)

(assert (=> d!55431 m!257083))

(declare-fun m!257085 () Bool)

(assert (=> d!55431 m!257085))

(assert (=> b!161929 d!55431))

(declare-fun d!55433 () Bool)

(declare-fun res!135029 () Bool)

(declare-fun e!111693 () Bool)

(assert (=> d!55433 (=> res!135029 e!111693)))

(assert (=> d!55433 (= res!135029 (= #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(assert (=> d!55433 (= (arrayRangesEq!552 (buf!4058 thiss!1602) lt!255048 #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)) e!111693)))

(declare-fun b!161982 () Bool)

(declare-fun e!111694 () Bool)

(assert (=> b!161982 (= e!111693 e!111694)))

(declare-fun res!135030 () Bool)

(assert (=> b!161982 (=> (not res!135030) (not e!111694))))

(assert (=> b!161982 (= res!135030 (= (select (arr!4521 (buf!4058 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4521 lt!255048) #b00000000000000000000000000000000)))))

(declare-fun b!161983 () Bool)

(assert (=> b!161983 (= e!111694 (arrayRangesEq!552 (buf!4058 thiss!1602) lt!255048 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(assert (= (and d!55433 (not res!135029)) b!161982))

(assert (= (and b!161982 res!135030) b!161983))

(assert (=> b!161982 m!257057))

(assert (=> b!161982 m!257071))

(declare-fun m!257087 () Bool)

(assert (=> b!161983 m!257087))

(assert (=> b!161933 d!55433))

(declare-fun d!55435 () Bool)

(declare-fun res!135031 () Bool)

(declare-fun e!111695 () Bool)

(assert (=> d!55435 (=> res!135031 e!111695)))

(assert (=> d!55435 (= res!135031 (= #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(assert (=> d!55435 (= (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)) e!111695)))

(declare-fun b!161984 () Bool)

(declare-fun e!111696 () Bool)

(assert (=> b!161984 (= e!111695 e!111696)))

(declare-fun res!135032 () Bool)

(assert (=> b!161984 (=> (not res!135032) (not e!111696))))

(assert (=> b!161984 (= res!135032 (= (select (arr!4521 (buf!4058 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4521 (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045) (size!3600 (buf!4058 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161985 () Bool)

(assert (=> b!161985 (= e!111696 (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045) (size!3600 (buf!4058 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(assert (= (and d!55435 (not res!135031)) b!161984))

(assert (= (and b!161984 res!135032) b!161985))

(assert (=> b!161984 m!257057))

(declare-fun m!257089 () Bool)

(assert (=> b!161984 m!257089))

(declare-fun m!257091 () Bool)

(assert (=> b!161985 m!257091))

(assert (=> b!161933 d!55435))

(declare-fun d!55437 () Bool)

(declare-fun e!111697 () Bool)

(assert (=> d!55437 e!111697))

(declare-fun res!135033 () Bool)

(assert (=> d!55437 (=> (not res!135033) (not e!111697))))

(assert (=> d!55437 (= res!135033 (and (bvsge (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) (size!3600 (buf!4058 thiss!1602)))))))

(declare-fun lt!255100 () Unit!11174)

(assert (=> d!55437 (= lt!255100 (choose!172 (buf!4058 thiss!1602) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045))))

(assert (=> d!55437 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) (size!3600 (buf!4058 thiss!1602))))))

(assert (=> d!55437 (= (arrayUpdatedAtPrefixLemma!160 (buf!4058 thiss!1602) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045) lt!255100)))

(declare-fun b!161986 () Bool)

(assert (=> b!161986 (= e!111697 (arrayRangesEq!552 (buf!4058 thiss!1602) (array!8027 (store (arr!4521 (buf!4058 thiss!1602)) (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001) lt!255045) (size!3600 (buf!4058 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7552 (_3!581 lt!255038)) #b00000000000000000000000000000001)))))

(assert (= (and d!55437 res!135033) b!161986))

(declare-fun m!257093 () Bool)

(assert (=> d!55437 m!257093))

(assert (=> b!161986 m!256959))

(assert (=> b!161986 m!256971))

(assert (=> b!161933 d!55437))

(declare-fun d!55439 () Bool)

(assert (=> d!55439 (= (array_inv!3347 (buf!4058 thiss!1602)) (bvsge (size!3600 (buf!4058 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161934 d!55439))

(declare-fun d!55441 () Bool)

(assert (=> d!55441 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3600 (buf!4058 thiss!1602))) ((_ sign_extend 32) (currentByte!7552 thiss!1602)) ((_ sign_extend 32) (currentBit!7547 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3600 (buf!4058 thiss!1602))) ((_ sign_extend 32) (currentByte!7552 thiss!1602)) ((_ sign_extend 32) (currentBit!7547 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13789 () Bool)

(assert (= bs!13789 d!55441))

(assert (=> bs!13789 m!257083))

(assert (=> start!33888 d!55441))

(declare-fun d!55443 () Bool)

(assert (=> d!55443 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7547 thiss!1602) (currentByte!7552 thiss!1602) (size!3600 (buf!4058 thiss!1602))))))

(declare-fun bs!13790 () Bool)

(assert (= bs!13790 d!55443))

(assert (=> bs!13790 m!257085))

(assert (=> start!33888 d!55443))

(declare-fun d!55445 () Bool)

(declare-fun res!135034 () Bool)

(declare-fun e!111698 () Bool)

(assert (=> d!55445 (=> res!135034 e!111698)))

(assert (=> d!55445 (= res!135034 (= #b00000000000000000000000000000000 (currentByte!7552 thiss!1602)))))

(assert (=> d!55445 (= (arrayRangesEq!552 (buf!4058 thiss!1602) (buf!4058 (_3!581 lt!255038)) #b00000000000000000000000000000000 (currentByte!7552 thiss!1602)) e!111698)))

(declare-fun b!161987 () Bool)

(declare-fun e!111699 () Bool)

(assert (=> b!161987 (= e!111698 e!111699)))

(declare-fun res!135035 () Bool)

(assert (=> b!161987 (=> (not res!135035) (not e!111699))))

(assert (=> b!161987 (= res!135035 (= (select (arr!4521 (buf!4058 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4521 (buf!4058 (_3!581 lt!255038))) #b00000000000000000000000000000000)))))

(declare-fun b!161988 () Bool)

(assert (=> b!161988 (= e!111699 (arrayRangesEq!552 (buf!4058 thiss!1602) (buf!4058 (_3!581 lt!255038)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7552 thiss!1602)))))

(assert (= (and d!55445 (not res!135034)) b!161987))

(assert (= (and b!161987 res!135035) b!161988))

(assert (=> b!161987 m!257057))

(assert (=> b!161987 m!257063))

(declare-fun m!257095 () Bool)

(assert (=> b!161988 m!257095))

(assert (=> bm!2729 d!55445))

(push 1)

(assert (not b!161983))

(assert (not b!161972))

(assert (not b!161967))

(assert (not b!161974))

(assert (not b!161975))

(assert (not d!55423))

(assert (not d!55437))

(assert (not d!55429))

(assert (not d!55441))

(assert (not d!55431))

(assert (not b!161969))

(assert (not b!161986))

(assert (not d!55443))

(assert (not b!161988))

(assert (not b!161985))

(assert (not d!55425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

