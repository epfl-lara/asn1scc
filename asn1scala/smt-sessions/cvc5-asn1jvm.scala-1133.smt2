; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32128 () Bool)

(assert start!32128)

(declare-fun b!158984 () Bool)

(declare-fun e!108419 () Bool)

(declare-datatypes ((array!7533 0))(
  ( (array!7534 (arr!4333 (Array (_ BitVec 32) (_ BitVec 8))) (size!3412 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5992 0))(
  ( (BitStream!5993 (buf!3870 array!7533) (currentByte!7095 (_ BitVec 32)) (currentBit!7090 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5992)

(declare-fun array_inv!3159 (array!7533) Bool)

(assert (=> b!158984 (= e!108419 (array_inv!3159 (buf!3870 thiss!1602)))))

(declare-fun res!132704 () Bool)

(declare-fun e!108418 () Bool)

(assert (=> start!32128 (=> (not res!132704) (not e!108418))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32128 (= res!132704 (validate_offset_byte!0 ((_ sign_extend 32) (size!3412 (buf!3870 thiss!1602))) ((_ sign_extend 32) (currentByte!7095 thiss!1602)) ((_ sign_extend 32) (currentBit!7090 thiss!1602))))))

(assert (=> start!32128 e!108418))

(declare-fun inv!12 (BitStream!5992) Bool)

(assert (=> start!32128 (and (inv!12 thiss!1602) e!108419)))

(assert (=> start!32128 true))

(declare-fun b!158985 () Bool)

(declare-fun e!108417 () Bool)

(declare-fun lt!250740 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158985 (= e!108417 (byteRangesEq!0 (select (arr!4333 (buf!3870 thiss!1602)) (currentByte!7095 thiss!1602)) lt!250740 #b00000000000000000000000000000000 (currentBit!7090 thiss!1602)))))

(declare-fun b!158986 () Bool)

(declare-fun res!132707 () Bool)

(declare-fun e!108420 () Bool)

(assert (=> b!158986 (=> res!132707 e!108420)))

(declare-fun lt!250745 () (_ BitVec 32))

(assert (=> b!158986 (= res!132707 (bvsle lt!250745 #b00000000000000000000000000000000))))

(declare-fun b!158987 () Bool)

(assert (=> b!158987 (= e!108418 (not e!108420))))

(declare-fun res!132706 () Bool)

(assert (=> b!158987 (=> res!132706 e!108420)))

(declare-datatypes ((Unit!10739 0))(
  ( (Unit!10740) )
))
(declare-datatypes ((tuple3!726 0))(
  ( (tuple3!727 (_1!7711 Unit!10739) (_2!7711 (_ BitVec 8)) (_3!480 BitStream!5992)) )
))
(declare-fun lt!250743 () tuple3!726)

(declare-fun lt!250748 () array!7533)

(declare-fun arrayRangesEq!463 (array!7533 array!7533 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158987 (= res!132706 (not (arrayRangesEq!463 (buf!3870 thiss!1602) lt!250748 #b00000000000000000000000000000000 (bvsub (currentByte!7095 (_3!480 lt!250743)) #b00000000000000000000000000000001))))))

(declare-fun lt!250742 () (_ BitVec 8))

(assert (=> b!158987 (arrayRangesEq!463 (buf!3870 thiss!1602) (array!7534 (store (arr!4333 (buf!3870 thiss!1602)) (bvsub (currentByte!7095 (_3!480 lt!250743)) #b00000000000000000000000000000001) lt!250742) (size!3412 (buf!3870 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7095 (_3!480 lt!250743)) #b00000000000000000000000000000001))))

(declare-fun lt!250744 () Unit!10739)

(declare-fun arrayUpdatedAtPrefixLemma!71 (array!7533 (_ BitVec 32) (_ BitVec 8)) Unit!10739)

(assert (=> b!158987 (= lt!250744 (arrayUpdatedAtPrefixLemma!71 (buf!3870 thiss!1602) (bvsub (currentByte!7095 (_3!480 lt!250743)) #b00000000000000000000000000000001) lt!250742))))

(assert (=> b!158987 (= lt!250742 (select (arr!4333 (buf!3870 (_3!480 lt!250743))) (bvsub (currentByte!7095 (_3!480 lt!250743)) #b00000000000000000000000000000001)))))

(declare-fun lt!250749 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250738 () (_ BitVec 8))

(declare-fun lt!250747 () (_ BitVec 8))

(declare-fun lt!250739 () (_ BitVec 32))

(declare-fun Unit!10741 () Unit!10739)

(declare-fun Unit!10742 () Unit!10739)

(assert (=> b!158987 (= lt!250743 (ite (bvsgt lt!250745 #b00000000000000000000000000000000) (let ((bdg!9265 ((_ extract 7 0) (bvnot lt!250749)))) (let ((bdg!9266 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4333 (buf!3870 thiss!1602)) (currentByte!7095 thiss!1602) lt!250747) (currentByte!7095 thiss!1602) lt!250740) (bvadd #b00000000000000000000000000000001 (currentByte!7095 thiss!1602)))) ((_ sign_extend 24) bdg!9265))))) (tuple3!727 Unit!10741 bdg!9265 (BitStream!5993 (array!7534 (store (arr!4333 (array!7534 (store (arr!4333 lt!250748) (bvadd #b00000000000000000000000000000001 (currentByte!7095 thiss!1602)) bdg!9266) (size!3412 lt!250748))) (bvadd #b00000000000000000000000000000001 (currentByte!7095 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9266) (bvshl ((_ sign_extend 24) v!222) lt!250739)))) (size!3412 (array!7534 (store (arr!4333 lt!250748) (bvadd #b00000000000000000000000000000001 (currentByte!7095 thiss!1602)) bdg!9266) (size!3412 lt!250748)))) (bvadd #b00000000000000000000000000000001 (currentByte!7095 thiss!1602)) (currentBit!7090 thiss!1602))))) (tuple3!727 Unit!10742 lt!250738 (BitStream!5993 lt!250748 (bvadd #b00000000000000000000000000000001 (currentByte!7095 thiss!1602)) (currentBit!7090 thiss!1602)))))))

(assert (=> b!158987 e!108417))

(declare-fun res!132705 () Bool)

(assert (=> b!158987 (=> res!132705 e!108417)))

(assert (=> b!158987 (= res!132705 (bvsge (currentByte!7095 thiss!1602) (size!3412 (buf!3870 thiss!1602))))))

(assert (=> b!158987 (= lt!250748 (array!7534 (store (store (arr!4333 (buf!3870 thiss!1602)) (currentByte!7095 thiss!1602) lt!250747) (currentByte!7095 thiss!1602) lt!250740) (size!3412 (buf!3870 thiss!1602))))))

(assert (=> b!158987 (= lt!250740 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250747) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250745))))))

(assert (=> b!158987 (= lt!250747 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4333 (buf!3870 thiss!1602)) (currentByte!7095 thiss!1602))) lt!250749)))))

(assert (=> b!158987 (= lt!250749 ((_ sign_extend 24) lt!250738))))

(assert (=> b!158987 (= lt!250738 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250739)))))))

(assert (=> b!158987 (= lt!250739 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250745))))))

(assert (=> b!158987 (= lt!250745 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7090 thiss!1602))))))

(declare-fun b!158988 () Bool)

(assert (=> b!158988 (= e!108420 true)))

(assert (=> b!158988 (arrayRangesEq!463 lt!250748 (array!7534 (store (store (store (arr!4333 (buf!3870 thiss!1602)) (currentByte!7095 thiss!1602) lt!250747) (currentByte!7095 thiss!1602) lt!250740) (currentByte!7095 (_3!480 lt!250743)) (select (arr!4333 (buf!3870 (_3!480 lt!250743))) (currentByte!7095 (_3!480 lt!250743)))) (size!3412 (buf!3870 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7095 (_3!480 lt!250743)))))

(declare-fun lt!250741 () Unit!10739)

(assert (=> b!158988 (= lt!250741 (arrayUpdatedAtPrefixLemma!71 lt!250748 (currentByte!7095 (_3!480 lt!250743)) (select (arr!4333 (buf!3870 (_3!480 lt!250743))) (currentByte!7095 (_3!480 lt!250743)))))))

(assert (=> b!158988 (arrayRangesEq!463 (buf!3870 thiss!1602) (array!7534 (store (arr!4333 (buf!3870 thiss!1602)) (currentByte!7095 (_3!480 lt!250743)) (select (arr!4333 (buf!3870 (_3!480 lt!250743))) (currentByte!7095 (_3!480 lt!250743)))) (size!3412 (buf!3870 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7095 (_3!480 lt!250743)))))

(declare-fun lt!250746 () Unit!10739)

(assert (=> b!158988 (= lt!250746 (arrayUpdatedAtPrefixLemma!71 (buf!3870 thiss!1602) (currentByte!7095 (_3!480 lt!250743)) (select (arr!4333 (buf!3870 (_3!480 lt!250743))) (currentByte!7095 (_3!480 lt!250743)))))))

(assert (= (and start!32128 res!132704) b!158987))

(assert (= (and b!158987 (not res!132705)) b!158985))

(assert (= (and b!158987 (not res!132706)) b!158986))

(assert (= (and b!158986 (not res!132707)) b!158988))

(assert (= start!32128 b!158984))

(declare-fun m!249907 () Bool)

(assert (=> start!32128 m!249907))

(declare-fun m!249909 () Bool)

(assert (=> start!32128 m!249909))

(declare-fun m!249911 () Bool)

(assert (=> b!158987 m!249911))

(declare-fun m!249913 () Bool)

(assert (=> b!158987 m!249913))

(declare-fun m!249915 () Bool)

(assert (=> b!158987 m!249915))

(declare-fun m!249917 () Bool)

(assert (=> b!158987 m!249917))

(declare-fun m!249919 () Bool)

(assert (=> b!158987 m!249919))

(declare-fun m!249921 () Bool)

(assert (=> b!158987 m!249921))

(declare-fun m!249923 () Bool)

(assert (=> b!158987 m!249923))

(declare-fun m!249925 () Bool)

(assert (=> b!158987 m!249925))

(declare-fun m!249927 () Bool)

(assert (=> b!158987 m!249927))

(declare-fun m!249929 () Bool)

(assert (=> b!158987 m!249929))

(declare-fun m!249931 () Bool)

(assert (=> b!158987 m!249931))

(declare-fun m!249933 () Bool)

(assert (=> b!158987 m!249933))

(assert (=> b!158985 m!249919))

(assert (=> b!158985 m!249919))

(declare-fun m!249935 () Bool)

(assert (=> b!158985 m!249935))

(declare-fun m!249937 () Bool)

(assert (=> b!158988 m!249937))

(declare-fun m!249939 () Bool)

(assert (=> b!158988 m!249939))

(declare-fun m!249941 () Bool)

(assert (=> b!158988 m!249941))

(declare-fun m!249943 () Bool)

(assert (=> b!158988 m!249943))

(assert (=> b!158988 m!249937))

(declare-fun m!249945 () Bool)

(assert (=> b!158988 m!249945))

(declare-fun m!249947 () Bool)

(assert (=> b!158988 m!249947))

(declare-fun m!249949 () Bool)

(assert (=> b!158988 m!249949))

(assert (=> b!158988 m!249937))

(assert (=> b!158988 m!249927))

(assert (=> b!158988 m!249929))

(declare-fun m!249951 () Bool)

(assert (=> b!158984 m!249951))

(push 1)

(assert (not b!158985))

(assert (not b!158984))

(assert (not b!158987))

(assert (not b!158988))

(assert (not start!32128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

