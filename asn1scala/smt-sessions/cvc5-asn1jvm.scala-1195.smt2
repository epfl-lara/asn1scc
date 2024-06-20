; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33884 () Bool)

(assert start!33884)

(declare-fun b!161879 () Bool)

(declare-datatypes ((Unit!11162 0))(
  ( (Unit!11163) )
))
(declare-fun e!111599 () Unit!11162)

(declare-fun Unit!11164 () Unit!11162)

(assert (=> b!161879 (= e!111599 Unit!11164)))

(declare-fun call!2726 () Bool)

(assert (=> b!161879 call!2726))

(declare-fun b!161880 () Bool)

(declare-fun e!111600 () Bool)

(declare-fun e!111601 () Bool)

(assert (=> b!161880 (= e!111600 e!111601)))

(declare-fun res!134950 () Bool)

(assert (=> b!161880 (=> res!134950 e!111601)))

(declare-datatypes ((array!8022 0))(
  ( (array!8023 (arr!4519 (Array (_ BitVec 32) (_ BitVec 8))) (size!3598 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6364 0))(
  ( (BitStream!6365 (buf!4056 array!8022) (currentByte!7550 (_ BitVec 32)) (currentBit!7545 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6364)

(declare-datatypes ((tuple3!924 0))(
  ( (tuple3!925 (_1!7813 Unit!11162) (_2!7813 (_ BitVec 8)) (_3!579 BitStream!6364)) )
))
(declare-fun lt!254938 () tuple3!924)

(assert (=> b!161880 (= res!134950 (not (= (size!3598 (buf!4056 thiss!1602)) (size!3598 (buf!4056 (_3!579 lt!254938))))))))

(declare-fun lt!254942 () Unit!11162)

(assert (=> b!161880 (= lt!254942 e!111599)))

(declare-fun c!8465 () Bool)

(declare-fun lt!254945 () Bool)

(assert (=> b!161880 (= c!8465 lt!254945)))

(declare-fun res!134949 () Bool)

(declare-fun e!111598 () Bool)

(assert (=> start!33884 (=> (not res!134949) (not e!111598))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33884 (= res!134949 (validate_offset_byte!0 ((_ sign_extend 32) (size!3598 (buf!4056 thiss!1602))) ((_ sign_extend 32) (currentByte!7550 thiss!1602)) ((_ sign_extend 32) (currentBit!7545 thiss!1602))))))

(assert (=> start!33884 e!111598))

(declare-fun e!111602 () Bool)

(declare-fun inv!12 (BitStream!6364) Bool)

(assert (=> start!33884 (and (inv!12 thiss!1602) e!111602)))

(assert (=> start!33884 true))

(declare-fun bm!2723 () Bool)

(declare-fun arrayRangesEq!550 (array!8022 array!8022 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2723 (= call!2726 (arrayRangesEq!550 (buf!4056 thiss!1602) (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (ite c!8465 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 thiss!1602))))))

(declare-fun b!161881 () Bool)

(assert (=> b!161881 (= e!111598 (not e!111600))))

(declare-fun res!134947 () Bool)

(assert (=> b!161881 (=> res!134947 e!111600)))

(declare-fun lt!254939 () array!8022)

(assert (=> b!161881 (= res!134947 (not (arrayRangesEq!550 (buf!4056 thiss!1602) lt!254939 #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001))))))

(declare-fun lt!254944 () (_ BitVec 8))

(assert (=> b!161881 (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001))))

(declare-fun lt!254943 () Unit!11162)

(declare-fun arrayUpdatedAtPrefixLemma!158 (array!8022 (_ BitVec 32) (_ BitVec 8)) Unit!11162)

(assert (=> b!161881 (= lt!254943 (arrayUpdatedAtPrefixLemma!158 (buf!4056 thiss!1602) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944))))

(assert (=> b!161881 (= lt!254944 (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)))))

(declare-fun lt!254933 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254935 () (_ BitVec 8))

(declare-fun lt!254937 () (_ BitVec 8))

(declare-fun lt!254934 () (_ BitVec 32))

(declare-fun lt!254930 () (_ BitVec 32))

(declare-fun Unit!11165 () Unit!11162)

(declare-fun Unit!11166 () Unit!11162)

(assert (=> b!161881 (= lt!254938 (ite lt!254945 (let ((bdg!9748 ((_ extract 7 0) (bvnot lt!254930)))) (let ((bdg!9749 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) lt!254935) (currentByte!7550 thiss!1602) lt!254933) (bvadd #b00000000000000000000000000000001 (currentByte!7550 thiss!1602)))) ((_ sign_extend 24) bdg!9748))))) (tuple3!925 Unit!11165 bdg!9748 (BitStream!6365 (array!8023 (store (arr!4519 (array!8023 (store (arr!4519 lt!254939) (bvadd #b00000000000000000000000000000001 (currentByte!7550 thiss!1602)) bdg!9749) (size!3598 lt!254939))) (bvadd #b00000000000000000000000000000001 (currentByte!7550 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9749) (bvshl ((_ sign_extend 24) v!222) lt!254934)))) (size!3598 (array!8023 (store (arr!4519 lt!254939) (bvadd #b00000000000000000000000000000001 (currentByte!7550 thiss!1602)) bdg!9749) (size!3598 lt!254939)))) (bvadd #b00000000000000000000000000000001 (currentByte!7550 thiss!1602)) (currentBit!7545 thiss!1602))))) (tuple3!925 Unit!11166 lt!254937 (BitStream!6365 lt!254939 (bvadd #b00000000000000000000000000000001 (currentByte!7550 thiss!1602)) (currentBit!7545 thiss!1602)))))))

(declare-fun lt!254936 () (_ BitVec 32))

(assert (=> b!161881 (= lt!254945 (bvsgt lt!254936 #b00000000000000000000000000000000))))

(declare-fun e!111597 () Bool)

(assert (=> b!161881 e!111597))

(declare-fun res!134948 () Bool)

(assert (=> b!161881 (=> res!134948 e!111597)))

(assert (=> b!161881 (= res!134948 (bvsge (currentByte!7550 thiss!1602) (size!3598 (buf!4056 thiss!1602))))))

(assert (=> b!161881 (= lt!254939 (array!8023 (store (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) lt!254935) (currentByte!7550 thiss!1602) lt!254933) (size!3598 (buf!4056 thiss!1602))))))

(assert (=> b!161881 (= lt!254933 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254935) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254936))))))

(assert (=> b!161881 (= lt!254935 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602))) lt!254930)))))

(assert (=> b!161881 (= lt!254930 ((_ sign_extend 24) lt!254937))))

(assert (=> b!161881 (= lt!254937 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254934)))))))

(assert (=> b!161881 (= lt!254934 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254936))))))

(assert (=> b!161881 (= lt!254936 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7545 thiss!1602))))))

(declare-fun b!161882 () Bool)

(declare-fun lt!254941 () (_ BitVec 64))

(declare-fun lt!254946 () (_ BitVec 64))

(assert (=> b!161882 (= e!111601 (or (not (= lt!254941 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!254941 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!254946) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!161882 (= lt!254941 (bvand lt!254946 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!161882 (= lt!254946 (bitIndex!0 (size!3598 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) (currentBit!7545 thiss!1602)))))

(declare-fun b!161883 () Bool)

(declare-fun Unit!11167 () Unit!11162)

(assert (=> b!161883 (= e!111599 Unit!11167)))

(declare-fun lt!254932 () Unit!11162)

(assert (=> b!161883 (= lt!254932 (arrayUpdatedAtPrefixLemma!158 (buf!4056 thiss!1602) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))))))

(assert (=> b!161883 (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938)))))

(declare-fun lt!254931 () Unit!11162)

(assert (=> b!161883 (= lt!254931 (arrayUpdatedAtPrefixLemma!158 lt!254939 (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))))))

(assert (=> b!161883 (arrayRangesEq!550 lt!254939 (array!8023 (store (store (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) lt!254935) (currentByte!7550 thiss!1602) lt!254933) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938)))))

(declare-fun lt!254940 () Unit!11162)

(declare-fun arrayRangesEqTransitive!145 (array!8022 array!8022 array!8022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11162)

(assert (=> b!161883 (= lt!254940 (arrayRangesEqTransitive!145 (buf!4056 thiss!1602) lt!254939 (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 (_3!579 lt!254938))))))

(declare-fun res!134951 () Bool)

(assert (=> b!161883 (= res!134951 call!2726)))

(declare-fun e!111603 () Bool)

(assert (=> b!161883 (=> (not res!134951) (not e!111603))))

(assert (=> b!161883 e!111603))

(declare-fun b!161884 () Bool)

(assert (=> b!161884 (= e!111603 (arrayRangesEq!550 (buf!4056 thiss!1602) (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (currentByte!7550 thiss!1602)))))

(declare-fun b!161885 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161885 (= e!111597 (byteRangesEq!0 (select (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602)) lt!254933 #b00000000000000000000000000000000 (currentBit!7545 thiss!1602)))))

(declare-fun b!161886 () Bool)

(declare-fun array_inv!3345 (array!8022) Bool)

(assert (=> b!161886 (= e!111602 (array_inv!3345 (buf!4056 thiss!1602)))))

(assert (= (and start!33884 res!134949) b!161881))

(assert (= (and b!161881 (not res!134948)) b!161885))

(assert (= (and b!161881 (not res!134947)) b!161880))

(assert (= (and b!161880 c!8465) b!161883))

(assert (= (and b!161880 (not c!8465)) b!161879))

(assert (= (and b!161883 res!134951) b!161884))

(assert (= (or b!161883 b!161879) bm!2723))

(assert (= (and b!161880 (not res!134950)) b!161882))

(assert (= start!33884 b!161886))

(declare-fun m!256845 () Bool)

(assert (=> b!161885 m!256845))

(assert (=> b!161885 m!256845))

(declare-fun m!256847 () Bool)

(assert (=> b!161885 m!256847))

(declare-fun m!256849 () Bool)

(assert (=> b!161886 m!256849))

(declare-fun m!256851 () Bool)

(assert (=> b!161881 m!256851))

(declare-fun m!256853 () Bool)

(assert (=> b!161881 m!256853))

(declare-fun m!256855 () Bool)

(assert (=> b!161881 m!256855))

(declare-fun m!256857 () Bool)

(assert (=> b!161881 m!256857))

(declare-fun m!256859 () Bool)

(assert (=> b!161881 m!256859))

(declare-fun m!256861 () Bool)

(assert (=> b!161881 m!256861))

(declare-fun m!256863 () Bool)

(assert (=> b!161881 m!256863))

(assert (=> b!161881 m!256845))

(declare-fun m!256865 () Bool)

(assert (=> b!161881 m!256865))

(declare-fun m!256867 () Bool)

(assert (=> b!161881 m!256867))

(declare-fun m!256869 () Bool)

(assert (=> b!161881 m!256869))

(declare-fun m!256871 () Bool)

(assert (=> b!161881 m!256871))

(declare-fun m!256873 () Bool)

(assert (=> b!161883 m!256873))

(declare-fun m!256875 () Bool)

(assert (=> b!161883 m!256875))

(assert (=> b!161883 m!256857))

(declare-fun m!256877 () Bool)

(assert (=> b!161883 m!256877))

(assert (=> b!161883 m!256873))

(declare-fun m!256879 () Bool)

(assert (=> b!161883 m!256879))

(declare-fun m!256881 () Bool)

(assert (=> b!161883 m!256881))

(declare-fun m!256883 () Bool)

(assert (=> b!161883 m!256883))

(assert (=> b!161883 m!256865))

(assert (=> b!161883 m!256873))

(declare-fun m!256885 () Bool)

(assert (=> b!161883 m!256885))

(declare-fun m!256887 () Bool)

(assert (=> b!161883 m!256887))

(declare-fun m!256889 () Bool)

(assert (=> bm!2723 m!256889))

(declare-fun m!256891 () Bool)

(assert (=> b!161884 m!256891))

(declare-fun m!256893 () Bool)

(assert (=> start!33884 m!256893))

(declare-fun m!256895 () Bool)

(assert (=> start!33884 m!256895))

(declare-fun m!256897 () Bool)

(assert (=> b!161882 m!256897))

(push 1)

(assert (not start!33884))

(assert (not b!161882))

(assert (not b!161885))

(assert (not bm!2723))

(assert (not b!161886))

(assert (not b!161883))

(assert (not b!161884))

(assert (not b!161881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55447 () Bool)

(declare-fun res!135040 () Bool)

(declare-fun e!111704 () Bool)

(assert (=> d!55447 (=> res!135040 e!111704)))

(assert (=> d!55447 (= res!135040 (= #b00000000000000000000000000000000 (ite c!8465 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 thiss!1602))))))

(assert (=> d!55447 (= (arrayRangesEq!550 (buf!4056 thiss!1602) (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (ite c!8465 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 thiss!1602))) e!111704)))

(declare-fun b!161993 () Bool)

(declare-fun e!111705 () Bool)

(assert (=> b!161993 (= e!111704 e!111705)))

(declare-fun res!135041 () Bool)

(assert (=> b!161993 (=> (not res!135041) (not e!111705))))

(assert (=> b!161993 (= res!135041 (= (select (arr!4519 (buf!4056 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) #b00000000000000000000000000000000)))))

(declare-fun b!161994 () Bool)

(assert (=> b!161994 (= e!111705 (arrayRangesEq!550 (buf!4056 thiss!1602) (buf!4056 (_3!579 lt!254938)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8465 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 thiss!1602))))))

(assert (= (and d!55447 (not res!135040)) b!161993))

(assert (= (and b!161993 res!135041) b!161994))

(declare-fun m!257097 () Bool)

(assert (=> b!161993 m!257097))

(declare-fun m!257099 () Bool)

(assert (=> b!161993 m!257099))

(declare-fun m!257101 () Bool)

(assert (=> b!161994 m!257101))

(assert (=> bm!2723 d!55447))

(declare-fun d!55449 () Bool)

(assert (=> d!55449 (= (byteRangesEq!0 (select (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602)) lt!254933 #b00000000000000000000000000000000 (currentBit!7545 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7545 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7545 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254933) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7545 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13791 () Bool)

(assert (= bs!13791 d!55449))

(declare-fun m!257103 () Bool)

(assert (=> bs!13791 m!257103))

(declare-fun m!257105 () Bool)

(assert (=> bs!13791 m!257105))

(assert (=> b!161885 d!55449))

(declare-fun d!55451 () Bool)

(assert (=> d!55451 (= (array_inv!3345 (buf!4056 thiss!1602)) (bvsge (size!3598 (buf!4056 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161886 d!55451))

(declare-fun d!55453 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55453 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3598 (buf!4056 thiss!1602))) ((_ sign_extend 32) (currentByte!7550 thiss!1602)) ((_ sign_extend 32) (currentBit!7545 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3598 (buf!4056 thiss!1602))) ((_ sign_extend 32) (currentByte!7550 thiss!1602)) ((_ sign_extend 32) (currentBit!7545 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13792 () Bool)

(assert (= bs!13792 d!55453))

(declare-fun m!257107 () Bool)

(assert (=> bs!13792 m!257107))

(assert (=> start!33884 d!55453))

(declare-fun d!55455 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55455 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7545 thiss!1602) (currentByte!7550 thiss!1602) (size!3598 (buf!4056 thiss!1602))))))

(declare-fun bs!13793 () Bool)

(assert (= bs!13793 d!55455))

(declare-fun m!257109 () Bool)

(assert (=> bs!13793 m!257109))

(assert (=> start!33884 d!55455))

(declare-fun d!55457 () Bool)

(declare-fun res!135042 () Bool)

(declare-fun e!111706 () Bool)

(assert (=> d!55457 (=> res!135042 e!111706)))

(assert (=> d!55457 (= res!135042 (= #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)))))

(assert (=> d!55457 (= (arrayRangesEq!550 (buf!4056 thiss!1602) lt!254939 #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)) e!111706)))

(declare-fun b!161995 () Bool)

(declare-fun e!111707 () Bool)

(assert (=> b!161995 (= e!111706 e!111707)))

(declare-fun res!135043 () Bool)

(assert (=> b!161995 (=> (not res!135043) (not e!111707))))

(assert (=> b!161995 (= res!135043 (= (select (arr!4519 (buf!4056 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4519 lt!254939) #b00000000000000000000000000000000)))))

(declare-fun b!161996 () Bool)

(assert (=> b!161996 (= e!111707 (arrayRangesEq!550 (buf!4056 thiss!1602) lt!254939 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)))))

(assert (= (and d!55457 (not res!135042)) b!161995))

(assert (= (and b!161995 res!135043) b!161996))

(assert (=> b!161995 m!257097))

(declare-fun m!257111 () Bool)

(assert (=> b!161995 m!257111))

(declare-fun m!257113 () Bool)

(assert (=> b!161996 m!257113))

(assert (=> b!161881 d!55457))

(declare-fun d!55459 () Bool)

(declare-fun res!135044 () Bool)

(declare-fun e!111708 () Bool)

(assert (=> d!55459 (=> res!135044 e!111708)))

(assert (=> d!55459 (= res!135044 (= #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)))))

(assert (=> d!55459 (= (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)) e!111708)))

(declare-fun b!161997 () Bool)

(declare-fun e!111709 () Bool)

(assert (=> b!161997 (= e!111708 e!111709)))

(declare-fun res!135045 () Bool)

(assert (=> b!161997 (=> (not res!135045) (not e!111709))))

(assert (=> b!161997 (= res!135045 (= (select (arr!4519 (buf!4056 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4519 (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944) (size!3598 (buf!4056 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161998 () Bool)

(assert (=> b!161998 (= e!111709 (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944) (size!3598 (buf!4056 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)))))

(assert (= (and d!55459 (not res!135044)) b!161997))

(assert (= (and b!161997 res!135045) b!161998))

(assert (=> b!161997 m!257097))

(declare-fun m!257115 () Bool)

(assert (=> b!161997 m!257115))

(declare-fun m!257117 () Bool)

(assert (=> b!161998 m!257117))

(assert (=> b!161881 d!55459))

(declare-fun d!55461 () Bool)

(declare-fun e!111712 () Bool)

(assert (=> d!55461 e!111712))

(declare-fun res!135048 () Bool)

(assert (=> d!55461 (=> (not res!135048) (not e!111712))))

(assert (=> d!55461 (= res!135048 (and (bvsge (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (size!3598 (buf!4056 thiss!1602)))))))

(declare-fun lt!255103 () Unit!11162)

(declare-fun choose!174 (array!8022 (_ BitVec 32) (_ BitVec 8)) Unit!11162)

(assert (=> d!55461 (= lt!255103 (choose!174 (buf!4056 thiss!1602) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944))))

(assert (=> d!55461 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (size!3598 (buf!4056 thiss!1602))))))

(assert (=> d!55461 (= (arrayUpdatedAtPrefixLemma!158 (buf!4056 thiss!1602) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944) lt!255103)))

(declare-fun b!162001 () Bool)

(assert (=> b!162001 (= e!111712 (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) lt!254944) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)))))

(assert (= (and d!55461 res!135048) b!162001))

(declare-fun m!257119 () Bool)

(assert (=> d!55461 m!257119))

(assert (=> b!162001 m!256855))

(assert (=> b!162001 m!256871))

(assert (=> b!161881 d!55461))

(declare-fun d!55463 () Bool)

(declare-fun e!111715 () Bool)

(assert (=> d!55463 e!111715))

(declare-fun res!135053 () Bool)

(assert (=> d!55463 (=> (not res!135053) (not e!111715))))

(declare-fun lt!255118 () (_ BitVec 64))

(declare-fun lt!255119 () (_ BitVec 64))

(declare-fun lt!255116 () (_ BitVec 64))

(assert (=> d!55463 (= res!135053 (= lt!255119 (bvsub lt!255118 lt!255116)))))

(assert (=> d!55463 (or (= (bvand lt!255118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!255116 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!255118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!255118 lt!255116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55463 (= lt!255116 (remainingBits!0 ((_ sign_extend 32) (size!3598 (buf!4056 thiss!1602))) ((_ sign_extend 32) (currentByte!7550 thiss!1602)) ((_ sign_extend 32) (currentBit!7545 thiss!1602))))))

(declare-fun lt!255121 () (_ BitVec 64))

(declare-fun lt!255117 () (_ BitVec 64))

(assert (=> d!55463 (= lt!255118 (bvmul lt!255121 lt!255117))))

(assert (=> d!55463 (or (= lt!255121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!255117 (bvsdiv (bvmul lt!255121 lt!255117) lt!255121)))))

(assert (=> d!55463 (= lt!255117 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!55463 (= lt!255121 ((_ sign_extend 32) (size!3598 (buf!4056 thiss!1602))))))

(assert (=> d!55463 (= lt!255119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7550 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7545 thiss!1602))))))

(assert (=> d!55463 (invariant!0 (currentBit!7545 thiss!1602) (currentByte!7550 thiss!1602) (size!3598 (buf!4056 thiss!1602)))))

(assert (=> d!55463 (= (bitIndex!0 (size!3598 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) (currentBit!7545 thiss!1602)) lt!255119)))

(declare-fun b!162006 () Bool)

(declare-fun res!135054 () Bool)

(assert (=> b!162006 (=> (not res!135054) (not e!111715))))

(assert (=> b!162006 (= res!135054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!255119))))

(declare-fun b!162007 () Bool)

(declare-fun lt!255120 () (_ BitVec 64))

(assert (=> b!162007 (= e!111715 (bvsle lt!255119 (bvmul lt!255120 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!162007 (or (= lt!255120 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!255120 #b0000000000000000000000000000000000000000000000000000000000001000) lt!255120)))))

(assert (=> b!162007 (= lt!255120 ((_ sign_extend 32) (size!3598 (buf!4056 thiss!1602))))))

(assert (= (and d!55463 res!135053) b!162006))

(assert (= (and b!162006 res!135054) b!162007))

(assert (=> d!55463 m!257107))

(assert (=> d!55463 m!257109))

(assert (=> b!161882 d!55463))

(declare-fun d!55465 () Bool)

(assert (=> d!55465 (arrayRangesEq!550 (buf!4056 thiss!1602) (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001))))

(declare-fun lt!255124 () Unit!11162)

(declare-fun choose!175 (array!8022 array!8022 array!8022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11162)

(assert (=> d!55465 (= lt!255124 (choose!175 (buf!4056 thiss!1602) lt!254939 (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 (_3!579 lt!254938))))))

(assert (=> d!55465 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 (_3!579 lt!254938))))))

(assert (=> d!55465 (= (arrayRangesEqTransitive!145 (buf!4056 thiss!1602) lt!254939 (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (bvsub (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000001) (currentByte!7550 (_3!579 lt!254938))) lt!255124)))

(declare-fun bs!13794 () Bool)

(assert (= bs!13794 d!55465))

(declare-fun m!257121 () Bool)

(assert (=> bs!13794 m!257121))

(declare-fun m!257123 () Bool)

(assert (=> bs!13794 m!257123))

(assert (=> b!161883 d!55465))

(declare-fun d!55467 () Bool)

(declare-fun res!135055 () Bool)

(declare-fun e!111716 () Bool)

(assert (=> d!55467 (=> res!135055 e!111716)))

(assert (=> d!55467 (= res!135055 (= #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))))))

(assert (=> d!55467 (= (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))) e!111716)))

(declare-fun b!162008 () Bool)

(declare-fun e!111717 () Bool)

(assert (=> b!162008 (= e!111716 e!111717)))

(declare-fun res!135056 () Bool)

(assert (=> b!162008 (=> (not res!135056) (not e!111717))))

(assert (=> b!162008 (= res!135056 (= (select (arr!4519 (buf!4056 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4519 (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162009 () Bool)

(assert (=> b!162009 (= e!111717 (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7550 (_3!579 lt!254938))))))

(assert (= (and d!55467 (not res!135055)) b!162008))

(assert (= (and b!162008 res!135056) b!162009))

(assert (=> b!162008 m!257097))

(declare-fun m!257125 () Bool)

(assert (=> b!162008 m!257125))

(declare-fun m!257127 () Bool)

(assert (=> b!162009 m!257127))

(assert (=> b!161883 d!55467))

(declare-fun d!55469 () Bool)

(declare-fun e!111718 () Bool)

(assert (=> d!55469 e!111718))

(declare-fun res!135057 () Bool)

(assert (=> d!55469 (=> (not res!135057) (not e!111718))))

(assert (=> d!55469 (= res!135057 (and (bvsge (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000000) (bvslt (currentByte!7550 (_3!579 lt!254938)) (size!3598 (buf!4056 thiss!1602)))))))

(declare-fun lt!255125 () Unit!11162)

(assert (=> d!55469 (= lt!255125 (choose!174 (buf!4056 thiss!1602) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))))))

(assert (=> d!55469 (and (bvsle #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))) (bvslt (currentByte!7550 (_3!579 lt!254938)) (size!3598 (buf!4056 thiss!1602))))))

(assert (=> d!55469 (= (arrayUpdatedAtPrefixLemma!158 (buf!4056 thiss!1602) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) lt!255125)))

(declare-fun b!162010 () Bool)

(assert (=> b!162010 (= e!111718 (arrayRangesEq!550 (buf!4056 thiss!1602) (array!8023 (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))))))

(assert (= (and d!55469 res!135057) b!162010))

(assert (=> d!55469 m!256873))

(declare-fun m!257129 () Bool)

(assert (=> d!55469 m!257129))

(assert (=> b!162010 m!256883))

(assert (=> b!162010 m!256877))

(assert (=> b!161883 d!55469))

(declare-fun d!55471 () Bool)

(declare-fun e!111719 () Bool)

(assert (=> d!55471 e!111719))

(declare-fun res!135058 () Bool)

(assert (=> d!55471 (=> (not res!135058) (not e!111719))))

(assert (=> d!55471 (= res!135058 (and (bvsge (currentByte!7550 (_3!579 lt!254938)) #b00000000000000000000000000000000) (bvslt (currentByte!7550 (_3!579 lt!254938)) (size!3598 lt!254939))))))

(declare-fun lt!255126 () Unit!11162)

(assert (=> d!55471 (= lt!255126 (choose!174 lt!254939 (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))))))

(assert (=> d!55471 (and (bvsle #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))) (bvslt (currentByte!7550 (_3!579 lt!254938)) (size!3598 lt!254939)))))

(assert (=> d!55471 (= (arrayUpdatedAtPrefixLemma!158 lt!254939 (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) lt!255126)))

(declare-fun b!162011 () Bool)

(assert (=> b!162011 (= e!111719 (arrayRangesEq!550 lt!254939 (array!8023 (store (arr!4519 lt!254939) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 lt!254939)) #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))))))

(assert (= (and d!55471 res!135058) b!162011))

(assert (=> d!55471 m!256873))

(declare-fun m!257131 () Bool)

(assert (=> d!55471 m!257131))

(declare-fun m!257133 () Bool)

(assert (=> b!162011 m!257133))

(declare-fun m!257135 () Bool)

(assert (=> b!162011 m!257135))

(assert (=> b!161883 d!55471))

(declare-fun d!55473 () Bool)

(declare-fun res!135059 () Bool)

(declare-fun e!111720 () Bool)

(assert (=> d!55473 (=> res!135059 e!111720)))

(assert (=> d!55473 (= res!135059 (= #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))))))

(assert (=> d!55473 (= (arrayRangesEq!550 lt!254939 (array!8023 (store (store (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) lt!254935) (currentByte!7550 thiss!1602) lt!254933) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7550 (_3!579 lt!254938))) e!111720)))

(declare-fun b!162012 () Bool)

(declare-fun e!111721 () Bool)

(assert (=> b!162012 (= e!111720 e!111721)))

(declare-fun res!135060 () Bool)

(assert (=> b!162012 (=> (not res!135060) (not e!111721))))

(assert (=> b!162012 (= res!135060 (= (select (arr!4519 lt!254939) #b00000000000000000000000000000000) (select (arr!4519 (array!8023 (store (store (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) lt!254935) (currentByte!7550 thiss!1602) lt!254933) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!162013 () Bool)

(assert (=> b!162013 (= e!111721 (arrayRangesEq!550 lt!254939 (array!8023 (store (store (store (arr!4519 (buf!4056 thiss!1602)) (currentByte!7550 thiss!1602) lt!254935) (currentByte!7550 thiss!1602) lt!254933) (currentByte!7550 (_3!579 lt!254938)) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) (currentByte!7550 (_3!579 lt!254938)))) (size!3598 (buf!4056 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7550 (_3!579 lt!254938))))))

(assert (= (and d!55473 (not res!135059)) b!162012))

(assert (= (and b!162012 res!135060) b!162013))

(assert (=> b!162012 m!257111))

(declare-fun m!257137 () Bool)

(assert (=> b!162012 m!257137))

(declare-fun m!257139 () Bool)

(assert (=> b!162013 m!257139))

(assert (=> b!161883 d!55473))

(declare-fun d!55475 () Bool)

(declare-fun res!135061 () Bool)

(declare-fun e!111722 () Bool)

(assert (=> d!55475 (=> res!135061 e!111722)))

(assert (=> d!55475 (= res!135061 (= #b00000000000000000000000000000000 (currentByte!7550 thiss!1602)))))

(assert (=> d!55475 (= (arrayRangesEq!550 (buf!4056 thiss!1602) (buf!4056 (_3!579 lt!254938)) #b00000000000000000000000000000000 (currentByte!7550 thiss!1602)) e!111722)))

(declare-fun b!162014 () Bool)

(declare-fun e!111723 () Bool)

(assert (=> b!162014 (= e!111722 e!111723)))

(declare-fun res!135062 () Bool)

(assert (=> b!162014 (=> (not res!135062) (not e!111723))))

(assert (=> b!162014 (= res!135062 (= (select (arr!4519 (buf!4056 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4519 (buf!4056 (_3!579 lt!254938))) #b00000000000000000000000000000000)))))

(declare-fun b!162015 () Bool)

(assert (=> b!162015 (= e!111723 (arrayRangesEq!550 (buf!4056 thiss!1602) (buf!4056 (_3!579 lt!254938)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7550 thiss!1602)))))

(assert (= (and d!55475 (not res!135061)) b!162014))

(assert (= (and b!162014 res!135062) b!162015))

(assert (=> b!162014 m!257097))

(assert (=> b!162014 m!257099))

(declare-fun m!257141 () Bool)

(assert (=> b!162015 m!257141))

(assert (=> b!161884 d!55475))

(push 1)

(assert (not d!55461))

(assert (not d!55465))

(assert (not d!55455))

(assert (not b!162001))

(assert (not d!55471))

(assert (not b!162010))

(assert (not b!162011))

(assert (not b!162009))

(assert (not d!55453))

(assert (not b!162015))

(assert (not b!161996))

(assert (not b!161994))

(assert (not b!161998))

(assert (not b!162013))

(assert (not d!55469))

(assert (not d!55463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

