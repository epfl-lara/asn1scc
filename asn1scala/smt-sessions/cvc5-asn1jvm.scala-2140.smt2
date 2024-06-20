; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54312 () Bool)

(assert start!54312)

(declare-fun b!253706 () Bool)

(declare-fun e!175806 () Bool)

(declare-datatypes ((array!13747 0))(
  ( (array!13748 (arr!7018 (Array (_ BitVec 32) (_ BitVec 8))) (size!6031 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10984 0))(
  ( (BitStream!10985 (buf!6539 array!13747) (currentByte!12003 (_ BitVec 32)) (currentBit!11998 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21762 0))(
  ( (tuple2!21763 (_1!11812 BitStream!10984) (_2!11812 Bool)) )
))
(declare-fun lt!393983 () tuple2!21762)

(declare-datatypes ((tuple2!21764 0))(
  ( (tuple2!21765 (_1!11813 BitStream!10984) (_2!11813 BitStream!10984)) )
))
(declare-fun lt!393990 () tuple2!21764)

(assert (=> b!253706 (= e!175806 (= (_1!11812 lt!393983) (_2!11813 lt!393990)))))

(declare-fun lt!393998 () tuple2!21762)

(assert (=> b!253706 (= (_2!11812 lt!393983) (_2!11812 lt!393998))))

(declare-fun b!253707 () Bool)

(declare-fun e!175808 () Bool)

(declare-fun lt!393994 () tuple2!21762)

(declare-fun lt!393995 () tuple2!21764)

(assert (=> b!253707 (= e!175808 (not (or (not (_2!11812 lt!393994)) (not (= (_1!11812 lt!393994) (_2!11813 lt!393995))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10984 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21762)

(assert (=> b!253707 (= lt!393994 (checkBitsLoopPure!0 (_1!11813 lt!393995) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18237 0))(
  ( (Unit!18238) )
))
(declare-datatypes ((tuple2!21766 0))(
  ( (tuple2!21767 (_1!11814 Unit!18237) (_2!11814 BitStream!10984)) )
))
(declare-fun lt!393993 () tuple2!21766)

(declare-fun lt!393981 () tuple2!21766)

(declare-fun lt!393986 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!253707 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393986)))

(declare-fun lt!393999 () Unit!18237)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10984 array!13747 (_ BitVec 64)) Unit!18237)

(assert (=> b!253707 (= lt!393999 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393986))))

(declare-fun reader!0 (BitStream!10984 BitStream!10984) tuple2!21764)

(assert (=> b!253707 (= lt!393995 (reader!0 (_2!11814 lt!393981) (_2!11814 lt!393993)))))

(declare-fun b!253708 () Bool)

(declare-fun e!175807 () Bool)

(declare-fun lt!393978 () tuple2!21762)

(declare-fun lt!393987 () tuple2!21762)

(assert (=> b!253708 (= e!175807 (= (_2!11812 lt!393978) (_2!11812 lt!393987)))))

(declare-fun b!253709 () Bool)

(declare-fun e!175800 () Bool)

(declare-fun e!175799 () Bool)

(assert (=> b!253709 (= e!175800 e!175799)))

(declare-fun res!212586 () Bool)

(assert (=> b!253709 (=> (not res!212586) (not e!175799))))

(declare-fun lt!393980 () (_ BitVec 64))

(declare-fun lt!393979 () (_ BitVec 64))

(assert (=> b!253709 (= res!212586 (= lt!393980 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!393979)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!253709 (= lt!393980 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(declare-fun thiss!1005 () BitStream!10984)

(assert (=> b!253709 (= lt!393979 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(declare-fun b!253710 () Bool)

(declare-fun res!212589 () Bool)

(declare-fun e!175801 () Bool)

(assert (=> b!253710 (=> (not res!212589) (not e!175801))))

(assert (=> b!253710 (= res!212589 (bvslt from!289 nBits!297))))

(declare-fun res!212587 () Bool)

(assert (=> start!54312 (=> (not res!212587) (not e!175801))))

(assert (=> start!54312 (= res!212587 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54312 e!175801))

(assert (=> start!54312 true))

(declare-fun e!175805 () Bool)

(declare-fun inv!12 (BitStream!10984) Bool)

(assert (=> start!54312 (and (inv!12 thiss!1005) e!175805)))

(declare-fun b!253711 () Bool)

(declare-fun res!212582 () Bool)

(declare-fun e!175798 () Bool)

(assert (=> b!253711 (=> (not res!212582) (not e!175798))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253711 (= res!212582 (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(declare-fun b!253712 () Bool)

(assert (=> b!253712 (= e!175798 (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(declare-fun b!253713 () Bool)

(assert (=> b!253713 (= e!175801 (not e!175806))))

(declare-fun res!212578 () Bool)

(assert (=> b!253713 (=> res!212578 e!175806)))

(declare-fun lt!393992 () tuple2!21764)

(assert (=> b!253713 (= res!212578 (not (= (_1!11812 lt!393998) (_2!11813 lt!393992))))))

(assert (=> b!253713 (= lt!393998 (checkBitsLoopPure!0 (_1!11813 lt!393992) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!393991 () (_ BitVec 64))

(assert (=> b!253713 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393991)))

(declare-fun lt!393984 () Unit!18237)

(assert (=> b!253713 (= lt!393984 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393991))))

(assert (=> b!253713 (= lt!393983 (checkBitsLoopPure!0 (_1!11813 lt!393990) nBits!297 bit!26 from!289))))

(assert (=> b!253713 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!393989 () Unit!18237)

(assert (=> b!253713 (= lt!393989 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6539 (_2!11814 lt!393993)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10984) tuple2!21762)

(assert (=> b!253713 (= (_2!11812 (readBitPure!0 (_1!11813 lt!393990))) bit!26)))

(assert (=> b!253713 (= lt!393992 (reader!0 (_2!11814 lt!393981) (_2!11814 lt!393993)))))

(assert (=> b!253713 (= lt!393990 (reader!0 thiss!1005 (_2!11814 lt!393993)))))

(assert (=> b!253713 e!175807))

(declare-fun res!212591 () Bool)

(assert (=> b!253713 (=> (not res!212591) (not e!175807))))

(assert (=> b!253713 (= res!212591 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!393978))) (currentByte!12003 (_1!11812 lt!393978)) (currentBit!11998 (_1!11812 lt!393978))) (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!393987))) (currentByte!12003 (_1!11812 lt!393987)) (currentBit!11998 (_1!11812 lt!393987)))))))

(declare-fun lt!393982 () Unit!18237)

(declare-fun lt!393988 () BitStream!10984)

(declare-fun readBitPrefixLemma!0 (BitStream!10984 BitStream!10984) Unit!18237)

(assert (=> b!253713 (= lt!393982 (readBitPrefixLemma!0 lt!393988 (_2!11814 lt!393993)))))

(assert (=> b!253713 (= lt!393987 (readBitPure!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (=> b!253713 (= lt!393978 (readBitPure!0 lt!393988))))

(assert (=> b!253713 (= lt!393988 (BitStream!10985 (buf!6539 (_2!11814 lt!393981)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(assert (=> b!253713 e!175798))

(declare-fun res!212581 () Bool)

(assert (=> b!253713 (=> (not res!212581) (not e!175798))))

(declare-fun isPrefixOf!0 (BitStream!10984 BitStream!10984) Bool)

(assert (=> b!253713 (= res!212581 (isPrefixOf!0 thiss!1005 (_2!11814 lt!393993)))))

(declare-fun lt!393985 () Unit!18237)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10984 BitStream!10984 BitStream!10984) Unit!18237)

(assert (=> b!253713 (= lt!393985 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11814 lt!393981) (_2!11814 lt!393993)))))

(declare-fun e!175802 () Bool)

(assert (=> b!253713 e!175802))

(declare-fun res!212592 () Bool)

(assert (=> b!253713 (=> (not res!212592) (not e!175802))))

(assert (=> b!253713 (= res!212592 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10984 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21766)

(assert (=> b!253713 (= lt!393993 (appendNBitsLoop!0 (_2!11814 lt!393981) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!253713 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393991)))

(assert (=> b!253713 (= lt!393991 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!393997 () Unit!18237)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10984 BitStream!10984 (_ BitVec 64) (_ BitVec 64)) Unit!18237)

(assert (=> b!253713 (= lt!393997 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11814 lt!393981) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!253713 e!175800))

(declare-fun res!212590 () Bool)

(assert (=> b!253713 (=> (not res!212590) (not e!175800))))

(assert (=> b!253713 (= res!212590 (= (size!6031 (buf!6539 thiss!1005)) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(declare-fun appendBit!0 (BitStream!10984 Bool) tuple2!21766)

(assert (=> b!253713 (= lt!393981 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!253714 () Bool)

(declare-fun res!212588 () Bool)

(assert (=> b!253714 (=> (not res!212588) (not e!175808))))

(assert (=> b!253714 (= res!212588 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!393993)))))

(declare-fun b!253715 () Bool)

(declare-fun res!212584 () Bool)

(assert (=> b!253715 (=> res!212584 e!175806)))

(declare-fun withMovedBitIndex!0 (BitStream!10984 (_ BitVec 64)) BitStream!10984)

(assert (=> b!253715 (= res!212584 (not (= (_1!11813 lt!393992) (withMovedBitIndex!0 (_1!11813 lt!393990) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!253716 () Bool)

(declare-fun e!175803 () Bool)

(assert (=> b!253716 (= e!175799 e!175803)))

(declare-fun res!212580 () Bool)

(assert (=> b!253716 (=> (not res!212580) (not e!175803))))

(declare-fun lt!393996 () tuple2!21762)

(assert (=> b!253716 (= res!212580 (and (= (_2!11812 lt!393996) bit!26) (= (_1!11812 lt!393996) (_2!11814 lt!393981))))))

(declare-fun readerFrom!0 (BitStream!10984 (_ BitVec 32) (_ BitVec 32)) BitStream!10984)

(assert (=> b!253716 (= lt!393996 (readBitPure!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))))

(declare-fun b!253717 () Bool)

(assert (=> b!253717 (= e!175803 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!393996))) (currentByte!12003 (_1!11812 lt!393996)) (currentBit!11998 (_1!11812 lt!393996))) lt!393980))))

(declare-fun b!253718 () Bool)

(declare-fun res!212579 () Bool)

(assert (=> b!253718 (=> (not res!212579) (not e!175801))))

(assert (=> b!253718 (= res!212579 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!253719 () Bool)

(declare-fun res!212585 () Bool)

(assert (=> b!253719 (=> (not res!212585) (not e!175799))))

(assert (=> b!253719 (= res!212585 (isPrefixOf!0 thiss!1005 (_2!11814 lt!393981)))))

(declare-fun b!253720 () Bool)

(declare-fun array_inv!5772 (array!13747) Bool)

(assert (=> b!253720 (= e!175805 (array_inv!5772 (buf!6539 thiss!1005)))))

(declare-fun b!253721 () Bool)

(assert (=> b!253721 (= e!175802 e!175808)))

(declare-fun res!212583 () Bool)

(assert (=> b!253721 (=> (not res!212583) (not e!175808))))

(assert (=> b!253721 (= res!212583 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993))) (bvadd (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))) lt!393986)))))

(assert (=> b!253721 (= lt!393986 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!54312 res!212587) b!253718))

(assert (= (and b!253718 res!212579) b!253710))

(assert (= (and b!253710 res!212589) b!253713))

(assert (= (and b!253713 res!212590) b!253709))

(assert (= (and b!253709 res!212586) b!253719))

(assert (= (and b!253719 res!212585) b!253716))

(assert (= (and b!253716 res!212580) b!253717))

(assert (= (and b!253713 res!212592) b!253721))

(assert (= (and b!253721 res!212583) b!253714))

(assert (= (and b!253714 res!212588) b!253707))

(assert (= (and b!253713 res!212581) b!253711))

(assert (= (and b!253711 res!212582) b!253712))

(assert (= (and b!253713 res!212591) b!253708))

(assert (= (and b!253713 (not res!212578)) b!253715))

(assert (= (and b!253715 (not res!212584)) b!253706))

(assert (= start!54312 b!253720))

(declare-fun m!381933 () Bool)

(assert (=> b!253719 m!381933))

(declare-fun m!381935 () Bool)

(assert (=> start!54312 m!381935))

(declare-fun m!381937 () Bool)

(assert (=> b!253711 m!381937))

(declare-fun m!381939 () Bool)

(assert (=> b!253720 m!381939))

(declare-fun m!381941 () Bool)

(assert (=> b!253717 m!381941))

(declare-fun m!381943 () Bool)

(assert (=> b!253713 m!381943))

(declare-fun m!381945 () Bool)

(assert (=> b!253713 m!381945))

(declare-fun m!381947 () Bool)

(assert (=> b!253713 m!381947))

(declare-fun m!381949 () Bool)

(assert (=> b!253713 m!381949))

(declare-fun m!381951 () Bool)

(assert (=> b!253713 m!381951))

(declare-fun m!381953 () Bool)

(assert (=> b!253713 m!381953))

(declare-fun m!381955 () Bool)

(assert (=> b!253713 m!381955))

(declare-fun m!381957 () Bool)

(assert (=> b!253713 m!381957))

(declare-fun m!381959 () Bool)

(assert (=> b!253713 m!381959))

(declare-fun m!381961 () Bool)

(assert (=> b!253713 m!381961))

(declare-fun m!381963 () Bool)

(assert (=> b!253713 m!381963))

(declare-fun m!381965 () Bool)

(assert (=> b!253713 m!381965))

(declare-fun m!381967 () Bool)

(assert (=> b!253713 m!381967))

(declare-fun m!381969 () Bool)

(assert (=> b!253713 m!381969))

(declare-fun m!381971 () Bool)

(assert (=> b!253713 m!381971))

(declare-fun m!381973 () Bool)

(assert (=> b!253713 m!381973))

(declare-fun m!381975 () Bool)

(assert (=> b!253713 m!381975))

(declare-fun m!381977 () Bool)

(assert (=> b!253713 m!381977))

(declare-fun m!381979 () Bool)

(assert (=> b!253713 m!381979))

(declare-fun m!381981 () Bool)

(assert (=> b!253713 m!381981))

(declare-fun m!381983 () Bool)

(assert (=> b!253712 m!381983))

(declare-fun m!381985 () Bool)

(assert (=> b!253716 m!381985))

(assert (=> b!253716 m!381985))

(declare-fun m!381987 () Bool)

(assert (=> b!253716 m!381987))

(declare-fun m!381989 () Bool)

(assert (=> b!253718 m!381989))

(declare-fun m!381991 () Bool)

(assert (=> b!253714 m!381991))

(declare-fun m!381993 () Bool)

(assert (=> b!253707 m!381993))

(declare-fun m!381995 () Bool)

(assert (=> b!253707 m!381995))

(declare-fun m!381997 () Bool)

(assert (=> b!253707 m!381997))

(assert (=> b!253707 m!381947))

(declare-fun m!381999 () Bool)

(assert (=> b!253709 m!381999))

(declare-fun m!382001 () Bool)

(assert (=> b!253709 m!382001))

(declare-fun m!382003 () Bool)

(assert (=> b!253715 m!382003))

(declare-fun m!382005 () Bool)

(assert (=> b!253721 m!382005))

(assert (=> b!253721 m!381999))

(push 1)

(assert (not b!253715))

(assert (not b!253712))

(assert (not b!253709))

(assert (not b!253707))

(assert (not b!253711))

(assert (not b!253713))

(assert (not b!253719))

(assert (not b!253721))

(assert (not b!253714))

(assert (not b!253716))

(assert (not b!253717))

(assert (not b!253718))

(assert (not start!54312))

(assert (not b!253720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85050 () Bool)

(declare-datatypes ((tuple2!21782 0))(
  ( (tuple2!21783 (_1!11822 Bool) (_2!11822 BitStream!10984)) )
))
(declare-fun lt!394338 () tuple2!21782)

(declare-fun readBit!0 (BitStream!10984) tuple2!21782)

(assert (=> d!85050 (= lt!394338 (readBit!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))))

(assert (=> d!85050 (= (readBitPure!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))) (tuple2!21763 (_2!11822 lt!394338) (_1!11822 lt!394338)))))

(declare-fun bs!21505 () Bool)

(assert (= bs!21505 d!85050))

(assert (=> bs!21505 m!381985))

(declare-fun m!382319 () Bool)

(assert (=> bs!21505 m!382319))

(assert (=> b!253716 d!85050))

(declare-fun d!85052 () Bool)

(declare-fun e!175927 () Bool)

(assert (=> d!85052 e!175927))

(declare-fun res!212766 () Bool)

(assert (=> d!85052 (=> (not res!212766) (not e!175927))))

(assert (=> d!85052 (= res!212766 (invariant!0 (currentBit!11998 (_2!11814 lt!393981)) (currentByte!12003 (_2!11814 lt!393981)) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(assert (=> d!85052 (= (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)) (BitStream!10985 (buf!6539 (_2!11814 lt!393981)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(declare-fun b!253908 () Bool)

(assert (=> b!253908 (= e!175927 (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(assert (= (and d!85052 res!212766) b!253908))

(declare-fun m!382321 () Bool)

(assert (=> d!85052 m!382321))

(assert (=> b!253908 m!381937))

(assert (=> b!253716 d!85052))

(declare-fun d!85054 () Bool)

(declare-fun e!175930 () Bool)

(assert (=> d!85054 e!175930))

(declare-fun res!212769 () Bool)

(assert (=> d!85054 (=> (not res!212769) (not e!175930))))

(declare-fun lt!394344 () (_ BitVec 64))

(declare-fun lt!394343 () BitStream!10984)

(assert (=> d!85054 (= res!212769 (= (bvadd lt!394344 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6031 (buf!6539 lt!394343)) (currentByte!12003 lt!394343) (currentBit!11998 lt!394343))))))

(assert (=> d!85054 (or (not (= (bvand lt!394344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394344 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85054 (= lt!394344 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)) (currentBit!11998 (_1!11813 lt!393990))))))

(declare-fun moveBitIndex!0 (BitStream!10984 (_ BitVec 64)) tuple2!21766)

(assert (=> d!85054 (= lt!394343 (_2!11814 (moveBitIndex!0 (_1!11813 lt!393990) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10984 (_ BitVec 64)) Bool)

(assert (=> d!85054 (moveBitIndexPrecond!0 (_1!11813 lt!393990) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!85054 (= (withMovedBitIndex!0 (_1!11813 lt!393990) #b0000000000000000000000000000000000000000000000000000000000000001) lt!394343)))

(declare-fun b!253911 () Bool)

(assert (=> b!253911 (= e!175930 (= (size!6031 (buf!6539 (_1!11813 lt!393990))) (size!6031 (buf!6539 lt!394343))))))

(assert (= (and d!85054 res!212769) b!253911))

(declare-fun m!382323 () Bool)

(assert (=> d!85054 m!382323))

(declare-fun m!382325 () Bool)

(assert (=> d!85054 m!382325))

(declare-fun m!382327 () Bool)

(assert (=> d!85054 m!382327))

(declare-fun m!382329 () Bool)

(assert (=> d!85054 m!382329))

(assert (=> b!253715 d!85054))

(declare-fun d!85056 () Bool)

(declare-fun res!212777 () Bool)

(declare-fun e!175935 () Bool)

(assert (=> d!85056 (=> (not res!212777) (not e!175935))))

(assert (=> d!85056 (= res!212777 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85056 (= (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!393993)) e!175935)))

(declare-fun b!253918 () Bool)

(declare-fun res!212776 () Bool)

(assert (=> b!253918 (=> (not res!212776) (not e!175935))))

(assert (=> b!253918 (= res!212776 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun b!253919 () Bool)

(declare-fun e!175936 () Bool)

(assert (=> b!253919 (= e!175935 e!175936)))

(declare-fun res!212778 () Bool)

(assert (=> b!253919 (=> res!212778 e!175936)))

(assert (=> b!253919 (= res!212778 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) #b00000000000000000000000000000000))))

(declare-fun b!253920 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13747 array!13747 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!253920 (= e!175936 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (= (and d!85056 res!212777) b!253918))

(assert (= (and b!253918 res!212776) b!253919))

(assert (= (and b!253919 (not res!212778)) b!253920))

(assert (=> b!253918 m!381999))

(assert (=> b!253918 m!382005))

(assert (=> b!253920 m!381999))

(assert (=> b!253920 m!381999))

(declare-fun m!382331 () Bool)

(assert (=> b!253920 m!382331))

(assert (=> b!253714 d!85056))

(declare-fun d!85058 () Bool)

(assert (=> d!85058 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 thiss!1005))))))

(declare-fun bs!21506 () Bool)

(assert (= bs!21506 d!85058))

(declare-fun m!382333 () Bool)

(assert (=> bs!21506 m!382333))

(assert (=> start!54312 d!85058))

(declare-fun d!85060 () Bool)

(assert (=> d!85060 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393991)))

(declare-fun lt!394347 () Unit!18237)

(declare-fun choose!9 (BitStream!10984 array!13747 (_ BitVec 64) BitStream!10984) Unit!18237)

(assert (=> d!85060 (= lt!394347 (choose!9 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393991 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (=> d!85060 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393991) lt!394347)))

(declare-fun bs!21507 () Bool)

(assert (= bs!21507 d!85060))

(assert (=> bs!21507 m!381967))

(declare-fun m!382335 () Bool)

(assert (=> bs!21507 m!382335))

(assert (=> b!253713 d!85060))

(declare-fun d!85062 () Bool)

(declare-fun e!175939 () Bool)

(assert (=> d!85062 e!175939))

(declare-fun res!212781 () Bool)

(assert (=> d!85062 (=> (not res!212781) (not e!175939))))

(declare-fun lt!394357 () tuple2!21762)

(declare-fun lt!394356 () tuple2!21762)

(assert (=> d!85062 (= res!212781 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!394357))) (currentByte!12003 (_1!11812 lt!394357)) (currentBit!11998 (_1!11812 lt!394357))) (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!394356))) (currentByte!12003 (_1!11812 lt!394356)) (currentBit!11998 (_1!11812 lt!394356)))))))

(declare-fun lt!394359 () Unit!18237)

(declare-fun lt!394358 () BitStream!10984)

(declare-fun choose!50 (BitStream!10984 BitStream!10984 BitStream!10984 tuple2!21762 tuple2!21762 BitStream!10984 Bool tuple2!21762 tuple2!21762 BitStream!10984 Bool) Unit!18237)

(assert (=> d!85062 (= lt!394359 (choose!50 lt!393988 (_2!11814 lt!393993) lt!394358 lt!394357 (tuple2!21763 (_1!11812 lt!394357) (_2!11812 lt!394357)) (_1!11812 lt!394357) (_2!11812 lt!394357) lt!394356 (tuple2!21763 (_1!11812 lt!394356) (_2!11812 lt!394356)) (_1!11812 lt!394356) (_2!11812 lt!394356)))))

(assert (=> d!85062 (= lt!394356 (readBitPure!0 lt!394358))))

(assert (=> d!85062 (= lt!394357 (readBitPure!0 lt!393988))))

(assert (=> d!85062 (= lt!394358 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 lt!393988) (currentBit!11998 lt!393988)))))

(assert (=> d!85062 (invariant!0 (currentBit!11998 lt!393988) (currentByte!12003 lt!393988) (size!6031 (buf!6539 (_2!11814 lt!393993))))))

(assert (=> d!85062 (= (readBitPrefixLemma!0 lt!393988 (_2!11814 lt!393993)) lt!394359)))

(declare-fun b!253923 () Bool)

(assert (=> b!253923 (= e!175939 (= (_2!11812 lt!394357) (_2!11812 lt!394356)))))

(assert (= (and d!85062 res!212781) b!253923))

(declare-fun m!382337 () Bool)

(assert (=> d!85062 m!382337))

(assert (=> d!85062 m!381943))

(declare-fun m!382339 () Bool)

(assert (=> d!85062 m!382339))

(declare-fun m!382341 () Bool)

(assert (=> d!85062 m!382341))

(declare-fun m!382343 () Bool)

(assert (=> d!85062 m!382343))

(declare-fun m!382345 () Bool)

(assert (=> d!85062 m!382345))

(assert (=> b!253713 d!85062))

(declare-fun d!85064 () Bool)

(assert (=> d!85064 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!394360 () Unit!18237)

(assert (=> d!85064 (= lt!394360 (choose!9 thiss!1005 (buf!6539 (_2!11814 lt!393993)) (bvsub nBits!297 from!289) (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (=> d!85064 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6539 (_2!11814 lt!393993)) (bvsub nBits!297 from!289)) lt!394360)))

(declare-fun bs!21508 () Bool)

(assert (= bs!21508 d!85064))

(assert (=> bs!21508 m!381965))

(declare-fun m!382347 () Bool)

(assert (=> bs!21508 m!382347))

(assert (=> b!253713 d!85064))

(declare-fun b!253934 () Bool)

(declare-fun e!175945 () Unit!18237)

(declare-fun Unit!18245 () Unit!18237)

(assert (=> b!253934 (= e!175945 Unit!18245)))

(declare-fun d!85066 () Bool)

(declare-fun e!175944 () Bool)

(assert (=> d!85066 e!175944))

(declare-fun res!212788 () Bool)

(assert (=> d!85066 (=> (not res!212788) (not e!175944))))

(declare-fun lt!394417 () tuple2!21764)

(assert (=> d!85066 (= res!212788 (isPrefixOf!0 (_1!11813 lt!394417) (_2!11813 lt!394417)))))

(declare-fun lt!394412 () BitStream!10984)

(assert (=> d!85066 (= lt!394417 (tuple2!21765 lt!394412 (_2!11814 lt!393993)))))

(declare-fun lt!394409 () Unit!18237)

(declare-fun lt!394418 () Unit!18237)

(assert (=> d!85066 (= lt!394409 lt!394418)))

(assert (=> d!85066 (isPrefixOf!0 lt!394412 (_2!11814 lt!393993))))

(assert (=> d!85066 (= lt!394418 (lemmaIsPrefixTransitive!0 lt!394412 (_2!11814 lt!393993) (_2!11814 lt!393993)))))

(declare-fun lt!394415 () Unit!18237)

(declare-fun lt!394402 () Unit!18237)

(assert (=> d!85066 (= lt!394415 lt!394402)))

(assert (=> d!85066 (isPrefixOf!0 lt!394412 (_2!11814 lt!393993))))

(assert (=> d!85066 (= lt!394402 (lemmaIsPrefixTransitive!0 lt!394412 (_2!11814 lt!393981) (_2!11814 lt!393993)))))

(declare-fun lt!394407 () Unit!18237)

(assert (=> d!85066 (= lt!394407 e!175945)))

(declare-fun c!11699 () Bool)

(assert (=> d!85066 (= c!11699 (not (= (size!6031 (buf!6539 (_2!11814 lt!393981))) #b00000000000000000000000000000000)))))

(declare-fun lt!394420 () Unit!18237)

(declare-fun lt!394403 () Unit!18237)

(assert (=> d!85066 (= lt!394420 lt!394403)))

(assert (=> d!85066 (isPrefixOf!0 (_2!11814 lt!393993) (_2!11814 lt!393993))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10984) Unit!18237)

(assert (=> d!85066 (= lt!394403 (lemmaIsPrefixRefl!0 (_2!11814 lt!393993)))))

(declare-fun lt!394404 () Unit!18237)

(declare-fun lt!394401 () Unit!18237)

(assert (=> d!85066 (= lt!394404 lt!394401)))

(assert (=> d!85066 (= lt!394401 (lemmaIsPrefixRefl!0 (_2!11814 lt!393993)))))

(declare-fun lt!394408 () Unit!18237)

(declare-fun lt!394414 () Unit!18237)

(assert (=> d!85066 (= lt!394408 lt!394414)))

(assert (=> d!85066 (isPrefixOf!0 lt!394412 lt!394412)))

(assert (=> d!85066 (= lt!394414 (lemmaIsPrefixRefl!0 lt!394412))))

(declare-fun lt!394416 () Unit!18237)

(declare-fun lt!394413 () Unit!18237)

(assert (=> d!85066 (= lt!394416 lt!394413)))

(assert (=> d!85066 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!393981))))

(assert (=> d!85066 (= lt!394413 (lemmaIsPrefixRefl!0 (_2!11814 lt!393981)))))

(assert (=> d!85066 (= lt!394412 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(assert (=> d!85066 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!393993))))

(assert (=> d!85066 (= (reader!0 (_2!11814 lt!393981) (_2!11814 lt!393993)) lt!394417)))

(declare-fun b!253935 () Bool)

(declare-fun lt!394411 () (_ BitVec 64))

(declare-fun lt!394406 () (_ BitVec 64))

(assert (=> b!253935 (= e!175944 (= (_1!11813 lt!394417) (withMovedBitIndex!0 (_2!11813 lt!394417) (bvsub lt!394406 lt!394411))))))

(assert (=> b!253935 (or (= (bvand lt!394406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394411 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394406 lt!394411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253935 (= lt!394411 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993))))))

(assert (=> b!253935 (= lt!394406 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(declare-fun b!253936 () Bool)

(declare-fun res!212789 () Bool)

(assert (=> b!253936 (=> (not res!212789) (not e!175944))))

(assert (=> b!253936 (= res!212789 (isPrefixOf!0 (_1!11813 lt!394417) (_2!11814 lt!393981)))))

(declare-fun b!253937 () Bool)

(declare-fun res!212790 () Bool)

(assert (=> b!253937 (=> (not res!212790) (not e!175944))))

(assert (=> b!253937 (= res!212790 (isPrefixOf!0 (_2!11813 lt!394417) (_2!11814 lt!393993)))))

(declare-fun b!253938 () Bool)

(declare-fun lt!394410 () Unit!18237)

(assert (=> b!253938 (= e!175945 lt!394410)))

(declare-fun lt!394405 () (_ BitVec 64))

(assert (=> b!253938 (= lt!394405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!394419 () (_ BitVec 64))

(assert (=> b!253938 (= lt!394419 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13747 array!13747 (_ BitVec 64) (_ BitVec 64)) Unit!18237)

(assert (=> b!253938 (= lt!394410 (arrayBitRangesEqSymmetric!0 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!393993)) lt!394405 lt!394419))))

(assert (=> b!253938 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393993)) (buf!6539 (_2!11814 lt!393981)) lt!394405 lt!394419)))

(assert (= (and d!85066 c!11699) b!253938))

(assert (= (and d!85066 (not c!11699)) b!253934))

(assert (= (and d!85066 res!212788) b!253936))

(assert (= (and b!253936 res!212789) b!253937))

(assert (= (and b!253937 res!212790) b!253935))

(declare-fun m!382349 () Bool)

(assert (=> b!253936 m!382349))

(declare-fun m!382351 () Bool)

(assert (=> b!253935 m!382351))

(assert (=> b!253935 m!382005))

(assert (=> b!253935 m!381999))

(declare-fun m!382353 () Bool)

(assert (=> b!253937 m!382353))

(assert (=> b!253938 m!381999))

(declare-fun m!382355 () Bool)

(assert (=> b!253938 m!382355))

(declare-fun m!382357 () Bool)

(assert (=> b!253938 m!382357))

(declare-fun m!382359 () Bool)

(assert (=> d!85066 m!382359))

(declare-fun m!382361 () Bool)

(assert (=> d!85066 m!382361))

(declare-fun m!382363 () Bool)

(assert (=> d!85066 m!382363))

(declare-fun m!382365 () Bool)

(assert (=> d!85066 m!382365))

(declare-fun m!382367 () Bool)

(assert (=> d!85066 m!382367))

(declare-fun m!382369 () Bool)

(assert (=> d!85066 m!382369))

(declare-fun m!382371 () Bool)

(assert (=> d!85066 m!382371))

(assert (=> d!85066 m!381991))

(declare-fun m!382373 () Bool)

(assert (=> d!85066 m!382373))

(declare-fun m!382375 () Bool)

(assert (=> d!85066 m!382375))

(declare-fun m!382377 () Bool)

(assert (=> d!85066 m!382377))

(assert (=> b!253713 d!85066))

(declare-fun b!253939 () Bool)

(declare-fun e!175947 () Unit!18237)

(declare-fun Unit!18246 () Unit!18237)

(assert (=> b!253939 (= e!175947 Unit!18246)))

(declare-fun d!85068 () Bool)

(declare-fun e!175946 () Bool)

(assert (=> d!85068 e!175946))

(declare-fun res!212791 () Bool)

(assert (=> d!85068 (=> (not res!212791) (not e!175946))))

(declare-fun lt!394437 () tuple2!21764)

(assert (=> d!85068 (= res!212791 (isPrefixOf!0 (_1!11813 lt!394437) (_2!11813 lt!394437)))))

(declare-fun lt!394432 () BitStream!10984)

(assert (=> d!85068 (= lt!394437 (tuple2!21765 lt!394432 (_2!11814 lt!393993)))))

(declare-fun lt!394429 () Unit!18237)

(declare-fun lt!394438 () Unit!18237)

(assert (=> d!85068 (= lt!394429 lt!394438)))

(assert (=> d!85068 (isPrefixOf!0 lt!394432 (_2!11814 lt!393993))))

(assert (=> d!85068 (= lt!394438 (lemmaIsPrefixTransitive!0 lt!394432 (_2!11814 lt!393993) (_2!11814 lt!393993)))))

(declare-fun lt!394435 () Unit!18237)

(declare-fun lt!394422 () Unit!18237)

(assert (=> d!85068 (= lt!394435 lt!394422)))

(assert (=> d!85068 (isPrefixOf!0 lt!394432 (_2!11814 lt!393993))))

(assert (=> d!85068 (= lt!394422 (lemmaIsPrefixTransitive!0 lt!394432 thiss!1005 (_2!11814 lt!393993)))))

(declare-fun lt!394427 () Unit!18237)

(assert (=> d!85068 (= lt!394427 e!175947)))

(declare-fun c!11700 () Bool)

(assert (=> d!85068 (= c!11700 (not (= (size!6031 (buf!6539 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!394440 () Unit!18237)

(declare-fun lt!394423 () Unit!18237)

(assert (=> d!85068 (= lt!394440 lt!394423)))

(assert (=> d!85068 (isPrefixOf!0 (_2!11814 lt!393993) (_2!11814 lt!393993))))

(assert (=> d!85068 (= lt!394423 (lemmaIsPrefixRefl!0 (_2!11814 lt!393993)))))

(declare-fun lt!394424 () Unit!18237)

(declare-fun lt!394421 () Unit!18237)

(assert (=> d!85068 (= lt!394424 lt!394421)))

(assert (=> d!85068 (= lt!394421 (lemmaIsPrefixRefl!0 (_2!11814 lt!393993)))))

(declare-fun lt!394428 () Unit!18237)

(declare-fun lt!394434 () Unit!18237)

(assert (=> d!85068 (= lt!394428 lt!394434)))

(assert (=> d!85068 (isPrefixOf!0 lt!394432 lt!394432)))

(assert (=> d!85068 (= lt!394434 (lemmaIsPrefixRefl!0 lt!394432))))

(declare-fun lt!394436 () Unit!18237)

(declare-fun lt!394433 () Unit!18237)

(assert (=> d!85068 (= lt!394436 lt!394433)))

(assert (=> d!85068 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!85068 (= lt!394433 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!85068 (= lt!394432 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(assert (=> d!85068 (isPrefixOf!0 thiss!1005 (_2!11814 lt!393993))))

(assert (=> d!85068 (= (reader!0 thiss!1005 (_2!11814 lt!393993)) lt!394437)))

(declare-fun b!253940 () Bool)

(declare-fun lt!394426 () (_ BitVec 64))

(declare-fun lt!394431 () (_ BitVec 64))

(assert (=> b!253940 (= e!175946 (= (_1!11813 lt!394437) (withMovedBitIndex!0 (_2!11813 lt!394437) (bvsub lt!394426 lt!394431))))))

(assert (=> b!253940 (or (= (bvand lt!394426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394426 lt!394431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253940 (= lt!394431 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993))))))

(assert (=> b!253940 (= lt!394426 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(declare-fun b!253941 () Bool)

(declare-fun res!212792 () Bool)

(assert (=> b!253941 (=> (not res!212792) (not e!175946))))

(assert (=> b!253941 (= res!212792 (isPrefixOf!0 (_1!11813 lt!394437) thiss!1005))))

(declare-fun b!253942 () Bool)

(declare-fun res!212793 () Bool)

(assert (=> b!253942 (=> (not res!212793) (not e!175946))))

(assert (=> b!253942 (= res!212793 (isPrefixOf!0 (_2!11813 lt!394437) (_2!11814 lt!393993)))))

(declare-fun b!253943 () Bool)

(declare-fun lt!394430 () Unit!18237)

(assert (=> b!253943 (= e!175947 lt!394430)))

(declare-fun lt!394425 () (_ BitVec 64))

(assert (=> b!253943 (= lt!394425 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!394439 () (_ BitVec 64))

(assert (=> b!253943 (= lt!394439 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(assert (=> b!253943 (= lt!394430 (arrayBitRangesEqSymmetric!0 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393993)) lt!394425 lt!394439))))

(assert (=> b!253943 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393993)) (buf!6539 thiss!1005) lt!394425 lt!394439)))

(assert (= (and d!85068 c!11700) b!253943))

(assert (= (and d!85068 (not c!11700)) b!253939))

(assert (= (and d!85068 res!212791) b!253941))

(assert (= (and b!253941 res!212792) b!253942))

(assert (= (and b!253942 res!212793) b!253940))

(declare-fun m!382379 () Bool)

(assert (=> b!253941 m!382379))

(declare-fun m!382381 () Bool)

(assert (=> b!253940 m!382381))

(assert (=> b!253940 m!382005))

(assert (=> b!253940 m!382001))

(declare-fun m!382383 () Bool)

(assert (=> b!253942 m!382383))

(assert (=> b!253943 m!382001))

(declare-fun m!382385 () Bool)

(assert (=> b!253943 m!382385))

(declare-fun m!382387 () Bool)

(assert (=> b!253943 m!382387))

(assert (=> d!85068 m!382359))

(declare-fun m!382389 () Bool)

(assert (=> d!85068 m!382389))

(declare-fun m!382391 () Bool)

(assert (=> d!85068 m!382391))

(declare-fun m!382393 () Bool)

(assert (=> d!85068 m!382393))

(assert (=> d!85068 m!382367))

(declare-fun m!382395 () Bool)

(assert (=> d!85068 m!382395))

(declare-fun m!382397 () Bool)

(assert (=> d!85068 m!382397))

(assert (=> d!85068 m!381959))

(declare-fun m!382399 () Bool)

(assert (=> d!85068 m!382399))

(declare-fun m!382401 () Bool)

(assert (=> d!85068 m!382401))

(declare-fun m!382403 () Bool)

(assert (=> d!85068 m!382403))

(assert (=> b!253713 d!85068))

(declare-fun d!85070 () Bool)

(declare-fun lt!394441 () tuple2!21782)

(assert (=> d!85070 (= lt!394441 (readBit!0 lt!393988))))

(assert (=> d!85070 (= (readBitPure!0 lt!393988) (tuple2!21763 (_2!11822 lt!394441) (_1!11822 lt!394441)))))

(declare-fun bs!21509 () Bool)

(assert (= bs!21509 d!85070))

(declare-fun m!382405 () Bool)

(assert (=> bs!21509 m!382405))

(assert (=> b!253713 d!85070))

(declare-fun d!85072 () Bool)

(declare-fun lt!394442 () tuple2!21782)

(assert (=> d!85072 (= lt!394442 (readBit!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (=> d!85072 (= (readBitPure!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))) (tuple2!21763 (_2!11822 lt!394442) (_1!11822 lt!394442)))))

(declare-fun bs!21510 () Bool)

(assert (= bs!21510 d!85072))

(declare-fun m!382407 () Bool)

(assert (=> bs!21510 m!382407))

(assert (=> b!253713 d!85072))

(declare-fun d!85074 () Bool)

(declare-fun res!212795 () Bool)

(declare-fun e!175948 () Bool)

(assert (=> d!85074 (=> (not res!212795) (not e!175948))))

(assert (=> d!85074 (= res!212795 (= (size!6031 (buf!6539 thiss!1005)) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85074 (= (isPrefixOf!0 thiss!1005 (_2!11814 lt!393993)) e!175948)))

(declare-fun b!253944 () Bool)

(declare-fun res!212794 () Bool)

(assert (=> b!253944 (=> (not res!212794) (not e!175948))))

(assert (=> b!253944 (= res!212794 (bvsle (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun b!253945 () Bool)

(declare-fun e!175949 () Bool)

(assert (=> b!253945 (= e!175948 e!175949)))

(declare-fun res!212796 () Bool)

(assert (=> b!253945 (=> res!212796 e!175949)))

(assert (=> b!253945 (= res!212796 (= (size!6031 (buf!6539 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!253946 () Bool)

(assert (=> b!253946 (= e!175949 (arrayBitRangesEq!0 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (= (and d!85074 res!212795) b!253944))

(assert (= (and b!253944 res!212794) b!253945))

(assert (= (and b!253945 (not res!212796)) b!253946))

(assert (=> b!253944 m!382001))

(assert (=> b!253944 m!382005))

(assert (=> b!253946 m!382001))

(assert (=> b!253946 m!382001))

(declare-fun m!382409 () Bool)

(assert (=> b!253946 m!382409))

(assert (=> b!253713 d!85074))

(declare-fun d!85076 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!85076 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21511 () Bool)

(assert (= bs!21511 d!85076))

(declare-fun m!382411 () Bool)

(assert (=> bs!21511 m!382411))

(assert (=> b!253713 d!85076))

(declare-fun lt!394445 () tuple2!21782)

(declare-fun d!85078 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10984 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21782)

(assert (=> d!85078 (= lt!394445 (checkBitsLoop!0 (_1!11813 lt!393992) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85078 (= (checkBitsLoopPure!0 (_1!11813 lt!393992) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21763 (_2!11822 lt!394445) (_1!11822 lt!394445)))))

(declare-fun bs!21512 () Bool)

(assert (= bs!21512 d!85078))

(declare-fun m!382413 () Bool)

(assert (=> bs!21512 m!382413))

(assert (=> b!253713 d!85078))

(declare-fun b!253968 () Bool)

(declare-fun res!212817 () Bool)

(declare-fun e!175964 () Bool)

(assert (=> b!253968 (=> (not res!212817) (not e!175964))))

(declare-fun lt!394465 () (_ BitVec 64))

(declare-fun lt!394463 () tuple2!21766)

(declare-fun lt!394466 () (_ BitVec 64))

(assert (=> b!253968 (= res!212817 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394463))) (currentByte!12003 (_2!11814 lt!394463)) (currentBit!11998 (_2!11814 lt!394463))) (bvadd lt!394465 lt!394466)))))

(assert (=> b!253968 (or (not (= (bvand lt!394465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394466 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394465 lt!394466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!253968 (= lt!394466 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!253968 (= lt!394465 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(declare-fun b!253969 () Bool)

(declare-fun res!212820 () Bool)

(assert (=> b!253969 (=> (not res!212820) (not e!175964))))

(assert (=> b!253969 (= res!212820 (isPrefixOf!0 thiss!1005 (_2!11814 lt!394463)))))

(declare-fun b!253970 () Bool)

(declare-fun e!175963 () Bool)

(assert (=> b!253970 (= e!175964 e!175963)))

(declare-fun res!212819 () Bool)

(assert (=> b!253970 (=> (not res!212819) (not e!175963))))

(declare-fun lt!394464 () tuple2!21762)

(assert (=> b!253970 (= res!212819 (and (= (_2!11812 lt!394464) bit!26) (= (_1!11812 lt!394464) (_2!11814 lt!394463))))))

(assert (=> b!253970 (= lt!394464 (readBitPure!0 (readerFrom!0 (_2!11814 lt!394463) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))))

(declare-fun b!253971 () Bool)

(assert (=> b!253971 (= e!175963 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!394464))) (currentByte!12003 (_1!11812 lt!394464)) (currentBit!11998 (_1!11812 lt!394464))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394463))) (currentByte!12003 (_2!11814 lt!394463)) (currentBit!11998 (_2!11814 lt!394463)))))))

(declare-fun d!85082 () Bool)

(assert (=> d!85082 e!175964))

(declare-fun res!212818 () Bool)

(assert (=> d!85082 (=> (not res!212818) (not e!175964))))

(assert (=> d!85082 (= res!212818 (= (size!6031 (buf!6539 thiss!1005)) (size!6031 (buf!6539 (_2!11814 lt!394463)))))))

(declare-fun choose!16 (BitStream!10984 Bool) tuple2!21766)

(assert (=> d!85082 (= lt!394463 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!85082 (validate_offset_bit!0 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005)))))

(assert (=> d!85082 (= (appendBit!0 thiss!1005 bit!26) lt!394463)))

(assert (= (and d!85082 res!212818) b!253968))

(assert (= (and b!253968 res!212817) b!253969))

(assert (= (and b!253969 res!212820) b!253970))

(assert (= (and b!253970 res!212819) b!253971))

(declare-fun m!382429 () Bool)

(assert (=> b!253971 m!382429))

(declare-fun m!382431 () Bool)

(assert (=> b!253971 m!382431))

(declare-fun m!382433 () Bool)

(assert (=> b!253970 m!382433))

(assert (=> b!253970 m!382433))

(declare-fun m!382435 () Bool)

(assert (=> b!253970 m!382435))

(declare-fun m!382437 () Bool)

(assert (=> b!253969 m!382437))

(declare-fun m!382439 () Bool)

(assert (=> d!85082 m!382439))

(declare-fun m!382441 () Bool)

(assert (=> d!85082 m!382441))

(assert (=> b!253968 m!382431))

(assert (=> b!253968 m!382001))

(assert (=> b!253713 d!85082))

(declare-fun d!85092 () Bool)

(declare-fun e!175967 () Bool)

(assert (=> d!85092 e!175967))

(declare-fun res!212825 () Bool)

(assert (=> d!85092 (=> (not res!212825) (not e!175967))))

(declare-fun lt!394481 () (_ BitVec 64))

(declare-fun lt!394484 () (_ BitVec 64))

(declare-fun lt!394482 () (_ BitVec 64))

(assert (=> d!85092 (= res!212825 (= lt!394484 (bvsub lt!394482 lt!394481)))))

(assert (=> d!85092 (or (= (bvand lt!394482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394482 lt!394481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85092 (= lt!394481 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393978)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393978))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393978)))))))

(declare-fun lt!394483 () (_ BitVec 64))

(declare-fun lt!394479 () (_ BitVec 64))

(assert (=> d!85092 (= lt!394482 (bvmul lt!394483 lt!394479))))

(assert (=> d!85092 (or (= lt!394483 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394479 (bvsdiv (bvmul lt!394483 lt!394479) lt!394483)))))

(assert (=> d!85092 (= lt!394479 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85092 (= lt!394483 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393978)))))))

(assert (=> d!85092 (= lt!394484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393978))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393978)))))))

(assert (=> d!85092 (invariant!0 (currentBit!11998 (_1!11812 lt!393978)) (currentByte!12003 (_1!11812 lt!393978)) (size!6031 (buf!6539 (_1!11812 lt!393978))))))

(assert (=> d!85092 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!393978))) (currentByte!12003 (_1!11812 lt!393978)) (currentBit!11998 (_1!11812 lt!393978))) lt!394484)))

(declare-fun b!253976 () Bool)

(declare-fun res!212826 () Bool)

(assert (=> b!253976 (=> (not res!212826) (not e!175967))))

(assert (=> b!253976 (= res!212826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394484))))

(declare-fun b!253977 () Bool)

(declare-fun lt!394480 () (_ BitVec 64))

(assert (=> b!253977 (= e!175967 (bvsle lt!394484 (bvmul lt!394480 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253977 (or (= lt!394480 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394480 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394480)))))

(assert (=> b!253977 (= lt!394480 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393978)))))))

(assert (= (and d!85092 res!212825) b!253976))

(assert (= (and b!253976 res!212826) b!253977))

(declare-fun m!382443 () Bool)

(assert (=> d!85092 m!382443))

(declare-fun m!382445 () Bool)

(assert (=> d!85092 m!382445))

(assert (=> b!253713 d!85092))

(declare-fun d!85094 () Bool)

(declare-fun e!175968 () Bool)

(assert (=> d!85094 e!175968))

(declare-fun res!212827 () Bool)

(assert (=> d!85094 (=> (not res!212827) (not e!175968))))

(declare-fun lt!394487 () (_ BitVec 64))

(declare-fun lt!394488 () (_ BitVec 64))

(declare-fun lt!394490 () (_ BitVec 64))

(assert (=> d!85094 (= res!212827 (= lt!394490 (bvsub lt!394488 lt!394487)))))

(assert (=> d!85094 (or (= (bvand lt!394488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394488 lt!394487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85094 (= lt!394487 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393987)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393987))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393987)))))))

(declare-fun lt!394489 () (_ BitVec 64))

(declare-fun lt!394485 () (_ BitVec 64))

(assert (=> d!85094 (= lt!394488 (bvmul lt!394489 lt!394485))))

(assert (=> d!85094 (or (= lt!394489 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394485 (bvsdiv (bvmul lt!394489 lt!394485) lt!394489)))))

(assert (=> d!85094 (= lt!394485 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85094 (= lt!394489 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393987)))))))

(assert (=> d!85094 (= lt!394490 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393987))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393987)))))))

(assert (=> d!85094 (invariant!0 (currentBit!11998 (_1!11812 lt!393987)) (currentByte!12003 (_1!11812 lt!393987)) (size!6031 (buf!6539 (_1!11812 lt!393987))))))

(assert (=> d!85094 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!393987))) (currentByte!12003 (_1!11812 lt!393987)) (currentBit!11998 (_1!11812 lt!393987))) lt!394490)))

(declare-fun b!253978 () Bool)

(declare-fun res!212828 () Bool)

(assert (=> b!253978 (=> (not res!212828) (not e!175968))))

(assert (=> b!253978 (= res!212828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394490))))

(declare-fun b!253979 () Bool)

(declare-fun lt!394486 () (_ BitVec 64))

(assert (=> b!253979 (= e!175968 (bvsle lt!394490 (bvmul lt!394486 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!253979 (or (= lt!394486 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394486 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394486)))))

(assert (=> b!253979 (= lt!394486 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393987)))))))

(assert (= (and d!85094 res!212827) b!253978))

(assert (= (and b!253978 res!212828) b!253979))

(declare-fun m!382447 () Bool)

(assert (=> d!85094 m!382447))

(declare-fun m!382449 () Bool)

(assert (=> d!85094 m!382449))

(assert (=> b!253713 d!85094))

(declare-fun b!254017 () Bool)

(declare-fun res!212858 () Bool)

(declare-fun e!175985 () Bool)

(assert (=> b!254017 (=> (not res!212858) (not e!175985))))

(declare-fun lt!394589 () tuple2!21766)

(assert (=> b!254017 (= res!212858 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!394589)))))

(declare-fun b!254018 () Bool)

(declare-fun lt!394588 () tuple2!21762)

(declare-fun lt!394584 () tuple2!21764)

(assert (=> b!254018 (= e!175985 (and (_2!11812 lt!394588) (= (_1!11812 lt!394588) (_2!11813 lt!394584))))))

(assert (=> b!254018 (= lt!394588 (checkBitsLoopPure!0 (_1!11813 lt!394584) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!394583 () Unit!18237)

(declare-fun lt!394585 () Unit!18237)

(assert (=> b!254018 (= lt!394583 lt!394585)))

(declare-fun lt!394587 () (_ BitVec 64))

(assert (=> b!254018 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394589)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!394587)))

(assert (=> b!254018 (= lt!394585 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!394589)) lt!394587))))

(declare-fun e!175986 () Bool)

(assert (=> b!254018 e!175986))

(declare-fun res!212859 () Bool)

(assert (=> b!254018 (=> (not res!212859) (not e!175986))))

(assert (=> b!254018 (= res!212859 (and (= (size!6031 (buf!6539 (_2!11814 lt!393981))) (size!6031 (buf!6539 (_2!11814 lt!394589)))) (bvsge lt!394587 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254018 (= lt!394587 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254018 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254018 (= lt!394584 (reader!0 (_2!11814 lt!393981) (_2!11814 lt!394589)))))

(declare-fun b!254019 () Bool)

(assert (=> b!254019 (= e!175986 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!394587))))

(declare-fun d!85096 () Bool)

(assert (=> d!85096 e!175985))

(declare-fun res!212860 () Bool)

(assert (=> d!85096 (=> (not res!212860) (not e!175985))))

(assert (=> d!85096 (= res!212860 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) (size!6031 (buf!6539 (_2!11814 lt!394589)))))))

(declare-fun choose!51 (BitStream!10984 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21766)

(assert (=> d!85096 (= lt!394589 (choose!51 (_2!11814 lt!393981) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85096 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85096 (= (appendNBitsLoop!0 (_2!11814 lt!393981) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!394589)))

(declare-fun b!254016 () Bool)

(declare-fun res!212861 () Bool)

(assert (=> b!254016 (=> (not res!212861) (not e!175985))))

(declare-fun lt!394586 () (_ BitVec 64))

(declare-fun lt!394590 () (_ BitVec 64))

(assert (=> b!254016 (= res!212861 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394589))) (currentByte!12003 (_2!11814 lt!394589)) (currentBit!11998 (_2!11814 lt!394589))) (bvadd lt!394590 lt!394586)))))

(assert (=> b!254016 (or (not (= (bvand lt!394590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394586 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!394590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!394590 lt!394586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254016 (= lt!394586 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254016 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254016 (= lt!394590 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(assert (= (and d!85096 res!212860) b!254016))

(assert (= (and b!254016 res!212861) b!254017))

(assert (= (and b!254017 res!212858) b!254018))

(assert (= (and b!254018 res!212859) b!254019))

(declare-fun m!382501 () Bool)

(assert (=> b!254016 m!382501))

(assert (=> b!254016 m!381999))

(declare-fun m!382503 () Bool)

(assert (=> b!254019 m!382503))

(declare-fun m!382505 () Bool)

(assert (=> b!254017 m!382505))

(declare-fun m!382507 () Bool)

(assert (=> d!85096 m!382507))

(declare-fun m!382509 () Bool)

(assert (=> b!254018 m!382509))

(declare-fun m!382511 () Bool)

(assert (=> b!254018 m!382511))

(declare-fun m!382513 () Bool)

(assert (=> b!254018 m!382513))

(declare-fun m!382515 () Bool)

(assert (=> b!254018 m!382515))

(assert (=> b!253713 d!85096))

(declare-fun d!85108 () Bool)

(declare-fun lt!394599 () tuple2!21782)

(assert (=> d!85108 (= lt!394599 (checkBitsLoop!0 (_1!11813 lt!393990) nBits!297 bit!26 from!289))))

(assert (=> d!85108 (= (checkBitsLoopPure!0 (_1!11813 lt!393990) nBits!297 bit!26 from!289) (tuple2!21763 (_2!11822 lt!394599) (_1!11822 lt!394599)))))

(declare-fun bs!21518 () Bool)

(assert (= bs!21518 d!85108))

(declare-fun m!382517 () Bool)

(assert (=> bs!21518 m!382517))

(assert (=> b!253713 d!85108))

(declare-fun d!85110 () Bool)

(assert (=> d!85110 (isPrefixOf!0 thiss!1005 (_2!11814 lt!393993))))

(declare-fun lt!394632 () Unit!18237)

(declare-fun choose!30 (BitStream!10984 BitStream!10984 BitStream!10984) Unit!18237)

(assert (=> d!85110 (= lt!394632 (choose!30 thiss!1005 (_2!11814 lt!393981) (_2!11814 lt!393993)))))

(assert (=> d!85110 (isPrefixOf!0 thiss!1005 (_2!11814 lt!393981))))

(assert (=> d!85110 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11814 lt!393981) (_2!11814 lt!393993)) lt!394632)))

(declare-fun bs!21519 () Bool)

(assert (= bs!21519 d!85110))

(assert (=> bs!21519 m!381959))

(declare-fun m!382523 () Bool)

(assert (=> bs!21519 m!382523))

(assert (=> bs!21519 m!381933))

(assert (=> b!253713 d!85110))

(declare-fun d!85114 () Bool)

(assert (=> d!85114 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393991) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) lt!393991))))

(declare-fun bs!21520 () Bool)

(assert (= bs!21520 d!85114))

(declare-fun m!382527 () Bool)

(assert (=> bs!21520 m!382527))

(assert (=> b!253713 d!85114))

(declare-fun d!85116 () Bool)

(declare-fun e!175994 () Bool)

(assert (=> d!85116 e!175994))

(declare-fun res!212873 () Bool)

(assert (=> d!85116 (=> (not res!212873) (not e!175994))))

(assert (=> d!85116 (= res!212873 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!394635 () Unit!18237)

(declare-fun choose!27 (BitStream!10984 BitStream!10984 (_ BitVec 64) (_ BitVec 64)) Unit!18237)

(assert (=> d!85116 (= lt!394635 (choose!27 thiss!1005 (_2!11814 lt!393981) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85116 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!85116 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11814 lt!393981) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!394635)))

(declare-fun b!254033 () Bool)

(assert (=> b!254033 (= e!175994 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!85116 res!212873) b!254033))

(declare-fun m!382553 () Bool)

(assert (=> d!85116 m!382553))

(declare-fun m!382555 () Bool)

(assert (=> b!254033 m!382555))

(assert (=> b!253713 d!85116))

(declare-fun d!85120 () Bool)

(declare-fun lt!394636 () tuple2!21782)

(assert (=> d!85120 (= lt!394636 (readBit!0 (_1!11813 lt!393990)))))

(assert (=> d!85120 (= (readBitPure!0 (_1!11813 lt!393990)) (tuple2!21763 (_2!11822 lt!394636) (_1!11822 lt!394636)))))

(declare-fun bs!21521 () Bool)

(assert (= bs!21521 d!85120))

(declare-fun m!382557 () Bool)

(assert (=> bs!21521 m!382557))

(assert (=> b!253713 d!85120))

(declare-fun d!85122 () Bool)

(assert (=> d!85122 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393991) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) lt!393991))))

(declare-fun bs!21522 () Bool)

(assert (= bs!21522 d!85122))

(declare-fun m!382559 () Bool)

(assert (=> bs!21522 m!382559))

(assert (=> b!253713 d!85122))

(declare-fun d!85124 () Bool)

(assert (=> d!85124 (= (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393993)))) (and (bvsge (currentBit!11998 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11998 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12003 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393993)))) (and (= (currentBit!11998 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393993))))))))))

(assert (=> b!253712 d!85124))

(declare-fun d!85126 () Bool)

(assert (=> d!85126 (= (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393981)))) (and (bvsge (currentBit!11998 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11998 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12003 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393981)))) (and (= (currentBit!11998 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!393981))))))))))

(assert (=> b!253711 d!85126))

(declare-fun d!85128 () Bool)

(declare-fun e!175995 () Bool)

(assert (=> d!85128 e!175995))

(declare-fun res!212874 () Bool)

(assert (=> d!85128 (=> (not res!212874) (not e!175995))))

(declare-fun lt!394639 () (_ BitVec 64))

(declare-fun lt!394640 () (_ BitVec 64))

(declare-fun lt!394642 () (_ BitVec 64))

(assert (=> d!85128 (= res!212874 (= lt!394642 (bvsub lt!394640 lt!394639)))))

(assert (=> d!85128 (or (= (bvand lt!394640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394640 lt!394639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85128 (= lt!394639 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393993))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun lt!394641 () (_ BitVec 64))

(declare-fun lt!394637 () (_ BitVec 64))

(assert (=> d!85128 (= lt!394640 (bvmul lt!394641 lt!394637))))

(assert (=> d!85128 (or (= lt!394641 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394637 (bvsdiv (bvmul lt!394641 lt!394637) lt!394641)))))

(assert (=> d!85128 (= lt!394637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85128 (= lt!394641 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85128 (= lt!394642 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393993))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393993)))))))

(assert (=> d!85128 (invariant!0 (currentBit!11998 (_2!11814 lt!393993)) (currentByte!12003 (_2!11814 lt!393993)) (size!6031 (buf!6539 (_2!11814 lt!393993))))))

(assert (=> d!85128 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993))) lt!394642)))

(declare-fun b!254034 () Bool)

(declare-fun res!212875 () Bool)

(assert (=> b!254034 (=> (not res!212875) (not e!175995))))

(assert (=> b!254034 (= res!212875 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394642))))

(declare-fun b!254035 () Bool)

(declare-fun lt!394638 () (_ BitVec 64))

(assert (=> b!254035 (= e!175995 (bvsle lt!394642 (bvmul lt!394638 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254035 (or (= lt!394638 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394638 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394638)))))

(assert (=> b!254035 (= lt!394638 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (= (and d!85128 res!212874) b!254034))

(assert (= (and b!254034 res!212875) b!254035))

(declare-fun m!382561 () Bool)

(assert (=> d!85128 m!382561))

(declare-fun m!382563 () Bool)

(assert (=> d!85128 m!382563))

(assert (=> b!253721 d!85128))

(declare-fun d!85130 () Bool)

(declare-fun e!175996 () Bool)

(assert (=> d!85130 e!175996))

(declare-fun res!212876 () Bool)

(assert (=> d!85130 (=> (not res!212876) (not e!175996))))

(declare-fun lt!394654 () (_ BitVec 64))

(declare-fun lt!394656 () (_ BitVec 64))

(declare-fun lt!394653 () (_ BitVec 64))

(assert (=> d!85130 (= res!212876 (= lt!394656 (bvsub lt!394654 lt!394653)))))

(assert (=> d!85130 (or (= (bvand lt!394654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394654 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394654 lt!394653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85130 (= lt!394653 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))))))

(declare-fun lt!394655 () (_ BitVec 64))

(declare-fun lt!394651 () (_ BitVec 64))

(assert (=> d!85130 (= lt!394654 (bvmul lt!394655 lt!394651))))

(assert (=> d!85130 (or (= lt!394655 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394651 (bvsdiv (bvmul lt!394655 lt!394651) lt!394655)))))

(assert (=> d!85130 (= lt!394651 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85130 (= lt!394655 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(assert (=> d!85130 (= lt!394656 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (=> d!85130 (invariant!0 (currentBit!11998 (_2!11814 lt!393981)) (currentByte!12003 (_2!11814 lt!393981)) (size!6031 (buf!6539 (_2!11814 lt!393981))))))

(assert (=> d!85130 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))) lt!394656)))

(declare-fun b!254036 () Bool)

(declare-fun res!212877 () Bool)

(assert (=> b!254036 (=> (not res!212877) (not e!175996))))

(assert (=> b!254036 (= res!212877 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394656))))

(declare-fun b!254037 () Bool)

(declare-fun lt!394652 () (_ BitVec 64))

(assert (=> b!254037 (= e!175996 (bvsle lt!394656 (bvmul lt!394652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254037 (or (= lt!394652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394652)))))

(assert (=> b!254037 (= lt!394652 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(assert (= (and d!85130 res!212876) b!254036))

(assert (= (and b!254036 res!212877) b!254037))

(assert (=> d!85130 m!382559))

(assert (=> d!85130 m!382321))

(assert (=> b!253721 d!85130))

(declare-fun d!85132 () Bool)

(assert (=> d!85132 (= (array_inv!5772 (buf!6539 thiss!1005)) (bvsge (size!6031 (buf!6539 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!253720 d!85132))

(assert (=> b!253709 d!85130))

(declare-fun d!85134 () Bool)

(declare-fun e!175999 () Bool)

(assert (=> d!85134 e!175999))

(declare-fun res!212880 () Bool)

(assert (=> d!85134 (=> (not res!212880) (not e!175999))))

(declare-fun lt!394660 () (_ BitVec 64))

(declare-fun lt!394659 () (_ BitVec 64))

(declare-fun lt!394662 () (_ BitVec 64))

(assert (=> d!85134 (= res!212880 (= lt!394662 (bvsub lt!394660 lt!394659)))))

(assert (=> d!85134 (or (= (bvand lt!394660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394659 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394660 lt!394659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85134 (= lt!394659 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005))))))

(declare-fun lt!394661 () (_ BitVec 64))

(declare-fun lt!394657 () (_ BitVec 64))

(assert (=> d!85134 (= lt!394660 (bvmul lt!394661 lt!394657))))

(assert (=> d!85134 (or (= lt!394661 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394657 (bvsdiv (bvmul lt!394661 lt!394657) lt!394661)))))

(assert (=> d!85134 (= lt!394657 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85134 (= lt!394661 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))))))

(assert (=> d!85134 (= lt!394662 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 thiss!1005))))))

(assert (=> d!85134 (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 thiss!1005)))))

(assert (=> d!85134 (= (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) lt!394662)))

(declare-fun b!254040 () Bool)

(declare-fun res!212881 () Bool)

(assert (=> b!254040 (=> (not res!212881) (not e!175999))))

(assert (=> b!254040 (= res!212881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394662))))

(declare-fun b!254041 () Bool)

(declare-fun lt!394658 () (_ BitVec 64))

(assert (=> b!254041 (= e!175999 (bvsle lt!394662 (bvmul lt!394658 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254041 (or (= lt!394658 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394658 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394658)))))

(assert (=> b!254041 (= lt!394658 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))))))

(assert (= (and d!85134 res!212880) b!254040))

(assert (= (and b!254040 res!212881) b!254041))

(declare-fun m!382565 () Bool)

(assert (=> d!85134 m!382565))

(assert (=> d!85134 m!382333))

(assert (=> b!253709 d!85134))

(declare-fun d!85136 () Bool)

(declare-fun res!212883 () Bool)

(declare-fun e!176000 () Bool)

(assert (=> d!85136 (=> (not res!212883) (not e!176000))))

(assert (=> d!85136 (= res!212883 (= (size!6031 (buf!6539 thiss!1005)) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(assert (=> d!85136 (= (isPrefixOf!0 thiss!1005 (_2!11814 lt!393981)) e!176000)))

(declare-fun b!254042 () Bool)

(declare-fun res!212882 () Bool)

(assert (=> b!254042 (=> (not res!212882) (not e!176000))))

(assert (=> b!254042 (= res!212882 (bvsle (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(declare-fun b!254043 () Bool)

(declare-fun e!176001 () Bool)

(assert (=> b!254043 (= e!176000 e!176001)))

(declare-fun res!212884 () Bool)

(assert (=> b!254043 (=> res!212884 e!176001)))

(assert (=> b!254043 (= res!212884 (= (size!6031 (buf!6539 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254044 () Bool)

(assert (=> b!254044 (= e!176001 (arrayBitRangesEq!0 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393981)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (= (and d!85136 res!212883) b!254042))

(assert (= (and b!254042 res!212882) b!254043))

(assert (= (and b!254043 (not res!212884)) b!254044))

(assert (=> b!254042 m!382001))

(assert (=> b!254042 m!381999))

(assert (=> b!254044 m!382001))

(assert (=> b!254044 m!382001))

(declare-fun m!382567 () Bool)

(assert (=> b!254044 m!382567))

(assert (=> b!253719 d!85136))

(declare-fun d!85138 () Bool)

(assert (=> d!85138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21523 () Bool)

(assert (= bs!21523 d!85138))

(assert (=> bs!21523 m!382565))

(assert (=> b!253718 d!85138))

(declare-fun d!85140 () Bool)

(declare-fun lt!394667 () tuple2!21782)

(assert (=> d!85140 (= lt!394667 (checkBitsLoop!0 (_1!11813 lt!393995) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85140 (= (checkBitsLoopPure!0 (_1!11813 lt!393995) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21763 (_2!11822 lt!394667) (_1!11822 lt!394667)))))

(declare-fun bs!21524 () Bool)

(assert (= bs!21524 d!85140))

(declare-fun m!382571 () Bool)

(assert (=> bs!21524 m!382571))

(assert (=> b!253707 d!85140))

(declare-fun d!85142 () Bool)

(assert (=> d!85142 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393986) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) lt!393986))))

(declare-fun bs!21525 () Bool)

(assert (= bs!21525 d!85142))

(assert (=> bs!21525 m!382527))

(assert (=> b!253707 d!85142))

(declare-fun d!85146 () Bool)

(assert (=> d!85146 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393986)))

(declare-fun lt!394668 () Unit!18237)

(assert (=> d!85146 (= lt!394668 (choose!9 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393986 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (=> d!85146 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393986) lt!394668)))

(declare-fun bs!21526 () Bool)

(assert (= bs!21526 d!85146))

(assert (=> bs!21526 m!381995))

(declare-fun m!382581 () Bool)

(assert (=> bs!21526 m!382581))

(assert (=> b!253707 d!85146))

(assert (=> b!253707 d!85066))

(declare-fun d!85148 () Bool)

(declare-fun e!176003 () Bool)

(assert (=> d!85148 e!176003))

(declare-fun res!212886 () Bool)

(assert (=> d!85148 (=> (not res!212886) (not e!176003))))

(declare-fun lt!394672 () (_ BitVec 64))

(declare-fun lt!394671 () (_ BitVec 64))

(declare-fun lt!394674 () (_ BitVec 64))

(assert (=> d!85148 (= res!212886 (= lt!394674 (bvsub lt!394672 lt!394671)))))

(assert (=> d!85148 (or (= (bvand lt!394672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!394671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!394672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394672 lt!394671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85148 (= lt!394671 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393996)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393996))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393996)))))))

(declare-fun lt!394673 () (_ BitVec 64))

(declare-fun lt!394669 () (_ BitVec 64))

(assert (=> d!85148 (= lt!394672 (bvmul lt!394673 lt!394669))))

(assert (=> d!85148 (or (= lt!394673 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!394669 (bvsdiv (bvmul lt!394673 lt!394669) lt!394673)))))

(assert (=> d!85148 (= lt!394669 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85148 (= lt!394673 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393996)))))))

(assert (=> d!85148 (= lt!394674 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393996))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393996)))))))

(assert (=> d!85148 (invariant!0 (currentBit!11998 (_1!11812 lt!393996)) (currentByte!12003 (_1!11812 lt!393996)) (size!6031 (buf!6539 (_1!11812 lt!393996))))))

(assert (=> d!85148 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!393996))) (currentByte!12003 (_1!11812 lt!393996)) (currentBit!11998 (_1!11812 lt!393996))) lt!394674)))

(declare-fun b!254046 () Bool)

(declare-fun res!212887 () Bool)

(assert (=> b!254046 (=> (not res!212887) (not e!176003))))

(assert (=> b!254046 (= res!212887 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394674))))

(declare-fun b!254047 () Bool)

(declare-fun lt!394670 () (_ BitVec 64))

(assert (=> b!254047 (= e!176003 (bvsle lt!394674 (bvmul lt!394670 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254047 (or (= lt!394670 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!394670 #b0000000000000000000000000000000000000000000000000000000000001000) lt!394670)))))

(assert (=> b!254047 (= lt!394670 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393996)))))))

(assert (= (and d!85148 res!212886) b!254046))

(assert (= (and b!254046 res!212887) b!254047))

(declare-fun m!382583 () Bool)

(assert (=> d!85148 m!382583))

(declare-fun m!382585 () Bool)

(assert (=> d!85148 m!382585))

(assert (=> b!253717 d!85148))

(push 1)

(assert (not b!253969))

(assert (not b!254019))

(assert (not d!85096))

(assert (not d!85140))

(assert (not b!253940))

(assert (not d!85142))

(assert (not d!85094))

(assert (not b!253971))

(assert (not b!253937))

(assert (not d!85138))

(assert (not d!85130))

(assert (not d!85134))

(assert (not d!85082))

(assert (not b!254033))

(assert (not b!253936))

(assert (not b!254018))

(assert (not b!254017))

(assert (not b!253935))

(assert (not b!253944))

(assert (not d!85060))

(assert (not d!85108))

(assert (not b!253938))

(assert (not d!85062))

(assert (not b!254042))

(assert (not d!85076))

(assert (not d!85072))

(assert (not b!253943))

(assert (not b!253942))

(assert (not d!85092))

(assert (not b!253918))

(assert (not d!85068))

(assert (not d!85120))

(assert (not d!85054))

(assert (not d!85052))

(assert (not d!85070))

(assert (not b!253946))

(assert (not d!85148))

(assert (not d!85058))

(assert (not d!85110))

(assert (not b!253920))

(assert (not b!254016))

(assert (not d!85128))

(assert (not d!85064))

(assert (not b!253970))

(assert (not d!85116))

(assert (not d!85078))

(assert (not d!85066))

(assert (not b!253968))

(assert (not d!85122))

(assert (not b!253941))

(assert (not b!253908))

(assert (not d!85114))

(assert (not d!85050))

(assert (not b!254044))

(assert (not d!85146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85530 () Bool)

(assert (=> d!85530 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 thiss!1005)))))))

(assert (=> d!85076 d!85530))

(declare-fun b!254516 () Bool)

(declare-fun e!176343 () tuple2!21782)

(declare-fun e!176340 () tuple2!21782)

(assert (=> b!254516 (= e!176343 e!176340)))

(declare-fun lt!395273 () tuple2!21782)

(assert (=> b!254516 (= lt!395273 (readBit!0 (_1!11813 lt!393995)))))

(declare-fun c!11745 () Bool)

(assert (=> b!254516 (= c!11745 (not (= (_1!11822 lt!395273) bit!26)))))

(declare-fun lt!395270 () tuple2!21782)

(declare-fun b!254517 () Bool)

(assert (=> b!254517 (= lt!395270 (checkBitsLoop!0 (_2!11822 lt!395273) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!395272 () Unit!18237)

(declare-fun lt!395269 () Unit!18237)

(assert (=> b!254517 (= lt!395272 lt!395269)))

(declare-fun lt!395276 () (_ BitVec 64))

(declare-fun lt!395275 () (_ BitVec 64))

(assert (=> b!254517 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11822 lt!395273)))) ((_ sign_extend 32) (currentByte!12003 (_2!11822 lt!395273))) ((_ sign_extend 32) (currentBit!11998 (_2!11822 lt!395273))) (bvsub lt!395276 lt!395275))))

(assert (=> b!254517 (= lt!395269 (validateOffsetBitsIneqLemma!0 (_1!11813 lt!393995) (_2!11822 lt!395273) lt!395276 lt!395275))))

(assert (=> b!254517 (= lt!395275 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254517 (= lt!395276 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254517 (= e!176340 (tuple2!21783 (_1!11822 lt!395270) (_2!11822 lt!395270)))))

(declare-fun b!254518 () Bool)

(declare-fun e!176342 () Bool)

(assert (=> b!254518 (= e!176342 (= bit!26 (_2!11812 (readBitPure!0 (_1!11813 lt!393995)))))))

(declare-fun lt!395277 () (_ BitVec 64))

(declare-fun lt!395274 () tuple2!21782)

(declare-fun e!176341 () Bool)

(declare-fun b!254519 () Bool)

(assert (=> b!254519 (= e!176341 (= (bvsub lt!395277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6031 (buf!6539 (_2!11822 lt!395274))) (currentByte!12003 (_2!11822 lt!395274)) (currentBit!11998 (_2!11822 lt!395274)))))))

(assert (=> b!254519 (or (= (bvand lt!395277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395278 () (_ BitVec 64))

(assert (=> b!254519 (= lt!395277 (bvadd lt!395278 nBits!297))))

(assert (=> b!254519 (or (not (= (bvand lt!395278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395278 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254519 (= lt!395278 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393995))) (currentByte!12003 (_1!11813 lt!393995)) (currentBit!11998 (_1!11813 lt!393995))))))

(declare-fun b!254521 () Bool)

(declare-fun res!213261 () Bool)

(declare-fun e!176339 () Bool)

(assert (=> b!254521 (=> (not res!213261) (not e!176339))))

(assert (=> b!254521 (= res!213261 e!176341)))

(declare-fun res!213262 () Bool)

(assert (=> b!254521 (=> res!213262 e!176341)))

(assert (=> b!254521 (= res!213262 (not (_1!11822 lt!395274)))))

(declare-fun b!254522 () Bool)

(assert (=> b!254522 (= e!176340 (tuple2!21783 false (_2!11822 lt!395273)))))

(declare-fun b!254523 () Bool)

(declare-fun res!213264 () Bool)

(assert (=> b!254523 (=> (not res!213264) (not e!176339))))

(assert (=> b!254523 (= res!213264 (and (= (buf!6539 (_1!11813 lt!393995)) (buf!6539 (_2!11822 lt!395274))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11822 lt!395274))))))

(declare-fun b!254524 () Bool)

(assert (=> b!254524 (= e!176343 (tuple2!21783 true (_1!11813 lt!393995)))))

(declare-fun b!254520 () Bool)

(assert (=> b!254520 (= e!176339 e!176342)))

(declare-fun res!213265 () Bool)

(assert (=> b!254520 (=> res!213265 e!176342)))

(assert (=> b!254520 (= res!213265 (or (not (_1!11822 lt!395274)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun d!85532 () Bool)

(assert (=> d!85532 e!176339))

(declare-fun res!213263 () Bool)

(assert (=> d!85532 (=> (not res!213263) (not e!176339))))

(declare-fun lt!395268 () (_ BitVec 64))

(assert (=> d!85532 (= res!213263 (bvsge (bvsub lt!395268 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6031 (buf!6539 (_2!11822 lt!395274))) (currentByte!12003 (_2!11822 lt!395274)) (currentBit!11998 (_2!11822 lt!395274)))))))

(assert (=> d!85532 (or (= (bvand lt!395268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395268 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395271 () (_ BitVec 64))

(assert (=> d!85532 (= lt!395268 (bvadd lt!395271 nBits!297))))

(assert (=> d!85532 (or (not (= (bvand lt!395271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395271 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85532 (= lt!395271 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393995))) (currentByte!12003 (_1!11813 lt!393995)) (currentBit!11998 (_1!11813 lt!393995))))))

(assert (=> d!85532 (= lt!395274 e!176343)))

(declare-fun c!11746 () Bool)

(assert (=> d!85532 (= c!11746 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!85532 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85532 (= (checkBitsLoop!0 (_1!11813 lt!393995) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!395274)))

(assert (= (and d!85532 c!11746) b!254524))

(assert (= (and d!85532 (not c!11746)) b!254516))

(assert (= (and b!254516 c!11745) b!254522))

(assert (= (and b!254516 (not c!11745)) b!254517))

(assert (= (and d!85532 res!213263) b!254523))

(assert (= (and b!254523 res!213264) b!254521))

(assert (= (and b!254521 (not res!213262)) b!254519))

(assert (= (and b!254521 res!213261) b!254520))

(assert (= (and b!254520 (not res!213265)) b!254518))

(declare-fun m!383335 () Bool)

(assert (=> b!254518 m!383335))

(declare-fun m!383337 () Bool)

(assert (=> b!254517 m!383337))

(declare-fun m!383339 () Bool)

(assert (=> b!254517 m!383339))

(declare-fun m!383341 () Bool)

(assert (=> b!254517 m!383341))

(declare-fun m!383343 () Bool)

(assert (=> b!254519 m!383343))

(declare-fun m!383345 () Bool)

(assert (=> b!254519 m!383345))

(declare-fun m!383347 () Bool)

(assert (=> b!254516 m!383347))

(assert (=> d!85532 m!383343))

(assert (=> d!85532 m!383345))

(assert (=> d!85140 d!85532))

(declare-fun d!85534 () Bool)

(assert (=> d!85534 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))))))))

(assert (=> d!85130 d!85534))

(declare-fun d!85536 () Bool)

(assert (=> d!85536 (= (invariant!0 (currentBit!11998 (_2!11814 lt!393981)) (currentByte!12003 (_2!11814 lt!393981)) (size!6031 (buf!6539 (_2!11814 lt!393981)))) (and (bvsge (currentBit!11998 (_2!11814 lt!393981)) #b00000000000000000000000000000000) (bvslt (currentBit!11998 (_2!11814 lt!393981)) #b00000000000000000000000000001000) (bvsge (currentByte!12003 (_2!11814 lt!393981)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 (_2!11814 lt!393981)) (size!6031 (buf!6539 (_2!11814 lt!393981)))) (and (= (currentBit!11998 (_2!11814 lt!393981)) #b00000000000000000000000000000000) (= (currentByte!12003 (_2!11814 lt!393981)) (size!6031 (buf!6539 (_2!11814 lt!393981))))))))))

(assert (=> d!85130 d!85536))

(assert (=> d!85146 d!85142))

(declare-fun d!85538 () Bool)

(assert (=> d!85538 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393986)))

(assert (=> d!85538 true))

(declare-fun _$6!442 () Unit!18237)

(assert (=> d!85538 (= (choose!9 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393986 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))) _$6!442)))

(declare-fun bs!21589 () Bool)

(assert (= bs!21589 d!85538))

(assert (=> bs!21589 m!381995))

(assert (=> d!85146 d!85538))

(declare-fun d!85540 () Bool)

(declare-fun e!176350 () Bool)

(assert (=> d!85540 e!176350))

(declare-fun res!213268 () Bool)

(assert (=> d!85540 (=> (not res!213268) (not e!176350))))

(declare-fun increaseBitIndex!0 (BitStream!10984) tuple2!21766)

(assert (=> d!85540 (= res!213268 (= (buf!6539 (_2!11814 (increaseBitIndex!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))))

(declare-fun lt!395293 () Bool)

(assert (=> d!85540 (= lt!395293 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))) (currentByte!12003 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395297 () tuple2!21782)

(assert (=> d!85540 (= lt!395297 (tuple2!21783 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))) (currentByte!12003 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11814 (increaseBitIndex!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))))))

(assert (=> d!85540 (validate_offset_bit!0 ((_ sign_extend 32) (size!6031 (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) ((_ sign_extend 32) (currentByte!12003 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))) ((_ sign_extend 32) (currentBit!11998 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))))

(assert (=> d!85540 (= (readBit!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))) lt!395297)))

(declare-fun lt!395295 () (_ BitVec 64))

(declare-fun b!254527 () Bool)

(declare-fun lt!395299 () (_ BitVec 64))

(assert (=> b!254527 (= e!176350 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 (increaseBitIndex!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))) (currentByte!12003 (_2!11814 (increaseBitIndex!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) (currentBit!11998 (_2!11814 (increaseBitIndex!0 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))) (bvadd lt!395295 lt!395299)))))

(assert (=> b!254527 (or (not (= (bvand lt!395295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395299 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395295 lt!395299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254527 (= lt!395299 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254527 (= lt!395295 (bitIndex!0 (size!6031 (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))) (currentByte!12003 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))) (currentBit!11998 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))))

(declare-fun lt!395298 () Bool)

(assert (=> b!254527 (= lt!395298 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))) (currentByte!12003 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395296 () Bool)

(assert (=> b!254527 (= lt!395296 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))) (currentByte!12003 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395294 () Bool)

(assert (=> b!254527 (= lt!395294 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))) (currentByte!12003 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (readerFrom!0 (_2!11814 lt!393981) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85540 res!213268) b!254527))

(assert (=> d!85540 m!381985))

(declare-fun m!383349 () Bool)

(assert (=> d!85540 m!383349))

(declare-fun m!383351 () Bool)

(assert (=> d!85540 m!383351))

(declare-fun m!383353 () Bool)

(assert (=> d!85540 m!383353))

(declare-fun m!383355 () Bool)

(assert (=> d!85540 m!383355))

(assert (=> b!254527 m!383351))

(assert (=> b!254527 m!383353))

(declare-fun m!383357 () Bool)

(assert (=> b!254527 m!383357))

(declare-fun m!383359 () Bool)

(assert (=> b!254527 m!383359))

(assert (=> b!254527 m!381985))

(assert (=> b!254527 m!383349))

(assert (=> d!85050 d!85540))

(declare-fun e!176364 () Bool)

(declare-datatypes ((tuple4!306 0))(
  ( (tuple4!307 (_1!11826 (_ BitVec 32)) (_2!11826 (_ BitVec 32)) (_3!933 (_ BitVec 32)) (_4!153 (_ BitVec 32))) )
))
(declare-fun lt!395308 () tuple4!306)

(declare-fun b!254542 () Bool)

(declare-fun arrayRangesEq!930 (array!13747 array!13747 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254542 (= e!176364 (arrayRangesEq!930 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393993)) (_1!11826 lt!395308) (_2!11826 lt!395308)))))

(declare-fun d!85542 () Bool)

(declare-fun res!213283 () Bool)

(declare-fun e!176365 () Bool)

(assert (=> d!85542 (=> res!213283 e!176365)))

(assert (=> d!85542 (= res!213283 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (=> d!85542 (= (arrayBitRangesEq!0 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))) e!176365)))

(declare-fun b!254543 () Bool)

(declare-fun e!176367 () Bool)

(declare-fun e!176363 () Bool)

(assert (=> b!254543 (= e!176367 e!176363)))

(declare-fun c!11749 () Bool)

(assert (=> b!254543 (= c!11749 (= (_3!933 lt!395308) (_4!153 lt!395308)))))

(declare-fun b!254544 () Bool)

(declare-fun call!4004 () Bool)

(assert (=> b!254544 (= e!176363 call!4004)))

(declare-fun lt!395306 () (_ BitVec 32))

(declare-fun bm!4001 () Bool)

(declare-fun lt!395307 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4001 (= call!4004 (byteRangesEq!0 (select (arr!7018 (buf!6539 thiss!1005)) (_3!933 lt!395308)) (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_3!933 lt!395308)) lt!395306 (ite c!11749 lt!395307 #b00000000000000000000000000001000)))))

(declare-fun b!254545 () Bool)

(declare-fun e!176368 () Bool)

(assert (=> b!254545 (= e!176368 (byteRangesEq!0 (select (arr!7018 (buf!6539 thiss!1005)) (_4!153 lt!395308)) (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_4!153 lt!395308)) #b00000000000000000000000000000000 lt!395307))))

(declare-fun b!254546 () Bool)

(assert (=> b!254546 (= e!176365 e!176367)))

(declare-fun res!213282 () Bool)

(assert (=> b!254546 (=> (not res!213282) (not e!176367))))

(assert (=> b!254546 (= res!213282 e!176364)))

(declare-fun res!213279 () Bool)

(assert (=> b!254546 (=> res!213279 e!176364)))

(assert (=> b!254546 (= res!213279 (bvsge (_1!11826 lt!395308) (_2!11826 lt!395308)))))

(assert (=> b!254546 (= lt!395307 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254546 (= lt!395306 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!306)

(assert (=> b!254546 (= lt!395308 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(declare-fun b!254547 () Bool)

(declare-fun e!176366 () Bool)

(assert (=> b!254547 (= e!176363 e!176366)))

(declare-fun res!213280 () Bool)

(assert (=> b!254547 (= res!213280 call!4004)))

(assert (=> b!254547 (=> (not res!213280) (not e!176366))))

(declare-fun b!254548 () Bool)

(declare-fun res!213281 () Bool)

(assert (=> b!254548 (= res!213281 (= lt!395307 #b00000000000000000000000000000000))))

(assert (=> b!254548 (=> res!213281 e!176368)))

(assert (=> b!254548 (= e!176366 e!176368)))

(assert (= (and d!85542 (not res!213283)) b!254546))

(assert (= (and b!254546 (not res!213279)) b!254542))

(assert (= (and b!254546 res!213282) b!254543))

(assert (= (and b!254543 c!11749) b!254544))

(assert (= (and b!254543 (not c!11749)) b!254547))

(assert (= (and b!254547 res!213280) b!254548))

(assert (= (and b!254548 (not res!213281)) b!254545))

(assert (= (or b!254544 b!254547) bm!4001))

(declare-fun m!383361 () Bool)

(assert (=> b!254542 m!383361))

(declare-fun m!383363 () Bool)

(assert (=> bm!4001 m!383363))

(declare-fun m!383365 () Bool)

(assert (=> bm!4001 m!383365))

(assert (=> bm!4001 m!383363))

(assert (=> bm!4001 m!383365))

(declare-fun m!383367 () Bool)

(assert (=> bm!4001 m!383367))

(declare-fun m!383369 () Bool)

(assert (=> b!254545 m!383369))

(declare-fun m!383371 () Bool)

(assert (=> b!254545 m!383371))

(assert (=> b!254545 m!383369))

(assert (=> b!254545 m!383371))

(declare-fun m!383373 () Bool)

(assert (=> b!254545 m!383373))

(assert (=> b!254546 m!382001))

(declare-fun m!383375 () Bool)

(assert (=> b!254546 m!383375))

(assert (=> b!253946 d!85542))

(assert (=> b!253946 d!85134))

(declare-fun d!85544 () Bool)

(assert (=> d!85544 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!394587) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) lt!394587))))

(declare-fun bs!21590 () Bool)

(assert (= bs!21590 d!85544))

(assert (=> bs!21590 m!382559))

(assert (=> b!254019 d!85544))

(assert (=> d!85064 d!85076))

(declare-fun d!85546 () Bool)

(assert (=> d!85546 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005)) (bvsub nBits!297 from!289))))

(assert (=> d!85546 true))

(declare-fun _$6!443 () Unit!18237)

(assert (=> d!85546 (= (choose!9 thiss!1005 (buf!6539 (_2!11814 lt!393993)) (bvsub nBits!297 from!289) (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))) _$6!443)))

(declare-fun bs!21591 () Bool)

(assert (= bs!21591 d!85546))

(assert (=> bs!21591 m!381965))

(assert (=> d!85064 d!85546))

(declare-fun d!85548 () Bool)

(declare-fun res!213285 () Bool)

(declare-fun e!176369 () Bool)

(assert (=> d!85548 (=> (not res!213285) (not e!176369))))

(assert (=> d!85548 (= res!213285 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) (size!6031 (buf!6539 (_2!11814 lt!394589)))))))

(assert (=> d!85548 (= (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!394589)) e!176369)))

(declare-fun b!254549 () Bool)

(declare-fun res!213284 () Bool)

(assert (=> b!254549 (=> (not res!213284) (not e!176369))))

(assert (=> b!254549 (= res!213284 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394589))) (currentByte!12003 (_2!11814 lt!394589)) (currentBit!11998 (_2!11814 lt!394589)))))))

(declare-fun b!254550 () Bool)

(declare-fun e!176370 () Bool)

(assert (=> b!254550 (= e!176369 e!176370)))

(declare-fun res!213286 () Bool)

(assert (=> b!254550 (=> res!213286 e!176370)))

(assert (=> b!254550 (= res!213286 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) #b00000000000000000000000000000000))))

(declare-fun b!254551 () Bool)

(assert (=> b!254551 (= e!176370 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!394589)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (= (and d!85548 res!213285) b!254549))

(assert (= (and b!254549 res!213284) b!254550))

(assert (= (and b!254550 (not res!213286)) b!254551))

(assert (=> b!254549 m!381999))

(assert (=> b!254549 m!382501))

(assert (=> b!254551 m!381999))

(assert (=> b!254551 m!381999))

(declare-fun m!383377 () Bool)

(assert (=> b!254551 m!383377))

(assert (=> b!254017 d!85548))

(assert (=> b!253944 d!85134))

(assert (=> b!253944 d!85128))

(declare-fun d!85550 () Bool)

(assert (=> d!85550 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393993))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393993)))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393993))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393993))))))))

(assert (=> d!85128 d!85550))

(declare-fun d!85552 () Bool)

(assert (=> d!85552 (= (invariant!0 (currentBit!11998 (_2!11814 lt!393993)) (currentByte!12003 (_2!11814 lt!393993)) (size!6031 (buf!6539 (_2!11814 lt!393993)))) (and (bvsge (currentBit!11998 (_2!11814 lt!393993)) #b00000000000000000000000000000000) (bvslt (currentBit!11998 (_2!11814 lt!393993)) #b00000000000000000000000000001000) (bvsge (currentByte!12003 (_2!11814 lt!393993)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 (_2!11814 lt!393993)) (size!6031 (buf!6539 (_2!11814 lt!393993)))) (and (= (currentBit!11998 (_2!11814 lt!393993)) #b00000000000000000000000000000000) (= (currentByte!12003 (_2!11814 lt!393993)) (size!6031 (buf!6539 (_2!11814 lt!393993))))))))))

(assert (=> d!85128 d!85552))

(assert (=> b!253938 d!85130))

(declare-fun d!85554 () Bool)

(assert (=> d!85554 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393993)) (buf!6539 (_2!11814 lt!393981)) lt!394405 lt!394419)))

(declare-fun lt!395311 () Unit!18237)

(declare-fun choose!8 (array!13747 array!13747 (_ BitVec 64) (_ BitVec 64)) Unit!18237)

(assert (=> d!85554 (= lt!395311 (choose!8 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!393993)) lt!394405 lt!394419))))

(assert (=> d!85554 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394405) (bvsle lt!394405 lt!394419))))

(assert (=> d!85554 (= (arrayBitRangesEqSymmetric!0 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!393993)) lt!394405 lt!394419) lt!395311)))

(declare-fun bs!21592 () Bool)

(assert (= bs!21592 d!85554))

(assert (=> bs!21592 m!382357))

(declare-fun m!383379 () Bool)

(assert (=> bs!21592 m!383379))

(assert (=> b!253938 d!85554))

(declare-fun e!176372 () Bool)

(declare-fun lt!395314 () tuple4!306)

(declare-fun b!254552 () Bool)

(assert (=> b!254552 (= e!176372 (arrayRangesEq!930 (buf!6539 (_2!11814 lt!393993)) (buf!6539 (_2!11814 lt!393981)) (_1!11826 lt!395314) (_2!11826 lt!395314)))))

(declare-fun d!85556 () Bool)

(declare-fun res!213291 () Bool)

(declare-fun e!176373 () Bool)

(assert (=> d!85556 (=> res!213291 e!176373)))

(assert (=> d!85556 (= res!213291 (bvsge lt!394405 lt!394419))))

(assert (=> d!85556 (= (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393993)) (buf!6539 (_2!11814 lt!393981)) lt!394405 lt!394419) e!176373)))

(declare-fun b!254553 () Bool)

(declare-fun e!176375 () Bool)

(declare-fun e!176371 () Bool)

(assert (=> b!254553 (= e!176375 e!176371)))

(declare-fun c!11750 () Bool)

(assert (=> b!254553 (= c!11750 (= (_3!933 lt!395314) (_4!153 lt!395314)))))

(declare-fun b!254554 () Bool)

(declare-fun call!4005 () Bool)

(assert (=> b!254554 (= e!176371 call!4005)))

(declare-fun lt!395312 () (_ BitVec 32))

(declare-fun bm!4002 () Bool)

(declare-fun lt!395313 () (_ BitVec 32))

(assert (=> bm!4002 (= call!4005 (byteRangesEq!0 (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_3!933 lt!395314)) (select (arr!7018 (buf!6539 (_2!11814 lt!393981))) (_3!933 lt!395314)) lt!395312 (ite c!11750 lt!395313 #b00000000000000000000000000001000)))))

(declare-fun e!176376 () Bool)

(declare-fun b!254555 () Bool)

(assert (=> b!254555 (= e!176376 (byteRangesEq!0 (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_4!153 lt!395314)) (select (arr!7018 (buf!6539 (_2!11814 lt!393981))) (_4!153 lt!395314)) #b00000000000000000000000000000000 lt!395313))))

(declare-fun b!254556 () Bool)

(assert (=> b!254556 (= e!176373 e!176375)))

(declare-fun res!213290 () Bool)

(assert (=> b!254556 (=> (not res!213290) (not e!176375))))

(assert (=> b!254556 (= res!213290 e!176372)))

(declare-fun res!213287 () Bool)

(assert (=> b!254556 (=> res!213287 e!176372)))

(assert (=> b!254556 (= res!213287 (bvsge (_1!11826 lt!395314) (_2!11826 lt!395314)))))

(assert (=> b!254556 (= lt!395313 ((_ extract 31 0) (bvsrem lt!394419 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254556 (= lt!395312 ((_ extract 31 0) (bvsrem lt!394405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254556 (= lt!395314 (arrayBitIndices!0 lt!394405 lt!394419))))

(declare-fun b!254557 () Bool)

(declare-fun e!176374 () Bool)

(assert (=> b!254557 (= e!176371 e!176374)))

(declare-fun res!213288 () Bool)

(assert (=> b!254557 (= res!213288 call!4005)))

(assert (=> b!254557 (=> (not res!213288) (not e!176374))))

(declare-fun b!254558 () Bool)

(declare-fun res!213289 () Bool)

(assert (=> b!254558 (= res!213289 (= lt!395313 #b00000000000000000000000000000000))))

(assert (=> b!254558 (=> res!213289 e!176376)))

(assert (=> b!254558 (= e!176374 e!176376)))

(assert (= (and d!85556 (not res!213291)) b!254556))

(assert (= (and b!254556 (not res!213287)) b!254552))

(assert (= (and b!254556 res!213290) b!254553))

(assert (= (and b!254553 c!11750) b!254554))

(assert (= (and b!254553 (not c!11750)) b!254557))

(assert (= (and b!254557 res!213288) b!254558))

(assert (= (and b!254558 (not res!213289)) b!254555))

(assert (= (or b!254554 b!254557) bm!4002))

(declare-fun m!383381 () Bool)

(assert (=> b!254552 m!383381))

(declare-fun m!383383 () Bool)

(assert (=> bm!4002 m!383383))

(declare-fun m!383385 () Bool)

(assert (=> bm!4002 m!383385))

(assert (=> bm!4002 m!383383))

(assert (=> bm!4002 m!383385))

(declare-fun m!383387 () Bool)

(assert (=> bm!4002 m!383387))

(declare-fun m!383389 () Bool)

(assert (=> b!254555 m!383389))

(declare-fun m!383391 () Bool)

(assert (=> b!254555 m!383391))

(assert (=> b!254555 m!383389))

(assert (=> b!254555 m!383391))

(declare-fun m!383393 () Bool)

(assert (=> b!254555 m!383393))

(declare-fun m!383395 () Bool)

(assert (=> b!254556 m!383395))

(assert (=> b!253938 d!85556))

(declare-fun d!85558 () Bool)

(assert (=> d!85558 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!85558 true))

(declare-fun _$1!342 () Unit!18237)

(assert (=> d!85558 (= (choose!27 thiss!1005 (_2!11814 lt!393981) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!342)))

(declare-fun bs!21593 () Bool)

(assert (= bs!21593 d!85558))

(assert (=> bs!21593 m!382555))

(assert (=> d!85116 d!85558))

(assert (=> b!253943 d!85134))

(declare-fun d!85560 () Bool)

(assert (=> d!85560 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393993)) (buf!6539 thiss!1005) lt!394425 lt!394439)))

(declare-fun lt!395315 () Unit!18237)

(assert (=> d!85560 (= lt!395315 (choose!8 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393993)) lt!394425 lt!394439))))

(assert (=> d!85560 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!394425) (bvsle lt!394425 lt!394439))))

(assert (=> d!85560 (= (arrayBitRangesEqSymmetric!0 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393993)) lt!394425 lt!394439) lt!395315)))

(declare-fun bs!21594 () Bool)

(assert (= bs!21594 d!85560))

(assert (=> bs!21594 m!382387))

(declare-fun m!383397 () Bool)

(assert (=> bs!21594 m!383397))

(assert (=> b!253943 d!85560))

(declare-fun b!254559 () Bool)

(declare-fun e!176378 () Bool)

(declare-fun lt!395318 () tuple4!306)

(assert (=> b!254559 (= e!176378 (arrayRangesEq!930 (buf!6539 (_2!11814 lt!393993)) (buf!6539 thiss!1005) (_1!11826 lt!395318) (_2!11826 lt!395318)))))

(declare-fun d!85562 () Bool)

(declare-fun res!213296 () Bool)

(declare-fun e!176379 () Bool)

(assert (=> d!85562 (=> res!213296 e!176379)))

(assert (=> d!85562 (= res!213296 (bvsge lt!394425 lt!394439))))

(assert (=> d!85562 (= (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393993)) (buf!6539 thiss!1005) lt!394425 lt!394439) e!176379)))

(declare-fun b!254560 () Bool)

(declare-fun e!176381 () Bool)

(declare-fun e!176377 () Bool)

(assert (=> b!254560 (= e!176381 e!176377)))

(declare-fun c!11751 () Bool)

(assert (=> b!254560 (= c!11751 (= (_3!933 lt!395318) (_4!153 lt!395318)))))

(declare-fun b!254561 () Bool)

(declare-fun call!4006 () Bool)

(assert (=> b!254561 (= e!176377 call!4006)))

(declare-fun lt!395317 () (_ BitVec 32))

(declare-fun lt!395316 () (_ BitVec 32))

(declare-fun bm!4003 () Bool)

(assert (=> bm!4003 (= call!4006 (byteRangesEq!0 (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_3!933 lt!395318)) (select (arr!7018 (buf!6539 thiss!1005)) (_3!933 lt!395318)) lt!395316 (ite c!11751 lt!395317 #b00000000000000000000000000001000)))))

(declare-fun e!176382 () Bool)

(declare-fun b!254562 () Bool)

(assert (=> b!254562 (= e!176382 (byteRangesEq!0 (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_4!153 lt!395318)) (select (arr!7018 (buf!6539 thiss!1005)) (_4!153 lt!395318)) #b00000000000000000000000000000000 lt!395317))))

(declare-fun b!254563 () Bool)

(assert (=> b!254563 (= e!176379 e!176381)))

(declare-fun res!213295 () Bool)

(assert (=> b!254563 (=> (not res!213295) (not e!176381))))

(assert (=> b!254563 (= res!213295 e!176378)))

(declare-fun res!213292 () Bool)

(assert (=> b!254563 (=> res!213292 e!176378)))

(assert (=> b!254563 (= res!213292 (bvsge (_1!11826 lt!395318) (_2!11826 lt!395318)))))

(assert (=> b!254563 (= lt!395317 ((_ extract 31 0) (bvsrem lt!394439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254563 (= lt!395316 ((_ extract 31 0) (bvsrem lt!394425 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254563 (= lt!395318 (arrayBitIndices!0 lt!394425 lt!394439))))

(declare-fun b!254564 () Bool)

(declare-fun e!176380 () Bool)

(assert (=> b!254564 (= e!176377 e!176380)))

(declare-fun res!213293 () Bool)

(assert (=> b!254564 (= res!213293 call!4006)))

(assert (=> b!254564 (=> (not res!213293) (not e!176380))))

(declare-fun b!254565 () Bool)

(declare-fun res!213294 () Bool)

(assert (=> b!254565 (= res!213294 (= lt!395317 #b00000000000000000000000000000000))))

(assert (=> b!254565 (=> res!213294 e!176382)))

(assert (=> b!254565 (= e!176380 e!176382)))

(assert (= (and d!85562 (not res!213296)) b!254563))

(assert (= (and b!254563 (not res!213292)) b!254559))

(assert (= (and b!254563 res!213295) b!254560))

(assert (= (and b!254560 c!11751) b!254561))

(assert (= (and b!254560 (not c!11751)) b!254564))

(assert (= (and b!254564 res!213293) b!254565))

(assert (= (and b!254565 (not res!213294)) b!254562))

(assert (= (or b!254561 b!254564) bm!4003))

(declare-fun m!383399 () Bool)

(assert (=> b!254559 m!383399))

(declare-fun m!383401 () Bool)

(assert (=> bm!4003 m!383401))

(declare-fun m!383403 () Bool)

(assert (=> bm!4003 m!383403))

(assert (=> bm!4003 m!383401))

(assert (=> bm!4003 m!383403))

(declare-fun m!383405 () Bool)

(assert (=> bm!4003 m!383405))

(declare-fun m!383407 () Bool)

(assert (=> b!254562 m!383407))

(declare-fun m!383409 () Bool)

(assert (=> b!254562 m!383409))

(assert (=> b!254562 m!383407))

(assert (=> b!254562 m!383409))

(declare-fun m!383411 () Bool)

(assert (=> b!254562 m!383411))

(declare-fun m!383413 () Bool)

(assert (=> b!254563 m!383413))

(assert (=> b!253943 d!85562))

(declare-fun b!254566 () Bool)

(declare-fun e!176387 () tuple2!21782)

(declare-fun e!176384 () tuple2!21782)

(assert (=> b!254566 (= e!176387 e!176384)))

(declare-fun lt!395324 () tuple2!21782)

(assert (=> b!254566 (= lt!395324 (readBit!0 (_1!11813 lt!393992)))))

(declare-fun c!11752 () Bool)

(assert (=> b!254566 (= c!11752 (not (= (_1!11822 lt!395324) bit!26)))))

(declare-fun b!254567 () Bool)

(declare-fun lt!395321 () tuple2!21782)

(assert (=> b!254567 (= lt!395321 (checkBitsLoop!0 (_2!11822 lt!395324) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!395323 () Unit!18237)

(declare-fun lt!395320 () Unit!18237)

(assert (=> b!254567 (= lt!395323 lt!395320)))

(declare-fun lt!395327 () (_ BitVec 64))

(declare-fun lt!395326 () (_ BitVec 64))

(assert (=> b!254567 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11822 lt!395324)))) ((_ sign_extend 32) (currentByte!12003 (_2!11822 lt!395324))) ((_ sign_extend 32) (currentBit!11998 (_2!11822 lt!395324))) (bvsub lt!395327 lt!395326))))

(assert (=> b!254567 (= lt!395320 (validateOffsetBitsIneqLemma!0 (_1!11813 lt!393992) (_2!11822 lt!395324) lt!395327 lt!395326))))

(assert (=> b!254567 (= lt!395326 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254567 (= lt!395327 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254567 (= e!176384 (tuple2!21783 (_1!11822 lt!395321) (_2!11822 lt!395321)))))

(declare-fun b!254568 () Bool)

(declare-fun e!176386 () Bool)

(assert (=> b!254568 (= e!176386 (= bit!26 (_2!11812 (readBitPure!0 (_1!11813 lt!393992)))))))

(declare-fun lt!395325 () tuple2!21782)

(declare-fun lt!395328 () (_ BitVec 64))

(declare-fun b!254569 () Bool)

(declare-fun e!176385 () Bool)

(assert (=> b!254569 (= e!176385 (= (bvsub lt!395328 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6031 (buf!6539 (_2!11822 lt!395325))) (currentByte!12003 (_2!11822 lt!395325)) (currentBit!11998 (_2!11822 lt!395325)))))))

(assert (=> b!254569 (or (= (bvand lt!395328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395328 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395329 () (_ BitVec 64))

(assert (=> b!254569 (= lt!395328 (bvadd lt!395329 nBits!297))))

(assert (=> b!254569 (or (not (= (bvand lt!395329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395329 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254569 (= lt!395329 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393992))) (currentByte!12003 (_1!11813 lt!393992)) (currentBit!11998 (_1!11813 lt!393992))))))

(declare-fun b!254571 () Bool)

(declare-fun res!213297 () Bool)

(declare-fun e!176383 () Bool)

(assert (=> b!254571 (=> (not res!213297) (not e!176383))))

(assert (=> b!254571 (= res!213297 e!176385)))

(declare-fun res!213298 () Bool)

(assert (=> b!254571 (=> res!213298 e!176385)))

(assert (=> b!254571 (= res!213298 (not (_1!11822 lt!395325)))))

(declare-fun b!254572 () Bool)

(assert (=> b!254572 (= e!176384 (tuple2!21783 false (_2!11822 lt!395324)))))

(declare-fun b!254573 () Bool)

(declare-fun res!213300 () Bool)

(assert (=> b!254573 (=> (not res!213300) (not e!176383))))

(assert (=> b!254573 (= res!213300 (and (= (buf!6539 (_1!11813 lt!393992)) (buf!6539 (_2!11822 lt!395325))) (or (not (= nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_1!11822 lt!395325))))))

(declare-fun b!254574 () Bool)

(assert (=> b!254574 (= e!176387 (tuple2!21783 true (_1!11813 lt!393992)))))

(declare-fun b!254570 () Bool)

(assert (=> b!254570 (= e!176383 e!176386)))

(declare-fun res!213301 () Bool)

(assert (=> b!254570 (=> res!213301 e!176386)))

(assert (=> b!254570 (= res!213301 (or (not (_1!11822 lt!395325)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297)))))

(declare-fun d!85564 () Bool)

(assert (=> d!85564 e!176383))

(declare-fun res!213299 () Bool)

(assert (=> d!85564 (=> (not res!213299) (not e!176383))))

(declare-fun lt!395319 () (_ BitVec 64))

(assert (=> d!85564 (= res!213299 (bvsge (bvsub lt!395319 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (bitIndex!0 (size!6031 (buf!6539 (_2!11822 lt!395325))) (currentByte!12003 (_2!11822 lt!395325)) (currentBit!11998 (_2!11822 lt!395325)))))))

(assert (=> d!85564 (or (= (bvand lt!395319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395319 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395322 () (_ BitVec 64))

(assert (=> d!85564 (= lt!395319 (bvadd lt!395322 nBits!297))))

(assert (=> d!85564 (or (not (= (bvand lt!395322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395322 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85564 (= lt!395322 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393992))) (currentByte!12003 (_1!11813 lt!393992)) (currentBit!11998 (_1!11813 lt!393992))))))

(assert (=> d!85564 (= lt!395325 e!176387)))

(declare-fun c!11753 () Bool)

(assert (=> d!85564 (= c!11753 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) nBits!297))))

(assert (=> d!85564 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85564 (= (checkBitsLoop!0 (_1!11813 lt!393992) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!395325)))

(assert (= (and d!85564 c!11753) b!254574))

(assert (= (and d!85564 (not c!11753)) b!254566))

(assert (= (and b!254566 c!11752) b!254572))

(assert (= (and b!254566 (not c!11752)) b!254567))

(assert (= (and d!85564 res!213299) b!254573))

(assert (= (and b!254573 res!213300) b!254571))

(assert (= (and b!254571 (not res!213298)) b!254569))

(assert (= (and b!254571 res!213297) b!254570))

(assert (= (and b!254570 (not res!213301)) b!254568))

(declare-fun m!383415 () Bool)

(assert (=> b!254568 m!383415))

(declare-fun m!383417 () Bool)

(assert (=> b!254567 m!383417))

(declare-fun m!383419 () Bool)

(assert (=> b!254567 m!383419))

(declare-fun m!383421 () Bool)

(assert (=> b!254567 m!383421))

(declare-fun m!383423 () Bool)

(assert (=> b!254569 m!383423))

(declare-fun m!383425 () Bool)

(assert (=> b!254569 m!383425))

(declare-fun m!383427 () Bool)

(assert (=> b!254566 m!383427))

(assert (=> d!85564 m!383423))

(assert (=> d!85564 m!383425))

(assert (=> d!85078 d!85564))

(declare-fun d!85566 () Bool)

(declare-fun res!213303 () Bool)

(declare-fun e!176388 () Bool)

(assert (=> d!85566 (=> (not res!213303) (not e!176388))))

(assert (=> d!85566 (= res!213303 (= (size!6031 (buf!6539 (_1!11813 lt!394417))) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(assert (=> d!85566 (= (isPrefixOf!0 (_1!11813 lt!394417) (_2!11814 lt!393981)) e!176388)))

(declare-fun b!254575 () Bool)

(declare-fun res!213302 () Bool)

(assert (=> b!254575 (=> (not res!213302) (not e!176388))))

(assert (=> b!254575 (= res!213302 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394417))) (currentByte!12003 (_1!11813 lt!394417)) (currentBit!11998 (_1!11813 lt!394417))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(declare-fun b!254576 () Bool)

(declare-fun e!176389 () Bool)

(assert (=> b!254576 (= e!176388 e!176389)))

(declare-fun res!213304 () Bool)

(assert (=> b!254576 (=> res!213304 e!176389)))

(assert (=> b!254576 (= res!213304 (= (size!6031 (buf!6539 (_1!11813 lt!394417))) #b00000000000000000000000000000000))))

(declare-fun b!254577 () Bool)

(assert (=> b!254577 (= e!176389 (arrayBitRangesEq!0 (buf!6539 (_1!11813 lt!394417)) (buf!6539 (_2!11814 lt!393981)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394417))) (currentByte!12003 (_1!11813 lt!394417)) (currentBit!11998 (_1!11813 lt!394417)))))))

(assert (= (and d!85566 res!213303) b!254575))

(assert (= (and b!254575 res!213302) b!254576))

(assert (= (and b!254576 (not res!213304)) b!254577))

(declare-fun m!383429 () Bool)

(assert (=> b!254575 m!383429))

(assert (=> b!254575 m!381999))

(assert (=> b!254577 m!383429))

(assert (=> b!254577 m!383429))

(declare-fun m!383431 () Bool)

(assert (=> b!254577 m!383431))

(assert (=> b!253936 d!85566))

(declare-fun d!85568 () Bool)

(declare-fun res!213306 () Bool)

(declare-fun e!176390 () Bool)

(assert (=> d!85568 (=> (not res!213306) (not e!176390))))

(assert (=> d!85568 (= res!213306 (= (size!6031 (buf!6539 (_1!11813 lt!394437))) (size!6031 (buf!6539 thiss!1005))))))

(assert (=> d!85568 (= (isPrefixOf!0 (_1!11813 lt!394437) thiss!1005) e!176390)))

(declare-fun b!254578 () Bool)

(declare-fun res!213305 () Bool)

(assert (=> b!254578 (=> (not res!213305) (not e!176390))))

(assert (=> b!254578 (= res!213305 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394437))) (currentByte!12003 (_1!11813 lt!394437)) (currentBit!11998 (_1!11813 lt!394437))) (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(declare-fun b!254579 () Bool)

(declare-fun e!176391 () Bool)

(assert (=> b!254579 (= e!176390 e!176391)))

(declare-fun res!213307 () Bool)

(assert (=> b!254579 (=> res!213307 e!176391)))

(assert (=> b!254579 (= res!213307 (= (size!6031 (buf!6539 (_1!11813 lt!394437))) #b00000000000000000000000000000000))))

(declare-fun b!254580 () Bool)

(assert (=> b!254580 (= e!176391 (arrayBitRangesEq!0 (buf!6539 (_1!11813 lt!394437)) (buf!6539 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394437))) (currentByte!12003 (_1!11813 lt!394437)) (currentBit!11998 (_1!11813 lt!394437)))))))

(assert (= (and d!85568 res!213306) b!254578))

(assert (= (and b!254578 res!213305) b!254579))

(assert (= (and b!254579 (not res!213307)) b!254580))

(declare-fun m!383433 () Bool)

(assert (=> b!254578 m!383433))

(assert (=> b!254578 m!382001))

(assert (=> b!254580 m!383433))

(assert (=> b!254580 m!383433))

(declare-fun m!383435 () Bool)

(assert (=> b!254580 m!383435))

(assert (=> b!253941 d!85568))

(assert (=> d!85060 d!85114))

(declare-fun d!85570 () Bool)

(assert (=> d!85570 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!393991)))

(assert (=> d!85570 true))

(declare-fun _$6!444 () Unit!18237)

(assert (=> d!85570 (= (choose!9 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!393993)) lt!393991 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))) _$6!444)))

(declare-fun bs!21595 () Bool)

(assert (= bs!21595 d!85570))

(assert (=> bs!21595 m!381967))

(assert (=> d!85060 d!85570))

(declare-fun d!85572 () Bool)

(declare-fun e!176392 () Bool)

(assert (=> d!85572 e!176392))

(declare-fun res!213308 () Bool)

(assert (=> d!85572 (=> (not res!213308) (not e!176392))))

(declare-fun lt!395335 () (_ BitVec 64))

(declare-fun lt!395332 () (_ BitVec 64))

(declare-fun lt!395333 () (_ BitVec 64))

(assert (=> d!85572 (= res!213308 (= lt!395335 (bvsub lt!395333 lt!395332)))))

(assert (=> d!85572 (or (= (bvand lt!395333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395333 lt!395332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85572 (= lt!395332 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394464)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!394464))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!394464)))))))

(declare-fun lt!395334 () (_ BitVec 64))

(declare-fun lt!395330 () (_ BitVec 64))

(assert (=> d!85572 (= lt!395333 (bvmul lt!395334 lt!395330))))

(assert (=> d!85572 (or (= lt!395334 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395330 (bvsdiv (bvmul lt!395334 lt!395330) lt!395334)))))

(assert (=> d!85572 (= lt!395330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85572 (= lt!395334 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394464)))))))

(assert (=> d!85572 (= lt!395335 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!394464))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!394464)))))))

(assert (=> d!85572 (invariant!0 (currentBit!11998 (_1!11812 lt!394464)) (currentByte!12003 (_1!11812 lt!394464)) (size!6031 (buf!6539 (_1!11812 lt!394464))))))

(assert (=> d!85572 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!394464))) (currentByte!12003 (_1!11812 lt!394464)) (currentBit!11998 (_1!11812 lt!394464))) lt!395335)))

(declare-fun b!254581 () Bool)

(declare-fun res!213309 () Bool)

(assert (=> b!254581 (=> (not res!213309) (not e!176392))))

(assert (=> b!254581 (= res!213309 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395335))))

(declare-fun b!254582 () Bool)

(declare-fun lt!395331 () (_ BitVec 64))

(assert (=> b!254582 (= e!176392 (bvsle lt!395335 (bvmul lt!395331 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254582 (or (= lt!395331 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395331 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395331)))))

(assert (=> b!254582 (= lt!395331 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394464)))))))

(assert (= (and d!85572 res!213308) b!254581))

(assert (= (and b!254581 res!213309) b!254582))

(declare-fun m!383437 () Bool)

(assert (=> d!85572 m!383437))

(declare-fun m!383439 () Bool)

(assert (=> d!85572 m!383439))

(assert (=> b!253971 d!85572))

(declare-fun d!85574 () Bool)

(declare-fun e!176393 () Bool)

(assert (=> d!85574 e!176393))

(declare-fun res!213310 () Bool)

(assert (=> d!85574 (=> (not res!213310) (not e!176393))))

(declare-fun lt!395339 () (_ BitVec 64))

(declare-fun lt!395338 () (_ BitVec 64))

(declare-fun lt!395341 () (_ BitVec 64))

(assert (=> d!85574 (= res!213310 (= lt!395341 (bvsub lt!395339 lt!395338)))))

(assert (=> d!85574 (or (= (bvand lt!395339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395339 lt!395338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85574 (= lt!395338 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394463)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!394463))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!394463)))))))

(declare-fun lt!395340 () (_ BitVec 64))

(declare-fun lt!395336 () (_ BitVec 64))

(assert (=> d!85574 (= lt!395339 (bvmul lt!395340 lt!395336))))

(assert (=> d!85574 (or (= lt!395340 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395336 (bvsdiv (bvmul lt!395340 lt!395336) lt!395340)))))

(assert (=> d!85574 (= lt!395336 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85574 (= lt!395340 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394463)))))))

(assert (=> d!85574 (= lt!395341 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!394463))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!394463)))))))

(assert (=> d!85574 (invariant!0 (currentBit!11998 (_2!11814 lt!394463)) (currentByte!12003 (_2!11814 lt!394463)) (size!6031 (buf!6539 (_2!11814 lt!394463))))))

(assert (=> d!85574 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394463))) (currentByte!12003 (_2!11814 lt!394463)) (currentBit!11998 (_2!11814 lt!394463))) lt!395341)))

(declare-fun b!254583 () Bool)

(declare-fun res!213311 () Bool)

(assert (=> b!254583 (=> (not res!213311) (not e!176393))))

(assert (=> b!254583 (= res!213311 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395341))))

(declare-fun b!254584 () Bool)

(declare-fun lt!395337 () (_ BitVec 64))

(assert (=> b!254584 (= e!176393 (bvsle lt!395341 (bvmul lt!395337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254584 (or (= lt!395337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395337)))))

(assert (=> b!254584 (= lt!395337 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394463)))))))

(assert (= (and d!85574 res!213310) b!254583))

(assert (= (and b!254583 res!213311) b!254584))

(declare-fun m!383441 () Bool)

(assert (=> d!85574 m!383441))

(declare-fun m!383443 () Bool)

(assert (=> d!85574 m!383443))

(assert (=> b!253971 d!85574))

(declare-fun d!85576 () Bool)

(declare-fun res!213313 () Bool)

(declare-fun e!176394 () Bool)

(assert (=> d!85576 (=> (not res!213313) (not e!176394))))

(assert (=> d!85576 (= res!213313 (= (size!6031 (buf!6539 thiss!1005)) (size!6031 (buf!6539 (_2!11814 lt!394463)))))))

(assert (=> d!85576 (= (isPrefixOf!0 thiss!1005 (_2!11814 lt!394463)) e!176394)))

(declare-fun b!254585 () Bool)

(declare-fun res!213312 () Bool)

(assert (=> b!254585 (=> (not res!213312) (not e!176394))))

(assert (=> b!254585 (= res!213312 (bvsle (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394463))) (currentByte!12003 (_2!11814 lt!394463)) (currentBit!11998 (_2!11814 lt!394463)))))))

(declare-fun b!254586 () Bool)

(declare-fun e!176395 () Bool)

(assert (=> b!254586 (= e!176394 e!176395)))

(declare-fun res!213314 () Bool)

(assert (=> b!254586 (=> res!213314 e!176395)))

(assert (=> b!254586 (= res!213314 (= (size!6031 (buf!6539 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254587 () Bool)

(assert (=> b!254587 (= e!176395 (arrayBitRangesEq!0 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!394463)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (= (and d!85576 res!213313) b!254585))

(assert (= (and b!254585 res!213312) b!254586))

(assert (= (and b!254586 (not res!213314)) b!254587))

(assert (=> b!254585 m!382001))

(assert (=> b!254585 m!382431))

(assert (=> b!254587 m!382001))

(assert (=> b!254587 m!382001))

(declare-fun m!383445 () Bool)

(assert (=> b!254587 m!383445))

(assert (=> b!253969 d!85576))

(assert (=> d!85052 d!85536))

(declare-fun d!85578 () Bool)

(declare-fun e!176396 () Bool)

(assert (=> d!85578 e!176396))

(declare-fun res!213315 () Bool)

(assert (=> d!85578 (=> (not res!213315) (not e!176396))))

(declare-fun lt!395345 () (_ BitVec 64))

(declare-fun lt!395344 () (_ BitVec 64))

(declare-fun lt!395347 () (_ BitVec 64))

(assert (=> d!85578 (= res!213315 (= lt!395347 (bvsub lt!395345 lt!395344)))))

(assert (=> d!85578 (or (= (bvand lt!395345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395345 lt!395344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85578 (= lt!395344 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 lt!394343))) ((_ sign_extend 32) (currentByte!12003 lt!394343)) ((_ sign_extend 32) (currentBit!11998 lt!394343))))))

(declare-fun lt!395346 () (_ BitVec 64))

(declare-fun lt!395342 () (_ BitVec 64))

(assert (=> d!85578 (= lt!395345 (bvmul lt!395346 lt!395342))))

(assert (=> d!85578 (or (= lt!395346 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395342 (bvsdiv (bvmul lt!395346 lt!395342) lt!395346)))))

(assert (=> d!85578 (= lt!395342 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85578 (= lt!395346 ((_ sign_extend 32) (size!6031 (buf!6539 lt!394343))))))

(assert (=> d!85578 (= lt!395347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 lt!394343)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 lt!394343))))))

(assert (=> d!85578 (invariant!0 (currentBit!11998 lt!394343) (currentByte!12003 lt!394343) (size!6031 (buf!6539 lt!394343)))))

(assert (=> d!85578 (= (bitIndex!0 (size!6031 (buf!6539 lt!394343)) (currentByte!12003 lt!394343) (currentBit!11998 lt!394343)) lt!395347)))

(declare-fun b!254588 () Bool)

(declare-fun res!213316 () Bool)

(assert (=> b!254588 (=> (not res!213316) (not e!176396))))

(assert (=> b!254588 (= res!213316 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395347))))

(declare-fun b!254589 () Bool)

(declare-fun lt!395343 () (_ BitVec 64))

(assert (=> b!254589 (= e!176396 (bvsle lt!395347 (bvmul lt!395343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254589 (or (= lt!395343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395343)))))

(assert (=> b!254589 (= lt!395343 ((_ sign_extend 32) (size!6031 (buf!6539 lt!394343))))))

(assert (= (and d!85578 res!213315) b!254588))

(assert (= (and b!254588 res!213316) b!254589))

(declare-fun m!383447 () Bool)

(assert (=> d!85578 m!383447))

(declare-fun m!383449 () Bool)

(assert (=> d!85578 m!383449))

(assert (=> d!85054 d!85578))

(declare-fun d!85580 () Bool)

(declare-fun e!176397 () Bool)

(assert (=> d!85580 e!176397))

(declare-fun res!213317 () Bool)

(assert (=> d!85580 (=> (not res!213317) (not e!176397))))

(declare-fun lt!395351 () (_ BitVec 64))

(declare-fun lt!395350 () (_ BitVec 64))

(declare-fun lt!395353 () (_ BitVec 64))

(assert (=> d!85580 (= res!213317 (= lt!395353 (bvsub lt!395351 lt!395350)))))

(assert (=> d!85580 (or (= (bvand lt!395351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395351 lt!395350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85580 (= lt!395350 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11813 lt!393990)))) ((_ sign_extend 32) (currentByte!12003 (_1!11813 lt!393990))) ((_ sign_extend 32) (currentBit!11998 (_1!11813 lt!393990)))))))

(declare-fun lt!395352 () (_ BitVec 64))

(declare-fun lt!395348 () (_ BitVec 64))

(assert (=> d!85580 (= lt!395351 (bvmul lt!395352 lt!395348))))

(assert (=> d!85580 (or (= lt!395352 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395348 (bvsdiv (bvmul lt!395352 lt!395348) lt!395352)))))

(assert (=> d!85580 (= lt!395348 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85580 (= lt!395352 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11813 lt!393990)))))))

(assert (=> d!85580 (= lt!395353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11813 lt!393990))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11813 lt!393990)))))))

(assert (=> d!85580 (invariant!0 (currentBit!11998 (_1!11813 lt!393990)) (currentByte!12003 (_1!11813 lt!393990)) (size!6031 (buf!6539 (_1!11813 lt!393990))))))

(assert (=> d!85580 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)) (currentBit!11998 (_1!11813 lt!393990))) lt!395353)))

(declare-fun b!254590 () Bool)

(declare-fun res!213318 () Bool)

(assert (=> b!254590 (=> (not res!213318) (not e!176397))))

(assert (=> b!254590 (= res!213318 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395353))))

(declare-fun b!254591 () Bool)

(declare-fun lt!395349 () (_ BitVec 64))

(assert (=> b!254591 (= e!176397 (bvsle lt!395353 (bvmul lt!395349 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254591 (or (= lt!395349 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395349 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395349)))))

(assert (=> b!254591 (= lt!395349 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11813 lt!393990)))))))

(assert (= (and d!85580 res!213317) b!254590))

(assert (= (and b!254590 res!213318) b!254591))

(declare-fun m!383451 () Bool)

(assert (=> d!85580 m!383451))

(declare-fun m!383453 () Bool)

(assert (=> d!85580 m!383453))

(assert (=> d!85054 d!85580))

(declare-fun d!85582 () Bool)

(declare-fun lt!395371 () (_ BitVec 32))

(assert (=> d!85582 (= lt!395371 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!395366 () (_ BitVec 32))

(assert (=> d!85582 (= lt!395366 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!176402 () Bool)

(assert (=> d!85582 e!176402))

(declare-fun res!213323 () Bool)

(assert (=> d!85582 (=> (not res!213323) (not e!176402))))

(assert (=> d!85582 (= res!213323 (moveBitIndexPrecond!0 (_1!11813 lt!393990) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!18263 () Unit!18237)

(declare-fun Unit!18264 () Unit!18237)

(declare-fun Unit!18265 () Unit!18237)

(assert (=> d!85582 (= (moveBitIndex!0 (_1!11813 lt!393990) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395371) #b00000000000000000000000000000000) (tuple2!21767 Unit!18263 (BitStream!10985 (buf!6539 (_1!11813 lt!393990)) (bvsub (bvadd (currentByte!12003 (_1!11813 lt!393990)) lt!395366) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!395371 (currentBit!11998 (_1!11813 lt!393990))))) (ite (bvsge (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395371) #b00000000000000000000000000001000) (tuple2!21767 Unit!18264 (BitStream!10985 (buf!6539 (_1!11813 lt!393990)) (bvadd (currentByte!12003 (_1!11813 lt!393990)) lt!395366 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395371) #b00000000000000000000000000001000))) (tuple2!21767 Unit!18265 (BitStream!10985 (buf!6539 (_1!11813 lt!393990)) (bvadd (currentByte!12003 (_1!11813 lt!393990)) lt!395366) (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395371))))))))

(declare-fun b!254596 () Bool)

(declare-fun e!176403 () Bool)

(assert (=> b!254596 (= e!176402 e!176403)))

(declare-fun res!213324 () Bool)

(assert (=> b!254596 (=> (not res!213324) (not e!176403))))

(declare-fun lt!395369 () (_ BitVec 64))

(declare-fun lt!395367 () tuple2!21766)

(assert (=> b!254596 (= res!213324 (= (bvadd lt!395369 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!395367))) (currentByte!12003 (_2!11814 lt!395367)) (currentBit!11998 (_2!11814 lt!395367)))))))

(assert (=> b!254596 (or (not (= (bvand lt!395369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395369 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254596 (= lt!395369 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)) (currentBit!11998 (_1!11813 lt!393990))))))

(declare-fun lt!395370 () (_ BitVec 32))

(declare-fun lt!395368 () (_ BitVec 32))

(declare-fun Unit!18266 () Unit!18237)

(declare-fun Unit!18267 () Unit!18237)

(declare-fun Unit!18268 () Unit!18237)

(assert (=> b!254596 (= lt!395367 (ite (bvslt (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395370) #b00000000000000000000000000000000) (tuple2!21767 Unit!18266 (BitStream!10985 (buf!6539 (_1!11813 lt!393990)) (bvsub (bvadd (currentByte!12003 (_1!11813 lt!393990)) lt!395368) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!395370 (currentBit!11998 (_1!11813 lt!393990))))) (ite (bvsge (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395370) #b00000000000000000000000000001000) (tuple2!21767 Unit!18267 (BitStream!10985 (buf!6539 (_1!11813 lt!393990)) (bvadd (currentByte!12003 (_1!11813 lt!393990)) lt!395368 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395370) #b00000000000000000000000000001000))) (tuple2!21767 Unit!18268 (BitStream!10985 (buf!6539 (_1!11813 lt!393990)) (bvadd (currentByte!12003 (_1!11813 lt!393990)) lt!395368) (bvadd (currentBit!11998 (_1!11813 lt!393990)) lt!395370))))))))

(assert (=> b!254596 (= lt!395370 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254596 (= lt!395368 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!254597 () Bool)

(assert (=> b!254597 (= e!176403 (and (= (size!6031 (buf!6539 (_1!11813 lt!393990))) (size!6031 (buf!6539 (_2!11814 lt!395367)))) (= (buf!6539 (_1!11813 lt!393990)) (buf!6539 (_2!11814 lt!395367)))))))

(assert (= (and d!85582 res!213323) b!254596))

(assert (= (and b!254596 res!213324) b!254597))

(assert (=> d!85582 m!382329))

(declare-fun m!383455 () Bool)

(assert (=> b!254596 m!383455))

(assert (=> b!254596 m!382325))

(assert (=> d!85054 d!85582))

(declare-fun d!85586 () Bool)

(declare-fun res!213327 () Bool)

(declare-fun e!176406 () Bool)

(assert (=> d!85586 (=> (not res!213327) (not e!176406))))

(assert (=> d!85586 (= res!213327 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11813 lt!393990))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11813 lt!393990))))))))))

(assert (=> d!85586 (= (moveBitIndexPrecond!0 (_1!11813 lt!393990) #b0000000000000000000000000000000000000000000000000000000000000001) e!176406)))

(declare-fun b!254601 () Bool)

(declare-fun lt!395374 () (_ BitVec 64))

(assert (=> b!254601 (= e!176406 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395374) (bvsle lt!395374 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11813 lt!393990))))))))))

(assert (=> b!254601 (= lt!395374 (bvadd (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)) (currentBit!11998 (_1!11813 lt!393990))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!85586 res!213327) b!254601))

(assert (=> b!254601 m!382325))

(assert (=> d!85054 d!85586))

(declare-fun e!176408 () Bool)

(declare-fun lt!395377 () tuple4!306)

(declare-fun b!254602 () Bool)

(assert (=> b!254602 (= e!176408 (arrayRangesEq!930 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393981)) (_1!11826 lt!395377) (_2!11826 lt!395377)))))

(declare-fun d!85588 () Bool)

(declare-fun res!213332 () Bool)

(declare-fun e!176409 () Bool)

(assert (=> d!85588 (=> res!213332 e!176409)))

(assert (=> d!85588 (= res!213332 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (=> d!85588 (= (arrayBitRangesEq!0 (buf!6539 thiss!1005) (buf!6539 (_2!11814 lt!393981)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))) e!176409)))

(declare-fun b!254603 () Bool)

(declare-fun e!176411 () Bool)

(declare-fun e!176407 () Bool)

(assert (=> b!254603 (= e!176411 e!176407)))

(declare-fun c!11754 () Bool)

(assert (=> b!254603 (= c!11754 (= (_3!933 lt!395377) (_4!153 lt!395377)))))

(declare-fun b!254604 () Bool)

(declare-fun call!4007 () Bool)

(assert (=> b!254604 (= e!176407 call!4007)))

(declare-fun lt!395376 () (_ BitVec 32))

(declare-fun bm!4004 () Bool)

(declare-fun lt!395375 () (_ BitVec 32))

(assert (=> bm!4004 (= call!4007 (byteRangesEq!0 (select (arr!7018 (buf!6539 thiss!1005)) (_3!933 lt!395377)) (select (arr!7018 (buf!6539 (_2!11814 lt!393981))) (_3!933 lt!395377)) lt!395375 (ite c!11754 lt!395376 #b00000000000000000000000000001000)))))

(declare-fun b!254605 () Bool)

(declare-fun e!176412 () Bool)

(assert (=> b!254605 (= e!176412 (byteRangesEq!0 (select (arr!7018 (buf!6539 thiss!1005)) (_4!153 lt!395377)) (select (arr!7018 (buf!6539 (_2!11814 lt!393981))) (_4!153 lt!395377)) #b00000000000000000000000000000000 lt!395376))))

(declare-fun b!254606 () Bool)

(assert (=> b!254606 (= e!176409 e!176411)))

(declare-fun res!213331 () Bool)

(assert (=> b!254606 (=> (not res!213331) (not e!176411))))

(assert (=> b!254606 (= res!213331 e!176408)))

(declare-fun res!213328 () Bool)

(assert (=> b!254606 (=> res!213328 e!176408)))

(assert (=> b!254606 (= res!213328 (bvsge (_1!11826 lt!395377) (_2!11826 lt!395377)))))

(assert (=> b!254606 (= lt!395376 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254606 (= lt!395375 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254606 (= lt!395377 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(declare-fun b!254607 () Bool)

(declare-fun e!176410 () Bool)

(assert (=> b!254607 (= e!176407 e!176410)))

(declare-fun res!213329 () Bool)

(assert (=> b!254607 (= res!213329 call!4007)))

(assert (=> b!254607 (=> (not res!213329) (not e!176410))))

(declare-fun b!254608 () Bool)

(declare-fun res!213330 () Bool)

(assert (=> b!254608 (= res!213330 (= lt!395376 #b00000000000000000000000000000000))))

(assert (=> b!254608 (=> res!213330 e!176412)))

(assert (=> b!254608 (= e!176410 e!176412)))

(assert (= (and d!85588 (not res!213332)) b!254606))

(assert (= (and b!254606 (not res!213328)) b!254602))

(assert (= (and b!254606 res!213331) b!254603))

(assert (= (and b!254603 c!11754) b!254604))

(assert (= (and b!254603 (not c!11754)) b!254607))

(assert (= (and b!254607 res!213329) b!254608))

(assert (= (and b!254608 (not res!213330)) b!254605))

(assert (= (or b!254604 b!254607) bm!4004))

(declare-fun m!383457 () Bool)

(assert (=> b!254602 m!383457))

(declare-fun m!383459 () Bool)

(assert (=> bm!4004 m!383459))

(declare-fun m!383461 () Bool)

(assert (=> bm!4004 m!383461))

(assert (=> bm!4004 m!383459))

(assert (=> bm!4004 m!383461))

(declare-fun m!383463 () Bool)

(assert (=> bm!4004 m!383463))

(declare-fun m!383465 () Bool)

(assert (=> b!254605 m!383465))

(declare-fun m!383467 () Bool)

(assert (=> b!254605 m!383467))

(assert (=> b!254605 m!383465))

(assert (=> b!254605 m!383467))

(declare-fun m!383469 () Bool)

(assert (=> b!254605 m!383469))

(assert (=> b!254606 m!382001))

(assert (=> b!254606 m!383375))

(assert (=> b!254044 d!85588))

(assert (=> b!254044 d!85134))

(declare-fun d!85590 () Bool)

(assert (=> d!85590 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 thiss!1005)))))))

(assert (=> d!85134 d!85590))

(declare-fun d!85592 () Bool)

(assert (=> d!85592 (= (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 thiss!1005))) (and (bvsge (currentBit!11998 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11998 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!12003 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 thiss!1005) (size!6031 (buf!6539 thiss!1005))) (and (= (currentBit!11998 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!12003 thiss!1005) (size!6031 (buf!6539 thiss!1005)))))))))

(assert (=> d!85134 d!85592))

(assert (=> b!254042 d!85134))

(assert (=> b!254042 d!85130))

(declare-fun d!85594 () Bool)

(declare-fun e!176413 () Bool)

(assert (=> d!85594 e!176413))

(declare-fun res!213333 () Bool)

(assert (=> d!85594 (=> (not res!213333) (not e!176413))))

(assert (=> d!85594 (= res!213333 (= (buf!6539 (_2!11814 (increaseBitIndex!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))))

(declare-fun lt!395378 () Bool)

(assert (=> d!85594 (= lt!395378 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))) (currentByte!12003 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395382 () tuple2!21782)

(assert (=> d!85594 (= lt!395382 (tuple2!21783 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))) (currentByte!12003 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))) #b00000000000000000000000000000000)) (_2!11814 (increaseBitIndex!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))))

(assert (=> d!85594 (validate_offset_bit!0 ((_ sign_extend 32) (size!6031 (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) ((_ sign_extend 32) (currentByte!12003 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))) ((_ sign_extend 32) (currentBit!11998 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))))

(assert (=> d!85594 (= (readBit!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))) lt!395382)))

(declare-fun b!254609 () Bool)

(declare-fun lt!395380 () (_ BitVec 64))

(declare-fun lt!395384 () (_ BitVec 64))

(assert (=> b!254609 (= e!176413 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 (increaseBitIndex!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))) (currentByte!12003 (_2!11814 (increaseBitIndex!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) (currentBit!11998 (_2!11814 (increaseBitIndex!0 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))) (bvadd lt!395380 lt!395384)))))

(assert (=> b!254609 (or (not (= (bvand lt!395380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395384 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395380 lt!395384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254609 (= lt!395384 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254609 (= lt!395380 (bitIndex!0 (size!6031 (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))) (currentByte!12003 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))) (currentBit!11998 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))))

(declare-fun lt!395383 () Bool)

(assert (=> b!254609 (= lt!395383 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))) (currentByte!12003 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395381 () Bool)

(assert (=> b!254609 (= lt!395381 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))) (currentByte!12003 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395379 () Bool)

(assert (=> b!254609 (= lt!395379 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))) (currentByte!12003 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85594 res!213333) b!254609))

(declare-fun m!383471 () Bool)

(assert (=> d!85594 m!383471))

(declare-fun m!383473 () Bool)

(assert (=> d!85594 m!383473))

(declare-fun m!383475 () Bool)

(assert (=> d!85594 m!383475))

(declare-fun m!383477 () Bool)

(assert (=> d!85594 m!383477))

(assert (=> b!254609 m!383473))

(assert (=> b!254609 m!383475))

(declare-fun m!383479 () Bool)

(assert (=> b!254609 m!383479))

(declare-fun m!383481 () Bool)

(assert (=> b!254609 m!383481))

(assert (=> b!254609 m!383471))

(assert (=> d!85072 d!85594))

(declare-fun d!85596 () Bool)

(declare-fun res!213335 () Bool)

(declare-fun e!176414 () Bool)

(assert (=> d!85596 (=> (not res!213335) (not e!176414))))

(assert (=> d!85596 (= res!213335 (= (size!6031 (buf!6539 (_1!11813 lt!394437))) (size!6031 (buf!6539 (_2!11813 lt!394437)))))))

(assert (=> d!85596 (= (isPrefixOf!0 (_1!11813 lt!394437) (_2!11813 lt!394437)) e!176414)))

(declare-fun b!254610 () Bool)

(declare-fun res!213334 () Bool)

(assert (=> b!254610 (=> (not res!213334) (not e!176414))))

(assert (=> b!254610 (= res!213334 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394437))) (currentByte!12003 (_1!11813 lt!394437)) (currentBit!11998 (_1!11813 lt!394437))) (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394437))) (currentByte!12003 (_2!11813 lt!394437)) (currentBit!11998 (_2!11813 lt!394437)))))))

(declare-fun b!254611 () Bool)

(declare-fun e!176415 () Bool)

(assert (=> b!254611 (= e!176414 e!176415)))

(declare-fun res!213336 () Bool)

(assert (=> b!254611 (=> res!213336 e!176415)))

(assert (=> b!254611 (= res!213336 (= (size!6031 (buf!6539 (_1!11813 lt!394437))) #b00000000000000000000000000000000))))

(declare-fun b!254612 () Bool)

(assert (=> b!254612 (= e!176415 (arrayBitRangesEq!0 (buf!6539 (_1!11813 lt!394437)) (buf!6539 (_2!11813 lt!394437)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394437))) (currentByte!12003 (_1!11813 lt!394437)) (currentBit!11998 (_1!11813 lt!394437)))))))

(assert (= (and d!85596 res!213335) b!254610))

(assert (= (and b!254610 res!213334) b!254611))

(assert (= (and b!254611 (not res!213336)) b!254612))

(assert (=> b!254610 m!383433))

(declare-fun m!383483 () Bool)

(assert (=> b!254610 m!383483))

(assert (=> b!254612 m!383433))

(assert (=> b!254612 m!383433))

(declare-fun m!383485 () Bool)

(assert (=> b!254612 m!383485))

(assert (=> d!85068 d!85596))

(declare-fun d!85598 () Bool)

(assert (=> d!85598 (isPrefixOf!0 (_2!11814 lt!393993) (_2!11814 lt!393993))))

(declare-fun lt!395387 () Unit!18237)

(declare-fun choose!11 (BitStream!10984) Unit!18237)

(assert (=> d!85598 (= lt!395387 (choose!11 (_2!11814 lt!393993)))))

(assert (=> d!85598 (= (lemmaIsPrefixRefl!0 (_2!11814 lt!393993)) lt!395387)))

(declare-fun bs!21597 () Bool)

(assert (= bs!21597 d!85598))

(assert (=> bs!21597 m!382359))

(declare-fun m!383487 () Bool)

(assert (=> bs!21597 m!383487))

(assert (=> d!85068 d!85598))

(declare-fun d!85600 () Bool)

(declare-fun res!213338 () Bool)

(declare-fun e!176416 () Bool)

(assert (=> d!85600 (=> (not res!213338) (not e!176416))))

(assert (=> d!85600 (= res!213338 (= (size!6031 (buf!6539 lt!394432)) (size!6031 (buf!6539 lt!394432))))))

(assert (=> d!85600 (= (isPrefixOf!0 lt!394432 lt!394432) e!176416)))

(declare-fun b!254613 () Bool)

(declare-fun res!213337 () Bool)

(assert (=> b!254613 (=> (not res!213337) (not e!176416))))

(assert (=> b!254613 (= res!213337 (bvsle (bitIndex!0 (size!6031 (buf!6539 lt!394432)) (currentByte!12003 lt!394432) (currentBit!11998 lt!394432)) (bitIndex!0 (size!6031 (buf!6539 lt!394432)) (currentByte!12003 lt!394432) (currentBit!11998 lt!394432))))))

(declare-fun b!254614 () Bool)

(declare-fun e!176417 () Bool)

(assert (=> b!254614 (= e!176416 e!176417)))

(declare-fun res!213339 () Bool)

(assert (=> b!254614 (=> res!213339 e!176417)))

(assert (=> b!254614 (= res!213339 (= (size!6031 (buf!6539 lt!394432)) #b00000000000000000000000000000000))))

(declare-fun b!254615 () Bool)

(assert (=> b!254615 (= e!176417 (arrayBitRangesEq!0 (buf!6539 lt!394432) (buf!6539 lt!394432) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 lt!394432)) (currentByte!12003 lt!394432) (currentBit!11998 lt!394432))))))

(assert (= (and d!85600 res!213338) b!254613))

(assert (= (and b!254613 res!213337) b!254614))

(assert (= (and b!254614 (not res!213339)) b!254615))

(declare-fun m!383489 () Bool)

(assert (=> b!254613 m!383489))

(assert (=> b!254613 m!383489))

(assert (=> b!254615 m!383489))

(assert (=> b!254615 m!383489))

(declare-fun m!383491 () Bool)

(assert (=> b!254615 m!383491))

(assert (=> d!85068 d!85600))

(declare-fun d!85602 () Bool)

(declare-fun res!213341 () Bool)

(declare-fun e!176418 () Bool)

(assert (=> d!85602 (=> (not res!213341) (not e!176418))))

(assert (=> d!85602 (= res!213341 (= (size!6031 (buf!6539 thiss!1005)) (size!6031 (buf!6539 thiss!1005))))))

(assert (=> d!85602 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!176418)))

(declare-fun b!254616 () Bool)

(declare-fun res!213340 () Bool)

(assert (=> b!254616 (=> (not res!213340) (not e!176418))))

(assert (=> b!254616 (= res!213340 (bvsle (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(declare-fun b!254617 () Bool)

(declare-fun e!176419 () Bool)

(assert (=> b!254617 (= e!176418 e!176419)))

(declare-fun res!213342 () Bool)

(assert (=> b!254617 (=> res!213342 e!176419)))

(assert (=> b!254617 (= res!213342 (= (size!6031 (buf!6539 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!254618 () Bool)

(assert (=> b!254618 (= e!176419 (arrayBitRangesEq!0 (buf!6539 thiss!1005) (buf!6539 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005))))))

(assert (= (and d!85602 res!213341) b!254616))

(assert (= (and b!254616 res!213340) b!254617))

(assert (= (and b!254617 (not res!213342)) b!254618))

(assert (=> b!254616 m!382001))

(assert (=> b!254616 m!382001))

(assert (=> b!254618 m!382001))

(assert (=> b!254618 m!382001))

(declare-fun m!383493 () Bool)

(assert (=> b!254618 m!383493))

(assert (=> d!85068 d!85602))

(declare-fun d!85604 () Bool)

(assert (=> d!85604 (isPrefixOf!0 lt!394432 (_2!11814 lt!393993))))

(declare-fun lt!395388 () Unit!18237)

(assert (=> d!85604 (= lt!395388 (choose!30 lt!394432 thiss!1005 (_2!11814 lt!393993)))))

(assert (=> d!85604 (isPrefixOf!0 lt!394432 thiss!1005)))

(assert (=> d!85604 (= (lemmaIsPrefixTransitive!0 lt!394432 thiss!1005 (_2!11814 lt!393993)) lt!395388)))

(declare-fun bs!21598 () Bool)

(assert (= bs!21598 d!85604))

(assert (=> bs!21598 m!382399))

(declare-fun m!383495 () Bool)

(assert (=> bs!21598 m!383495))

(declare-fun m!383497 () Bool)

(assert (=> bs!21598 m!383497))

(assert (=> d!85068 d!85604))

(declare-fun d!85606 () Bool)

(assert (=> d!85606 (isPrefixOf!0 lt!394432 lt!394432)))

(declare-fun lt!395389 () Unit!18237)

(assert (=> d!85606 (= lt!395389 (choose!11 lt!394432))))

(assert (=> d!85606 (= (lemmaIsPrefixRefl!0 lt!394432) lt!395389)))

(declare-fun bs!21599 () Bool)

(assert (= bs!21599 d!85606))

(assert (=> bs!21599 m!382401))

(declare-fun m!383499 () Bool)

(assert (=> bs!21599 m!383499))

(assert (=> d!85068 d!85606))

(declare-fun d!85608 () Bool)

(declare-fun res!213344 () Bool)

(declare-fun e!176420 () Bool)

(assert (=> d!85608 (=> (not res!213344) (not e!176420))))

(assert (=> d!85608 (= res!213344 (= (size!6031 (buf!6539 lt!394432)) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85608 (= (isPrefixOf!0 lt!394432 (_2!11814 lt!393993)) e!176420)))

(declare-fun b!254619 () Bool)

(declare-fun res!213343 () Bool)

(assert (=> b!254619 (=> (not res!213343) (not e!176420))))

(assert (=> b!254619 (= res!213343 (bvsle (bitIndex!0 (size!6031 (buf!6539 lt!394432)) (currentByte!12003 lt!394432) (currentBit!11998 lt!394432)) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun b!254620 () Bool)

(declare-fun e!176421 () Bool)

(assert (=> b!254620 (= e!176420 e!176421)))

(declare-fun res!213345 () Bool)

(assert (=> b!254620 (=> res!213345 e!176421)))

(assert (=> b!254620 (= res!213345 (= (size!6031 (buf!6539 lt!394432)) #b00000000000000000000000000000000))))

(declare-fun b!254621 () Bool)

(assert (=> b!254621 (= e!176421 (arrayBitRangesEq!0 (buf!6539 lt!394432) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 lt!394432)) (currentByte!12003 lt!394432) (currentBit!11998 lt!394432))))))

(assert (= (and d!85608 res!213344) b!254619))

(assert (= (and b!254619 res!213343) b!254620))

(assert (= (and b!254620 (not res!213345)) b!254621))

(assert (=> b!254619 m!383489))

(assert (=> b!254619 m!382005))

(assert (=> b!254621 m!383489))

(assert (=> b!254621 m!383489))

(declare-fun m!383501 () Bool)

(assert (=> b!254621 m!383501))

(assert (=> d!85068 d!85608))

(declare-fun d!85610 () Bool)

(declare-fun res!213347 () Bool)

(declare-fun e!176422 () Bool)

(assert (=> d!85610 (=> (not res!213347) (not e!176422))))

(assert (=> d!85610 (= res!213347 (= (size!6031 (buf!6539 (_2!11814 lt!393993))) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85610 (= (isPrefixOf!0 (_2!11814 lt!393993) (_2!11814 lt!393993)) e!176422)))

(declare-fun b!254622 () Bool)

(declare-fun res!213346 () Bool)

(assert (=> b!254622 (=> (not res!213346) (not e!176422))))

(assert (=> b!254622 (= res!213346 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun b!254623 () Bool)

(declare-fun e!176423 () Bool)

(assert (=> b!254623 (= e!176422 e!176423)))

(declare-fun res!213348 () Bool)

(assert (=> b!254623 (=> res!213348 e!176423)))

(assert (=> b!254623 (= res!213348 (= (size!6031 (buf!6539 (_2!11814 lt!393993))) #b00000000000000000000000000000000))))

(declare-fun b!254624 () Bool)

(assert (=> b!254624 (= e!176423 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393993)) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(assert (= (and d!85610 res!213347) b!254622))

(assert (= (and b!254622 res!213346) b!254623))

(assert (= (and b!254623 (not res!213348)) b!254624))

(assert (=> b!254622 m!382005))

(assert (=> b!254622 m!382005))

(assert (=> b!254624 m!382005))

(assert (=> b!254624 m!382005))

(declare-fun m!383503 () Bool)

(assert (=> b!254624 m!383503))

(assert (=> d!85068 d!85610))

(declare-fun d!85612 () Bool)

(assert (=> d!85612 (isPrefixOf!0 lt!394432 (_2!11814 lt!393993))))

(declare-fun lt!395390 () Unit!18237)

(assert (=> d!85612 (= lt!395390 (choose!30 lt!394432 (_2!11814 lt!393993) (_2!11814 lt!393993)))))

(assert (=> d!85612 (isPrefixOf!0 lt!394432 (_2!11814 lt!393993))))

(assert (=> d!85612 (= (lemmaIsPrefixTransitive!0 lt!394432 (_2!11814 lt!393993) (_2!11814 lt!393993)) lt!395390)))

(declare-fun bs!21600 () Bool)

(assert (= bs!21600 d!85612))

(assert (=> bs!21600 m!382399))

(declare-fun m!383505 () Bool)

(assert (=> bs!21600 m!383505))

(assert (=> bs!21600 m!382399))

(assert (=> d!85068 d!85612))

(assert (=> d!85068 d!85074))

(declare-fun d!85614 () Bool)

(assert (=> d!85614 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!395391 () Unit!18237)

(assert (=> d!85614 (= lt!395391 (choose!11 thiss!1005))))

(assert (=> d!85614 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!395391)))

(declare-fun bs!21601 () Bool)

(assert (= bs!21601 d!85614))

(assert (=> bs!21601 m!382389))

(declare-fun m!383507 () Bool)

(assert (=> bs!21601 m!383507))

(assert (=> d!85068 d!85614))

(declare-fun d!85616 () Bool)

(declare-fun lt!395392 () tuple2!21782)

(assert (=> d!85616 (= lt!395392 (readBit!0 lt!394358))))

(assert (=> d!85616 (= (readBitPure!0 lt!394358) (tuple2!21763 (_2!11822 lt!395392) (_1!11822 lt!395392)))))

(declare-fun bs!21602 () Bool)

(assert (= bs!21602 d!85616))

(declare-fun m!383509 () Bool)

(assert (=> bs!21602 m!383509))

(assert (=> d!85062 d!85616))

(declare-fun d!85618 () Bool)

(declare-fun e!176424 () Bool)

(assert (=> d!85618 e!176424))

(declare-fun res!213349 () Bool)

(assert (=> d!85618 (=> (not res!213349) (not e!176424))))

(declare-fun lt!395396 () (_ BitVec 64))

(declare-fun lt!395395 () (_ BitVec 64))

(declare-fun lt!395398 () (_ BitVec 64))

(assert (=> d!85618 (= res!213349 (= lt!395398 (bvsub lt!395396 lt!395395)))))

(assert (=> d!85618 (or (= (bvand lt!395396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395395 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395396 lt!395395) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85618 (= lt!395395 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394357)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!394357))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!394357)))))))

(declare-fun lt!395397 () (_ BitVec 64))

(declare-fun lt!395393 () (_ BitVec 64))

(assert (=> d!85618 (= lt!395396 (bvmul lt!395397 lt!395393))))

(assert (=> d!85618 (or (= lt!395397 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395393 (bvsdiv (bvmul lt!395397 lt!395393) lt!395397)))))

(assert (=> d!85618 (= lt!395393 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85618 (= lt!395397 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394357)))))))

(assert (=> d!85618 (= lt!395398 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!394357))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!394357)))))))

(assert (=> d!85618 (invariant!0 (currentBit!11998 (_1!11812 lt!394357)) (currentByte!12003 (_1!11812 lt!394357)) (size!6031 (buf!6539 (_1!11812 lt!394357))))))

(assert (=> d!85618 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!394357))) (currentByte!12003 (_1!11812 lt!394357)) (currentBit!11998 (_1!11812 lt!394357))) lt!395398)))

(declare-fun b!254625 () Bool)

(declare-fun res!213350 () Bool)

(assert (=> b!254625 (=> (not res!213350) (not e!176424))))

(assert (=> b!254625 (= res!213350 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395398))))

(declare-fun b!254626 () Bool)

(declare-fun lt!395394 () (_ BitVec 64))

(assert (=> b!254626 (= e!176424 (bvsle lt!395398 (bvmul lt!395394 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254626 (or (= lt!395394 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395394 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395394)))))

(assert (=> b!254626 (= lt!395394 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394357)))))))

(assert (= (and d!85618 res!213349) b!254625))

(assert (= (and b!254625 res!213350) b!254626))

(declare-fun m!383511 () Bool)

(assert (=> d!85618 m!383511))

(declare-fun m!383513 () Bool)

(assert (=> d!85618 m!383513))

(assert (=> d!85062 d!85618))

(declare-fun d!85620 () Bool)

(assert (=> d!85620 (= (invariant!0 (currentBit!11998 lt!393988) (currentByte!12003 lt!393988) (size!6031 (buf!6539 (_2!11814 lt!393993)))) (and (bvsge (currentBit!11998 lt!393988) #b00000000000000000000000000000000) (bvslt (currentBit!11998 lt!393988) #b00000000000000000000000000001000) (bvsge (currentByte!12003 lt!393988) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 lt!393988) (size!6031 (buf!6539 (_2!11814 lt!393993)))) (and (= (currentBit!11998 lt!393988) #b00000000000000000000000000000000) (= (currentByte!12003 lt!393988) (size!6031 (buf!6539 (_2!11814 lt!393993))))))))))

(assert (=> d!85062 d!85620))

(assert (=> d!85062 d!85070))

(declare-fun d!85622 () Bool)

(declare-fun e!176425 () Bool)

(assert (=> d!85622 e!176425))

(declare-fun res!213351 () Bool)

(assert (=> d!85622 (=> (not res!213351) (not e!176425))))

(declare-fun lt!395401 () (_ BitVec 64))

(declare-fun lt!395404 () (_ BitVec 64))

(declare-fun lt!395402 () (_ BitVec 64))

(assert (=> d!85622 (= res!213351 (= lt!395404 (bvsub lt!395402 lt!395401)))))

(assert (=> d!85622 (or (= (bvand lt!395402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395402 lt!395401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85622 (= lt!395401 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394356)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!394356))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!394356)))))))

(declare-fun lt!395403 () (_ BitVec 64))

(declare-fun lt!395399 () (_ BitVec 64))

(assert (=> d!85622 (= lt!395402 (bvmul lt!395403 lt!395399))))

(assert (=> d!85622 (or (= lt!395403 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395399 (bvsdiv (bvmul lt!395403 lt!395399) lt!395403)))))

(assert (=> d!85622 (= lt!395399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85622 (= lt!395403 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394356)))))))

(assert (=> d!85622 (= lt!395404 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!394356))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!394356)))))))

(assert (=> d!85622 (invariant!0 (currentBit!11998 (_1!11812 lt!394356)) (currentByte!12003 (_1!11812 lt!394356)) (size!6031 (buf!6539 (_1!11812 lt!394356))))))

(assert (=> d!85622 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!394356))) (currentByte!12003 (_1!11812 lt!394356)) (currentBit!11998 (_1!11812 lt!394356))) lt!395404)))

(declare-fun b!254627 () Bool)

(declare-fun res!213352 () Bool)

(assert (=> b!254627 (=> (not res!213352) (not e!176425))))

(assert (=> b!254627 (= res!213352 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395404))))

(declare-fun b!254628 () Bool)

(declare-fun lt!395400 () (_ BitVec 64))

(assert (=> b!254628 (= e!176425 (bvsle lt!395404 (bvmul lt!395400 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254628 (or (= lt!395400 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395400 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395400)))))

(assert (=> b!254628 (= lt!395400 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!394356)))))))

(assert (= (and d!85622 res!213351) b!254627))

(assert (= (and b!254627 res!213352) b!254628))

(declare-fun m!383515 () Bool)

(assert (=> d!85622 m!383515))

(declare-fun m!383517 () Bool)

(assert (=> d!85622 m!383517))

(assert (=> d!85062 d!85622))

(declare-fun d!85624 () Bool)

(declare-fun e!176428 () Bool)

(assert (=> d!85624 e!176428))

(declare-fun res!213355 () Bool)

(assert (=> d!85624 (=> (not res!213355) (not e!176428))))

(declare-fun lt!395412 () tuple2!21762)

(declare-fun lt!395413 () tuple2!21762)

(assert (=> d!85624 (= res!213355 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!395412))) (currentByte!12003 (_1!11812 lt!395412)) (currentBit!11998 (_1!11812 lt!395412))) (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!395413))) (currentByte!12003 (_1!11812 lt!395413)) (currentBit!11998 (_1!11812 lt!395413)))))))

(declare-fun lt!395411 () BitStream!10984)

(assert (=> d!85624 (= lt!395413 (readBitPure!0 lt!395411))))

(assert (=> d!85624 (= lt!395412 (readBitPure!0 lt!393988))))

(assert (=> d!85624 (= lt!395411 (BitStream!10985 (buf!6539 (_2!11814 lt!393993)) (currentByte!12003 lt!393988) (currentBit!11998 lt!393988)))))

(assert (=> d!85624 (invariant!0 (currentBit!11998 lt!393988) (currentByte!12003 lt!393988) (size!6031 (buf!6539 (_2!11814 lt!393993))))))

(assert (=> d!85624 true))

(declare-fun _$9!120 () Unit!18237)

(assert (=> d!85624 (= (choose!50 lt!393988 (_2!11814 lt!393993) lt!394358 lt!394357 (tuple2!21763 (_1!11812 lt!394357) (_2!11812 lt!394357)) (_1!11812 lt!394357) (_2!11812 lt!394357) lt!394356 (tuple2!21763 (_1!11812 lt!394356) (_2!11812 lt!394356)) (_1!11812 lt!394356) (_2!11812 lt!394356)) _$9!120)))

(declare-fun b!254631 () Bool)

(assert (=> b!254631 (= e!176428 (= (_2!11812 lt!395412) (_2!11812 lt!395413)))))

(assert (= (and d!85624 res!213355) b!254631))

(declare-fun m!383519 () Bool)

(assert (=> d!85624 m!383519))

(assert (=> d!85624 m!381943))

(assert (=> d!85624 m!382337))

(declare-fun m!383521 () Bool)

(assert (=> d!85624 m!383521))

(declare-fun m!383523 () Bool)

(assert (=> d!85624 m!383523))

(assert (=> d!85062 d!85624))

(assert (=> d!85058 d!85592))

(assert (=> d!85122 d!85534))

(assert (=> b!253908 d!85126))

(declare-fun d!85626 () Bool)

(assert (=> d!85626 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393993)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))))))))

(assert (=> d!85114 d!85626))

(declare-fun d!85628 () Bool)

(declare-fun e!176429 () Bool)

(assert (=> d!85628 e!176429))

(declare-fun res!213356 () Bool)

(assert (=> d!85628 (=> (not res!213356) (not e!176429))))

(assert (=> d!85628 (= res!213356 (= (buf!6539 (_2!11814 (increaseBitIndex!0 lt!393988))) (buf!6539 lt!393988)))))

(declare-fun lt!395414 () Bool)

(assert (=> d!85628 (= lt!395414 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 lt!393988)) (currentByte!12003 lt!393988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 lt!393988)))) #b00000000000000000000000000000000)))))

(declare-fun lt!395418 () tuple2!21782)

(assert (=> d!85628 (= lt!395418 (tuple2!21783 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 lt!393988)) (currentByte!12003 lt!393988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 lt!393988)))) #b00000000000000000000000000000000)) (_2!11814 (increaseBitIndex!0 lt!393988))))))

(assert (=> d!85628 (validate_offset_bit!0 ((_ sign_extend 32) (size!6031 (buf!6539 lt!393988))) ((_ sign_extend 32) (currentByte!12003 lt!393988)) ((_ sign_extend 32) (currentBit!11998 lt!393988)))))

(assert (=> d!85628 (= (readBit!0 lt!393988) lt!395418)))

(declare-fun lt!395416 () (_ BitVec 64))

(declare-fun b!254632 () Bool)

(declare-fun lt!395420 () (_ BitVec 64))

(assert (=> b!254632 (= e!176429 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 (increaseBitIndex!0 lt!393988)))) (currentByte!12003 (_2!11814 (increaseBitIndex!0 lt!393988))) (currentBit!11998 (_2!11814 (increaseBitIndex!0 lt!393988)))) (bvadd lt!395416 lt!395420)))))

(assert (=> b!254632 (or (not (= (bvand lt!395416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395420 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395416 lt!395420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254632 (= lt!395420 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254632 (= lt!395416 (bitIndex!0 (size!6031 (buf!6539 lt!393988)) (currentByte!12003 lt!393988) (currentBit!11998 lt!393988)))))

(declare-fun lt!395419 () Bool)

(assert (=> b!254632 (= lt!395419 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 lt!393988)) (currentByte!12003 lt!393988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 lt!393988)))) #b00000000000000000000000000000000)))))

(declare-fun lt!395417 () Bool)

(assert (=> b!254632 (= lt!395417 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 lt!393988)) (currentByte!12003 lt!393988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 lt!393988)))) #b00000000000000000000000000000000)))))

(declare-fun lt!395415 () Bool)

(assert (=> b!254632 (= lt!395415 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 lt!393988)) (currentByte!12003 lt!393988))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 lt!393988)))) #b00000000000000000000000000000000)))))

(assert (= (and d!85628 res!213356) b!254632))

(declare-fun m!383525 () Bool)

(assert (=> d!85628 m!383525))

(declare-fun m!383527 () Bool)

(assert (=> d!85628 m!383527))

(declare-fun m!383529 () Bool)

(assert (=> d!85628 m!383529))

(declare-fun m!383531 () Bool)

(assert (=> d!85628 m!383531))

(assert (=> b!254632 m!383527))

(assert (=> b!254632 m!383529))

(declare-fun m!383533 () Bool)

(assert (=> b!254632 m!383533))

(declare-fun m!383535 () Bool)

(assert (=> b!254632 m!383535))

(assert (=> b!254632 m!383525))

(assert (=> d!85070 d!85628))

(declare-fun lt!395423 () tuple4!306)

(declare-fun b!254633 () Bool)

(declare-fun e!176431 () Bool)

(assert (=> b!254633 (= e!176431 (arrayRangesEq!930 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!393993)) (_1!11826 lt!395423) (_2!11826 lt!395423)))))

(declare-fun d!85630 () Bool)

(declare-fun res!213361 () Bool)

(declare-fun e!176432 () Bool)

(assert (=> d!85630 (=> res!213361 e!176432)))

(assert (=> d!85630 (= res!213361 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (=> d!85630 (= (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))) e!176432)))

(declare-fun b!254634 () Bool)

(declare-fun e!176434 () Bool)

(declare-fun e!176430 () Bool)

(assert (=> b!254634 (= e!176434 e!176430)))

(declare-fun c!11755 () Bool)

(assert (=> b!254634 (= c!11755 (= (_3!933 lt!395423) (_4!153 lt!395423)))))

(declare-fun b!254635 () Bool)

(declare-fun call!4008 () Bool)

(assert (=> b!254635 (= e!176430 call!4008)))

(declare-fun bm!4005 () Bool)

(declare-fun lt!395421 () (_ BitVec 32))

(declare-fun lt!395422 () (_ BitVec 32))

(assert (=> bm!4005 (= call!4008 (byteRangesEq!0 (select (arr!7018 (buf!6539 (_2!11814 lt!393981))) (_3!933 lt!395423)) (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_3!933 lt!395423)) lt!395421 (ite c!11755 lt!395422 #b00000000000000000000000000001000)))))

(declare-fun b!254636 () Bool)

(declare-fun e!176435 () Bool)

(assert (=> b!254636 (= e!176435 (byteRangesEq!0 (select (arr!7018 (buf!6539 (_2!11814 lt!393981))) (_4!153 lt!395423)) (select (arr!7018 (buf!6539 (_2!11814 lt!393993))) (_4!153 lt!395423)) #b00000000000000000000000000000000 lt!395422))))

(declare-fun b!254637 () Bool)

(assert (=> b!254637 (= e!176432 e!176434)))

(declare-fun res!213360 () Bool)

(assert (=> b!254637 (=> (not res!213360) (not e!176434))))

(assert (=> b!254637 (= res!213360 e!176431)))

(declare-fun res!213357 () Bool)

(assert (=> b!254637 (=> res!213357 e!176431)))

(assert (=> b!254637 (= res!213357 (bvsge (_1!11826 lt!395423) (_2!11826 lt!395423)))))

(assert (=> b!254637 (= lt!395422 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254637 (= lt!395421 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254637 (= lt!395423 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(declare-fun b!254638 () Bool)

(declare-fun e!176433 () Bool)

(assert (=> b!254638 (= e!176430 e!176433)))

(declare-fun res!213358 () Bool)

(assert (=> b!254638 (= res!213358 call!4008)))

(assert (=> b!254638 (=> (not res!213358) (not e!176433))))

(declare-fun b!254639 () Bool)

(declare-fun res!213359 () Bool)

(assert (=> b!254639 (= res!213359 (= lt!395422 #b00000000000000000000000000000000))))

(assert (=> b!254639 (=> res!213359 e!176435)))

(assert (=> b!254639 (= e!176433 e!176435)))

(assert (= (and d!85630 (not res!213361)) b!254637))

(assert (= (and b!254637 (not res!213357)) b!254633))

(assert (= (and b!254637 res!213360) b!254634))

(assert (= (and b!254634 c!11755) b!254635))

(assert (= (and b!254634 (not c!11755)) b!254638))

(assert (= (and b!254638 res!213358) b!254639))

(assert (= (and b!254639 (not res!213359)) b!254636))

(assert (= (or b!254635 b!254638) bm!4005))

(declare-fun m!383537 () Bool)

(assert (=> b!254633 m!383537))

(declare-fun m!383539 () Bool)

(assert (=> bm!4005 m!383539))

(declare-fun m!383541 () Bool)

(assert (=> bm!4005 m!383541))

(assert (=> bm!4005 m!383539))

(assert (=> bm!4005 m!383541))

(declare-fun m!383543 () Bool)

(assert (=> bm!4005 m!383543))

(declare-fun m!383545 () Bool)

(assert (=> b!254636 m!383545))

(declare-fun m!383547 () Bool)

(assert (=> b!254636 m!383547))

(assert (=> b!254636 m!383545))

(assert (=> b!254636 m!383547))

(declare-fun m!383549 () Bool)

(assert (=> b!254636 m!383549))

(assert (=> b!254637 m!381999))

(declare-fun m!383551 () Bool)

(assert (=> b!254637 m!383551))

(assert (=> b!253920 d!85630))

(assert (=> b!253920 d!85130))

(assert (=> d!85110 d!85074))

(declare-fun d!85632 () Bool)

(assert (=> d!85632 (isPrefixOf!0 thiss!1005 (_2!11814 lt!393993))))

(assert (=> d!85632 true))

(declare-fun _$15!339 () Unit!18237)

(assert (=> d!85632 (= (choose!30 thiss!1005 (_2!11814 lt!393981) (_2!11814 lt!393993)) _$15!339)))

(declare-fun bs!21603 () Bool)

(assert (= bs!21603 d!85632))

(assert (=> bs!21603 m!381959))

(assert (=> d!85110 d!85632))

(assert (=> d!85110 d!85136))

(declare-fun lt!395424 () tuple2!21782)

(declare-fun d!85634 () Bool)

(assert (=> d!85634 (= lt!395424 (checkBitsLoop!0 (_1!11813 lt!394584) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!85634 (= (checkBitsLoopPure!0 (_1!11813 lt!394584) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21763 (_2!11822 lt!395424) (_1!11822 lt!395424)))))

(declare-fun bs!21604 () Bool)

(assert (= bs!21604 d!85634))

(declare-fun m!383553 () Bool)

(assert (=> bs!21604 m!383553))

(assert (=> b!254018 d!85634))

(declare-fun d!85636 () Bool)

(assert (=> d!85636 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394589)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!394587) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394589)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) lt!394587))))

(declare-fun bs!21605 () Bool)

(assert (= bs!21605 d!85636))

(declare-fun m!383555 () Bool)

(assert (=> bs!21605 m!383555))

(assert (=> b!254018 d!85636))

(declare-fun d!85638 () Bool)

(assert (=> d!85638 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394589)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!394587)))

(declare-fun lt!395425 () Unit!18237)

(assert (=> d!85638 (= lt!395425 (choose!9 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!394589)) lt!394587 (BitStream!10985 (buf!6539 (_2!11814 lt!394589)) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (=> d!85638 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11814 lt!393981) (buf!6539 (_2!11814 lt!394589)) lt!394587) lt!395425)))

(declare-fun bs!21606 () Bool)

(assert (= bs!21606 d!85638))

(assert (=> bs!21606 m!382511))

(declare-fun m!383557 () Bool)

(assert (=> bs!21606 m!383557))

(assert (=> b!254018 d!85638))

(declare-fun b!254640 () Bool)

(declare-fun e!176437 () Unit!18237)

(declare-fun Unit!18269 () Unit!18237)

(assert (=> b!254640 (= e!176437 Unit!18269)))

(declare-fun d!85640 () Bool)

(declare-fun e!176436 () Bool)

(assert (=> d!85640 e!176436))

(declare-fun res!213362 () Bool)

(assert (=> d!85640 (=> (not res!213362) (not e!176436))))

(declare-fun lt!395442 () tuple2!21764)

(assert (=> d!85640 (= res!213362 (isPrefixOf!0 (_1!11813 lt!395442) (_2!11813 lt!395442)))))

(declare-fun lt!395437 () BitStream!10984)

(assert (=> d!85640 (= lt!395442 (tuple2!21765 lt!395437 (_2!11814 lt!394589)))))

(declare-fun lt!395434 () Unit!18237)

(declare-fun lt!395443 () Unit!18237)

(assert (=> d!85640 (= lt!395434 lt!395443)))

(assert (=> d!85640 (isPrefixOf!0 lt!395437 (_2!11814 lt!394589))))

(assert (=> d!85640 (= lt!395443 (lemmaIsPrefixTransitive!0 lt!395437 (_2!11814 lt!394589) (_2!11814 lt!394589)))))

(declare-fun lt!395440 () Unit!18237)

(declare-fun lt!395427 () Unit!18237)

(assert (=> d!85640 (= lt!395440 lt!395427)))

(assert (=> d!85640 (isPrefixOf!0 lt!395437 (_2!11814 lt!394589))))

(assert (=> d!85640 (= lt!395427 (lemmaIsPrefixTransitive!0 lt!395437 (_2!11814 lt!393981) (_2!11814 lt!394589)))))

(declare-fun lt!395432 () Unit!18237)

(assert (=> d!85640 (= lt!395432 e!176437)))

(declare-fun c!11756 () Bool)

(assert (=> d!85640 (= c!11756 (not (= (size!6031 (buf!6539 (_2!11814 lt!393981))) #b00000000000000000000000000000000)))))

(declare-fun lt!395445 () Unit!18237)

(declare-fun lt!395428 () Unit!18237)

(assert (=> d!85640 (= lt!395445 lt!395428)))

(assert (=> d!85640 (isPrefixOf!0 (_2!11814 lt!394589) (_2!11814 lt!394589))))

(assert (=> d!85640 (= lt!395428 (lemmaIsPrefixRefl!0 (_2!11814 lt!394589)))))

(declare-fun lt!395429 () Unit!18237)

(declare-fun lt!395426 () Unit!18237)

(assert (=> d!85640 (= lt!395429 lt!395426)))

(assert (=> d!85640 (= lt!395426 (lemmaIsPrefixRefl!0 (_2!11814 lt!394589)))))

(declare-fun lt!395433 () Unit!18237)

(declare-fun lt!395439 () Unit!18237)

(assert (=> d!85640 (= lt!395433 lt!395439)))

(assert (=> d!85640 (isPrefixOf!0 lt!395437 lt!395437)))

(assert (=> d!85640 (= lt!395439 (lemmaIsPrefixRefl!0 lt!395437))))

(declare-fun lt!395441 () Unit!18237)

(declare-fun lt!395438 () Unit!18237)

(assert (=> d!85640 (= lt!395441 lt!395438)))

(assert (=> d!85640 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!393981))))

(assert (=> d!85640 (= lt!395438 (lemmaIsPrefixRefl!0 (_2!11814 lt!393981)))))

(assert (=> d!85640 (= lt!395437 (BitStream!10985 (buf!6539 (_2!11814 lt!394589)) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(assert (=> d!85640 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!394589))))

(assert (=> d!85640 (= (reader!0 (_2!11814 lt!393981) (_2!11814 lt!394589)) lt!395442)))

(declare-fun lt!395436 () (_ BitVec 64))

(declare-fun b!254641 () Bool)

(declare-fun lt!395431 () (_ BitVec 64))

(assert (=> b!254641 (= e!176436 (= (_1!11813 lt!395442) (withMovedBitIndex!0 (_2!11813 lt!395442) (bvsub lt!395431 lt!395436))))))

(assert (=> b!254641 (or (= (bvand lt!395431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395436 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395431 lt!395436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254641 (= lt!395436 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394589))) (currentByte!12003 (_2!11814 lt!394589)) (currentBit!11998 (_2!11814 lt!394589))))))

(assert (=> b!254641 (= lt!395431 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(declare-fun b!254642 () Bool)

(declare-fun res!213363 () Bool)

(assert (=> b!254642 (=> (not res!213363) (not e!176436))))

(assert (=> b!254642 (= res!213363 (isPrefixOf!0 (_1!11813 lt!395442) (_2!11814 lt!393981)))))

(declare-fun b!254643 () Bool)

(declare-fun res!213364 () Bool)

(assert (=> b!254643 (=> (not res!213364) (not e!176436))))

(assert (=> b!254643 (= res!213364 (isPrefixOf!0 (_2!11813 lt!395442) (_2!11814 lt!394589)))))

(declare-fun b!254644 () Bool)

(declare-fun lt!395435 () Unit!18237)

(assert (=> b!254644 (= e!176437 lt!395435)))

(declare-fun lt!395430 () (_ BitVec 64))

(assert (=> b!254644 (= lt!395430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!395444 () (_ BitVec 64))

(assert (=> b!254644 (= lt!395444 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))))))

(assert (=> b!254644 (= lt!395435 (arrayBitRangesEqSymmetric!0 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!394589)) lt!395430 lt!395444))))

(assert (=> b!254644 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!394589)) (buf!6539 (_2!11814 lt!393981)) lt!395430 lt!395444)))

(assert (= (and d!85640 c!11756) b!254644))

(assert (= (and d!85640 (not c!11756)) b!254640))

(assert (= (and d!85640 res!213362) b!254642))

(assert (= (and b!254642 res!213363) b!254643))

(assert (= (and b!254643 res!213364) b!254641))

(declare-fun m!383559 () Bool)

(assert (=> b!254642 m!383559))

(declare-fun m!383561 () Bool)

(assert (=> b!254641 m!383561))

(assert (=> b!254641 m!382501))

(assert (=> b!254641 m!381999))

(declare-fun m!383563 () Bool)

(assert (=> b!254643 m!383563))

(assert (=> b!254644 m!381999))

(declare-fun m!383565 () Bool)

(assert (=> b!254644 m!383565))

(declare-fun m!383567 () Bool)

(assert (=> b!254644 m!383567))

(declare-fun m!383569 () Bool)

(assert (=> d!85640 m!383569))

(assert (=> d!85640 m!382361))

(assert (=> d!85640 m!382363))

(declare-fun m!383571 () Bool)

(assert (=> d!85640 m!383571))

(declare-fun m!383573 () Bool)

(assert (=> d!85640 m!383573))

(declare-fun m!383575 () Bool)

(assert (=> d!85640 m!383575))

(declare-fun m!383577 () Bool)

(assert (=> d!85640 m!383577))

(assert (=> d!85640 m!382505))

(declare-fun m!383579 () Bool)

(assert (=> d!85640 m!383579))

(declare-fun m!383581 () Bool)

(assert (=> d!85640 m!383581))

(declare-fun m!383583 () Bool)

(assert (=> d!85640 m!383583))

(assert (=> b!254018 d!85640))

(assert (=> b!253918 d!85130))

(assert (=> b!253918 d!85128))

(assert (=> d!85138 d!85590))

(declare-fun d!85642 () Bool)

(declare-fun e!176438 () Bool)

(assert (=> d!85642 e!176438))

(declare-fun res!213365 () Bool)

(assert (=> d!85642 (=> (not res!213365) (not e!176438))))

(assert (=> d!85642 (= res!213365 (= (buf!6539 (_2!11814 (increaseBitIndex!0 (_1!11813 lt!393990)))) (buf!6539 (_1!11813 lt!393990))))))

(declare-fun lt!395446 () Bool)

(assert (=> d!85642 (= lt!395446 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (_1!11813 lt!393990))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395450 () tuple2!21782)

(assert (=> d!85642 (= lt!395450 (tuple2!21783 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (_1!11813 lt!393990))))) #b00000000000000000000000000000000)) (_2!11814 (increaseBitIndex!0 (_1!11813 lt!393990)))))))

(assert (=> d!85642 (validate_offset_bit!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11813 lt!393990)))) ((_ sign_extend 32) (currentByte!12003 (_1!11813 lt!393990))) ((_ sign_extend 32) (currentBit!11998 (_1!11813 lt!393990))))))

(assert (=> d!85642 (= (readBit!0 (_1!11813 lt!393990)) lt!395450)))

(declare-fun b!254645 () Bool)

(declare-fun lt!395448 () (_ BitVec 64))

(declare-fun lt!395452 () (_ BitVec 64))

(assert (=> b!254645 (= e!176438 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 (increaseBitIndex!0 (_1!11813 lt!393990))))) (currentByte!12003 (_2!11814 (increaseBitIndex!0 (_1!11813 lt!393990)))) (currentBit!11998 (_2!11814 (increaseBitIndex!0 (_1!11813 lt!393990))))) (bvadd lt!395448 lt!395452)))))

(assert (=> b!254645 (or (not (= (bvand lt!395448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395452 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395448 lt!395452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254645 (= lt!395452 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254645 (= lt!395448 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)) (currentBit!11998 (_1!11813 lt!393990))))))

(declare-fun lt!395451 () Bool)

(assert (=> b!254645 (= lt!395451 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (_1!11813 lt!393990))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395449 () Bool)

(assert (=> b!254645 (= lt!395449 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (_1!11813 lt!393990))))) #b00000000000000000000000000000000)))))

(declare-fun lt!395447 () Bool)

(assert (=> b!254645 (= lt!395447 (not (= (bvand ((_ sign_extend 24) (select (arr!7018 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11998 (_1!11813 lt!393990))))) #b00000000000000000000000000000000)))))

(assert (= (and d!85642 res!213365) b!254645))

(declare-fun m!383585 () Bool)

(assert (=> d!85642 m!383585))

(declare-fun m!383587 () Bool)

(assert (=> d!85642 m!383587))

(declare-fun m!383589 () Bool)

(assert (=> d!85642 m!383589))

(declare-fun m!383591 () Bool)

(assert (=> d!85642 m!383591))

(assert (=> b!254645 m!383587))

(assert (=> b!254645 m!383589))

(assert (=> b!254645 m!382325))

(declare-fun m!383593 () Bool)

(assert (=> b!254645 m!383593))

(assert (=> b!254645 m!383585))

(assert (=> d!85120 d!85642))

(declare-fun d!85644 () Bool)

(declare-fun e!176439 () Bool)

(assert (=> d!85644 e!176439))

(declare-fun res!213366 () Bool)

(assert (=> d!85644 (=> (not res!213366) (not e!176439))))

(declare-fun lt!395455 () (_ BitVec 64))

(declare-fun lt!395456 () (_ BitVec 64))

(declare-fun lt!395458 () (_ BitVec 64))

(assert (=> d!85644 (= res!213366 (= lt!395458 (bvsub lt!395456 lt!395455)))))

(assert (=> d!85644 (or (= (bvand lt!395456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!395455 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395456 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395456 lt!395455) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85644 (= lt!395455 (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394589)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!394589))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!394589)))))))

(declare-fun lt!395457 () (_ BitVec 64))

(declare-fun lt!395453 () (_ BitVec 64))

(assert (=> d!85644 (= lt!395456 (bvmul lt!395457 lt!395453))))

(assert (=> d!85644 (or (= lt!395457 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!395453 (bvsdiv (bvmul lt!395457 lt!395453) lt!395457)))))

(assert (=> d!85644 (= lt!395453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!85644 (= lt!395457 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394589)))))))

(assert (=> d!85644 (= lt!395458 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!394589))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!394589)))))))

(assert (=> d!85644 (invariant!0 (currentBit!11998 (_2!11814 lt!394589)) (currentByte!12003 (_2!11814 lt!394589)) (size!6031 (buf!6539 (_2!11814 lt!394589))))))

(assert (=> d!85644 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!394589))) (currentByte!12003 (_2!11814 lt!394589)) (currentBit!11998 (_2!11814 lt!394589))) lt!395458)))

(declare-fun b!254646 () Bool)

(declare-fun res!213367 () Bool)

(assert (=> b!254646 (=> (not res!213367) (not e!176439))))

(assert (=> b!254646 (= res!213367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!395458))))

(declare-fun b!254647 () Bool)

(declare-fun lt!395454 () (_ BitVec 64))

(assert (=> b!254647 (= e!176439 (bvsle lt!395458 (bvmul lt!395454 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!254647 (or (= lt!395454 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!395454 #b0000000000000000000000000000000000000000000000000000000000001000) lt!395454)))))

(assert (=> b!254647 (= lt!395454 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!394589)))))))

(assert (= (and d!85644 res!213366) b!254646))

(assert (= (and b!254646 res!213367) b!254647))

(declare-fun m!383595 () Bool)

(assert (=> d!85644 m!383595))

(declare-fun m!383597 () Bool)

(assert (=> d!85644 m!383597))

(assert (=> b!254016 d!85644))

(assert (=> b!254016 d!85130))

(declare-fun d!85646 () Bool)

(declare-fun res!213369 () Bool)

(declare-fun e!176440 () Bool)

(assert (=> d!85646 (=> (not res!213369) (not e!176440))))

(assert (=> d!85646 (= res!213369 (= (size!6031 (buf!6539 (_2!11813 lt!394417))) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85646 (= (isPrefixOf!0 (_2!11813 lt!394417) (_2!11814 lt!393993)) e!176440)))

(declare-fun b!254648 () Bool)

(declare-fun res!213368 () Bool)

(assert (=> b!254648 (=> (not res!213368) (not e!176440))))

(assert (=> b!254648 (= res!213368 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394417))) (currentByte!12003 (_2!11813 lt!394417)) (currentBit!11998 (_2!11813 lt!394417))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun b!254649 () Bool)

(declare-fun e!176441 () Bool)

(assert (=> b!254649 (= e!176440 e!176441)))

(declare-fun res!213370 () Bool)

(assert (=> b!254649 (=> res!213370 e!176441)))

(assert (=> b!254649 (= res!213370 (= (size!6031 (buf!6539 (_2!11813 lt!394417))) #b00000000000000000000000000000000))))

(declare-fun b!254650 () Bool)

(assert (=> b!254650 (= e!176441 (arrayBitRangesEq!0 (buf!6539 (_2!11813 lt!394417)) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394417))) (currentByte!12003 (_2!11813 lt!394417)) (currentBit!11998 (_2!11813 lt!394417)))))))

(assert (= (and d!85646 res!213369) b!254648))

(assert (= (and b!254648 res!213368) b!254649))

(assert (= (and b!254649 (not res!213370)) b!254650))

(declare-fun m!383599 () Bool)

(assert (=> b!254648 m!383599))

(assert (=> b!254648 m!382005))

(assert (=> b!254650 m!383599))

(assert (=> b!254650 m!383599))

(declare-fun m!383601 () Bool)

(assert (=> b!254650 m!383601))

(assert (=> b!253937 d!85646))

(declare-fun d!85648 () Bool)

(declare-fun res!213372 () Bool)

(declare-fun e!176442 () Bool)

(assert (=> d!85648 (=> (not res!213372) (not e!176442))))

(assert (=> d!85648 (= res!213372 (= (size!6031 (buf!6539 (_2!11813 lt!394437))) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85648 (= (isPrefixOf!0 (_2!11813 lt!394437) (_2!11814 lt!393993)) e!176442)))

(declare-fun b!254651 () Bool)

(declare-fun res!213371 () Bool)

(assert (=> b!254651 (=> (not res!213371) (not e!176442))))

(assert (=> b!254651 (= res!213371 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394437))) (currentByte!12003 (_2!11813 lt!394437)) (currentBit!11998 (_2!11813 lt!394437))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun b!254652 () Bool)

(declare-fun e!176443 () Bool)

(assert (=> b!254652 (= e!176442 e!176443)))

(declare-fun res!213373 () Bool)

(assert (=> b!254652 (=> res!213373 e!176443)))

(assert (=> b!254652 (= res!213373 (= (size!6031 (buf!6539 (_2!11813 lt!394437))) #b00000000000000000000000000000000))))

(declare-fun b!254653 () Bool)

(assert (=> b!254653 (= e!176443 (arrayBitRangesEq!0 (buf!6539 (_2!11813 lt!394437)) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394437))) (currentByte!12003 (_2!11813 lt!394437)) (currentBit!11998 (_2!11813 lt!394437)))))))

(assert (= (and d!85648 res!213372) b!254651))

(assert (= (and b!254651 res!213371) b!254652))

(assert (= (and b!254652 (not res!213373)) b!254653))

(assert (=> b!254651 m!383483))

(assert (=> b!254651 m!382005))

(assert (=> b!254653 m!383483))

(assert (=> b!254653 m!383483))

(declare-fun m!383603 () Bool)

(assert (=> b!254653 m!383603))

(assert (=> b!253942 d!85648))

(declare-fun d!85650 () Bool)

(assert (=> d!85650 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 lt!393981)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21607 () Bool)

(assert (= bs!21607 d!85650))

(assert (=> bs!21607 m!382559))

(assert (=> b!254033 d!85650))

(declare-fun b!254654 () Bool)

(declare-fun e!176448 () tuple2!21782)

(declare-fun e!176445 () tuple2!21782)

(assert (=> b!254654 (= e!176448 e!176445)))

(declare-fun lt!395464 () tuple2!21782)

(assert (=> b!254654 (= lt!395464 (readBit!0 (_1!11813 lt!393990)))))

(declare-fun c!11757 () Bool)

(assert (=> b!254654 (= c!11757 (not (= (_1!11822 lt!395464) bit!26)))))

(declare-fun b!254655 () Bool)

(declare-fun lt!395461 () tuple2!21782)

(assert (=> b!254655 (= lt!395461 (checkBitsLoop!0 (_2!11822 lt!395464) nBits!297 bit!26 (bvadd from!289 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!395463 () Unit!18237)

(declare-fun lt!395460 () Unit!18237)

(assert (=> b!254655 (= lt!395463 lt!395460)))

(declare-fun lt!395467 () (_ BitVec 64))

(declare-fun lt!395466 () (_ BitVec 64))

(assert (=> b!254655 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11822 lt!395464)))) ((_ sign_extend 32) (currentByte!12003 (_2!11822 lt!395464))) ((_ sign_extend 32) (currentBit!11998 (_2!11822 lt!395464))) (bvsub lt!395467 lt!395466))))

(assert (=> b!254655 (= lt!395460 (validateOffsetBitsIneqLemma!0 (_1!11813 lt!393990) (_2!11822 lt!395464) lt!395467 lt!395466))))

(assert (=> b!254655 (= lt!395466 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!254655 (= lt!395467 (bvsub nBits!297 from!289))))

(assert (=> b!254655 (= e!176445 (tuple2!21783 (_1!11822 lt!395461) (_2!11822 lt!395461)))))

(declare-fun b!254656 () Bool)

(declare-fun e!176447 () Bool)

(assert (=> b!254656 (= e!176447 (= bit!26 (_2!11812 (readBitPure!0 (_1!11813 lt!393990)))))))

(declare-fun b!254657 () Bool)

(declare-fun e!176446 () Bool)

(declare-fun lt!395468 () (_ BitVec 64))

(declare-fun lt!395465 () tuple2!21782)

(assert (=> b!254657 (= e!176446 (= (bvsub lt!395468 from!289) (bitIndex!0 (size!6031 (buf!6539 (_2!11822 lt!395465))) (currentByte!12003 (_2!11822 lt!395465)) (currentBit!11998 (_2!11822 lt!395465)))))))

(assert (=> b!254657 (or (= (bvand lt!395468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395468 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395469 () (_ BitVec 64))

(assert (=> b!254657 (= lt!395468 (bvadd lt!395469 nBits!297))))

(assert (=> b!254657 (or (not (= (bvand lt!395469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395469 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!254657 (= lt!395469 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)) (currentBit!11998 (_1!11813 lt!393990))))))

(declare-fun b!254659 () Bool)

(declare-fun res!213374 () Bool)

(declare-fun e!176444 () Bool)

(assert (=> b!254659 (=> (not res!213374) (not e!176444))))

(assert (=> b!254659 (= res!213374 e!176446)))

(declare-fun res!213375 () Bool)

(assert (=> b!254659 (=> res!213375 e!176446)))

(assert (=> b!254659 (= res!213375 (not (_1!11822 lt!395465)))))

(declare-fun b!254660 () Bool)

(assert (=> b!254660 (= e!176445 (tuple2!21783 false (_2!11822 lt!395464)))))

(declare-fun b!254661 () Bool)

(declare-fun res!213377 () Bool)

(assert (=> b!254661 (=> (not res!213377) (not e!176444))))

(assert (=> b!254661 (= res!213377 (and (= (buf!6539 (_1!11813 lt!393990)) (buf!6539 (_2!11822 lt!395465))) (or (not (= nBits!297 from!289)) (_1!11822 lt!395465))))))

(declare-fun b!254662 () Bool)

(assert (=> b!254662 (= e!176448 (tuple2!21783 true (_1!11813 lt!393990)))))

(declare-fun b!254658 () Bool)

(assert (=> b!254658 (= e!176444 e!176447)))

(declare-fun res!213378 () Bool)

(assert (=> b!254658 (=> res!213378 e!176447)))

(assert (=> b!254658 (= res!213378 (or (not (_1!11822 lt!395465)) (bvsge from!289 nBits!297)))))

(declare-fun d!85652 () Bool)

(assert (=> d!85652 e!176444))

(declare-fun res!213376 () Bool)

(assert (=> d!85652 (=> (not res!213376) (not e!176444))))

(declare-fun lt!395459 () (_ BitVec 64))

(assert (=> d!85652 (= res!213376 (bvsge (bvsub lt!395459 from!289) (bitIndex!0 (size!6031 (buf!6539 (_2!11822 lt!395465))) (currentByte!12003 (_2!11822 lt!395465)) (currentBit!11998 (_2!11822 lt!395465)))))))

(assert (=> d!85652 (or (= (bvand lt!395459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!395459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!395459 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!395462 () (_ BitVec 64))

(assert (=> d!85652 (= lt!395459 (bvadd lt!395462 nBits!297))))

(assert (=> d!85652 (or (not (= (bvand lt!395462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395462 nBits!297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85652 (= lt!395462 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!393990))) (currentByte!12003 (_1!11813 lt!393990)) (currentBit!11998 (_1!11813 lt!393990))))))

(assert (=> d!85652 (= lt!395465 e!176448)))

(declare-fun c!11758 () Bool)

(assert (=> d!85652 (= c!11758 (= from!289 nBits!297))))

(assert (=> d!85652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!85652 (= (checkBitsLoop!0 (_1!11813 lt!393990) nBits!297 bit!26 from!289) lt!395465)))

(assert (= (and d!85652 c!11758) b!254662))

(assert (= (and d!85652 (not c!11758)) b!254654))

(assert (= (and b!254654 c!11757) b!254660))

(assert (= (and b!254654 (not c!11757)) b!254655))

(assert (= (and d!85652 res!213376) b!254661))

(assert (= (and b!254661 res!213377) b!254659))

(assert (= (and b!254659 (not res!213375)) b!254657))

(assert (= (and b!254659 res!213374) b!254658))

(assert (= (and b!254658 (not res!213378)) b!254656))

(assert (=> b!254656 m!381971))

(declare-fun m!383605 () Bool)

(assert (=> b!254655 m!383605))

(declare-fun m!383607 () Bool)

(assert (=> b!254655 m!383607))

(declare-fun m!383609 () Bool)

(assert (=> b!254655 m!383609))

(declare-fun m!383611 () Bool)

(assert (=> b!254657 m!383611))

(assert (=> b!254657 m!382325))

(assert (=> b!254654 m!382557))

(assert (=> d!85652 m!383611))

(assert (=> d!85652 m!382325))

(assert (=> d!85108 d!85652))

(declare-fun d!85654 () Bool)

(declare-fun e!176449 () Bool)

(assert (=> d!85654 e!176449))

(declare-fun res!213379 () Bool)

(assert (=> d!85654 (=> (not res!213379) (not e!176449))))

(declare-fun lt!395470 () BitStream!10984)

(declare-fun lt!395471 () (_ BitVec 64))

(assert (=> d!85654 (= res!213379 (= (bvadd lt!395471 (bvsub lt!394406 lt!394411)) (bitIndex!0 (size!6031 (buf!6539 lt!395470)) (currentByte!12003 lt!395470) (currentBit!11998 lt!395470))))))

(assert (=> d!85654 (or (not (= (bvand lt!395471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394406 lt!394411) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395471 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395471 (bvsub lt!394406 lt!394411)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85654 (= lt!395471 (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394417))) (currentByte!12003 (_2!11813 lt!394417)) (currentBit!11998 (_2!11813 lt!394417))))))

(assert (=> d!85654 (= lt!395470 (_2!11814 (moveBitIndex!0 (_2!11813 lt!394417) (bvsub lt!394406 lt!394411))))))

(assert (=> d!85654 (moveBitIndexPrecond!0 (_2!11813 lt!394417) (bvsub lt!394406 lt!394411))))

(assert (=> d!85654 (= (withMovedBitIndex!0 (_2!11813 lt!394417) (bvsub lt!394406 lt!394411)) lt!395470)))

(declare-fun b!254663 () Bool)

(assert (=> b!254663 (= e!176449 (= (size!6031 (buf!6539 (_2!11813 lt!394417))) (size!6031 (buf!6539 lt!395470))))))

(assert (= (and d!85654 res!213379) b!254663))

(declare-fun m!383613 () Bool)

(assert (=> d!85654 m!383613))

(assert (=> d!85654 m!383599))

(declare-fun m!383615 () Bool)

(assert (=> d!85654 m!383615))

(declare-fun m!383617 () Bool)

(assert (=> d!85654 m!383617))

(assert (=> b!253935 d!85654))

(assert (=> b!253935 d!85128))

(assert (=> b!253935 d!85130))

(declare-fun d!85656 () Bool)

(declare-fun e!176450 () Bool)

(assert (=> d!85656 e!176450))

(declare-fun res!213380 () Bool)

(assert (=> d!85656 (=> (not res!213380) (not e!176450))))

(declare-fun lt!395472 () BitStream!10984)

(declare-fun lt!395473 () (_ BitVec 64))

(assert (=> d!85656 (= res!213380 (= (bvadd lt!395473 (bvsub lt!394426 lt!394431)) (bitIndex!0 (size!6031 (buf!6539 lt!395472)) (currentByte!12003 lt!395472) (currentBit!11998 lt!395472))))))

(assert (=> d!85656 (or (not (= (bvand lt!395473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!394426 lt!394431) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!395473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!395473 (bvsub lt!394426 lt!394431)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!85656 (= lt!395473 (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394437))) (currentByte!12003 (_2!11813 lt!394437)) (currentBit!11998 (_2!11813 lt!394437))))))

(assert (=> d!85656 (= lt!395472 (_2!11814 (moveBitIndex!0 (_2!11813 lt!394437) (bvsub lt!394426 lt!394431))))))

(assert (=> d!85656 (moveBitIndexPrecond!0 (_2!11813 lt!394437) (bvsub lt!394426 lt!394431))))

(assert (=> d!85656 (= (withMovedBitIndex!0 (_2!11813 lt!394437) (bvsub lt!394426 lt!394431)) lt!395472)))

(declare-fun b!254664 () Bool)

(assert (=> b!254664 (= e!176450 (= (size!6031 (buf!6539 (_2!11813 lt!394437))) (size!6031 (buf!6539 lt!395472))))))

(assert (= (and d!85656 res!213380) b!254664))

(declare-fun m!383619 () Bool)

(assert (=> d!85656 m!383619))

(assert (=> d!85656 m!383483))

(declare-fun m!383621 () Bool)

(assert (=> d!85656 m!383621))

(declare-fun m!383623 () Bool)

(assert (=> d!85656 m!383623))

(assert (=> b!253940 d!85656))

(assert (=> b!253940 d!85128))

(assert (=> b!253940 d!85134))

(declare-fun d!85658 () Bool)

(declare-fun lt!395474 () tuple2!21782)

(assert (=> d!85658 (= lt!395474 (readBit!0 (readerFrom!0 (_2!11814 lt!394463) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))))

(assert (=> d!85658 (= (readBitPure!0 (readerFrom!0 (_2!11814 lt!394463) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))) (tuple2!21763 (_2!11822 lt!395474) (_1!11822 lt!395474)))))

(declare-fun bs!21608 () Bool)

(assert (= bs!21608 d!85658))

(assert (=> bs!21608 m!382433))

(declare-fun m!383625 () Bool)

(assert (=> bs!21608 m!383625))

(assert (=> b!253970 d!85658))

(declare-fun d!85660 () Bool)

(declare-fun e!176451 () Bool)

(assert (=> d!85660 e!176451))

(declare-fun res!213381 () Bool)

(assert (=> d!85660 (=> (not res!213381) (not e!176451))))

(assert (=> d!85660 (= res!213381 (invariant!0 (currentBit!11998 (_2!11814 lt!394463)) (currentByte!12003 (_2!11814 lt!394463)) (size!6031 (buf!6539 (_2!11814 lt!394463)))))))

(assert (=> d!85660 (= (readerFrom!0 (_2!11814 lt!394463) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005)) (BitStream!10985 (buf!6539 (_2!11814 lt!394463)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)))))

(declare-fun b!254665 () Bool)

(assert (=> b!254665 (= e!176451 (invariant!0 (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005) (size!6031 (buf!6539 (_2!11814 lt!394463)))))))

(assert (= (and d!85660 res!213381) b!254665))

(assert (=> d!85660 m!383443))

(declare-fun m!383627 () Bool)

(assert (=> b!254665 m!383627))

(assert (=> b!253970 d!85660))

(assert (=> d!85142 d!85626))

(declare-fun b!254677 () Bool)

(declare-fun e!176461 () Bool)

(declare-fun e!176462 () Bool)

(assert (=> b!254677 (= e!176461 e!176462)))

(declare-fun res!213393 () Bool)

(assert (=> b!254677 (=> (not res!213393) (not e!176462))))

(declare-fun lt!395477 () tuple2!21762)

(declare-fun _$19!204 () tuple2!21766)

(assert (=> b!254677 (= res!213393 (and (= (_2!11812 lt!395477) bit!26) (= (_1!11812 lt!395477) (_2!11814 _$19!204))))))

(assert (=> b!254677 (= lt!395477 (readBitPure!0 (readerFrom!0 (_2!11814 _$19!204) (currentBit!11998 thiss!1005) (currentByte!12003 thiss!1005))))))

(declare-fun b!254678 () Bool)

(declare-fun res!213392 () Bool)

(assert (=> b!254678 (=> (not res!213392) (not e!176461))))

(assert (=> b!254678 (= res!213392 (isPrefixOf!0 thiss!1005 (_2!11814 _$19!204)))))

(declare-fun b!254680 () Bool)

(declare-fun e!176460 () Bool)

(assert (=> b!254680 (= e!176460 (array_inv!5772 (buf!6539 (_2!11814 _$19!204))))))

(declare-fun b!254681 () Bool)

(declare-fun res!213391 () Bool)

(assert (=> b!254681 (=> (not res!213391) (not e!176461))))

(assert (=> b!254681 (= res!213391 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 _$19!204))) (currentByte!12003 (_2!11814 _$19!204)) (currentBit!11998 (_2!11814 _$19!204))) (bvadd (bitIndex!0 (size!6031 (buf!6539 thiss!1005)) (currentByte!12003 thiss!1005) (currentBit!11998 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!85662 () Bool)

(assert (=> d!85662 e!176461))

(declare-fun res!213390 () Bool)

(assert (=> d!85662 (=> (not res!213390) (not e!176461))))

(assert (=> d!85662 (= res!213390 (= (size!6031 (buf!6539 thiss!1005)) (size!6031 (buf!6539 (_2!11814 _$19!204)))))))

(assert (=> d!85662 (and (inv!12 (_2!11814 _$19!204)) e!176460)))

(assert (=> d!85662 (= (choose!16 thiss!1005 bit!26) _$19!204)))

(declare-fun b!254679 () Bool)

(assert (=> b!254679 (= e!176462 (= (bitIndex!0 (size!6031 (buf!6539 (_1!11812 lt!395477))) (currentByte!12003 (_1!11812 lt!395477)) (currentBit!11998 (_1!11812 lt!395477))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 _$19!204))) (currentByte!12003 (_2!11814 _$19!204)) (currentBit!11998 (_2!11814 _$19!204)))))))

(assert (= d!85662 b!254680))

(assert (= (and d!85662 res!213390) b!254681))

(assert (= (and b!254681 res!213391) b!254678))

(assert (= (and b!254678 res!213392) b!254677))

(assert (= (and b!254677 res!213393) b!254679))

(declare-fun m!383629 () Bool)

(assert (=> b!254681 m!383629))

(assert (=> b!254681 m!382001))

(declare-fun m!383631 () Bool)

(assert (=> d!85662 m!383631))

(declare-fun m!383633 () Bool)

(assert (=> b!254677 m!383633))

(assert (=> b!254677 m!383633))

(declare-fun m!383635 () Bool)

(assert (=> b!254677 m!383635))

(declare-fun m!383637 () Bool)

(assert (=> b!254680 m!383637))

(declare-fun m!383639 () Bool)

(assert (=> b!254678 m!383639))

(declare-fun m!383641 () Bool)

(assert (=> b!254679 m!383641))

(assert (=> b!254679 m!383629))

(assert (=> d!85082 d!85662))

(declare-fun d!85664 () Bool)

(assert (=> d!85664 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 thiss!1005))) ((_ sign_extend 32) (currentByte!12003 thiss!1005)) ((_ sign_extend 32) (currentBit!11998 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21609 () Bool)

(assert (= bs!21609 d!85664))

(assert (=> bs!21609 m!382565))

(assert (=> d!85082 d!85664))

(assert (=> b!253968 d!85574))

(assert (=> b!253968 d!85134))

(declare-fun d!85666 () Bool)

(assert (=> d!85666 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393987)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393987))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393987)))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393987)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393987))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393987))))))))

(assert (=> d!85094 d!85666))

(declare-fun d!85668 () Bool)

(assert (=> d!85668 (= (invariant!0 (currentBit!11998 (_1!11812 lt!393987)) (currentByte!12003 (_1!11812 lt!393987)) (size!6031 (buf!6539 (_1!11812 lt!393987)))) (and (bvsge (currentBit!11998 (_1!11812 lt!393987)) #b00000000000000000000000000000000) (bvslt (currentBit!11998 (_1!11812 lt!393987)) #b00000000000000000000000000001000) (bvsge (currentByte!12003 (_1!11812 lt!393987)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 (_1!11812 lt!393987)) (size!6031 (buf!6539 (_1!11812 lt!393987)))) (and (= (currentBit!11998 (_1!11812 lt!393987)) #b00000000000000000000000000000000) (= (currentByte!12003 (_1!11812 lt!393987)) (size!6031 (buf!6539 (_1!11812 lt!393987))))))))))

(assert (=> d!85094 d!85668))

(declare-fun d!85670 () Bool)

(assert (=> d!85670 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393996)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393996))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393996)))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393996)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393996))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393996))))))))

(assert (=> d!85148 d!85670))

(declare-fun d!85672 () Bool)

(assert (=> d!85672 (= (invariant!0 (currentBit!11998 (_1!11812 lt!393996)) (currentByte!12003 (_1!11812 lt!393996)) (size!6031 (buf!6539 (_1!11812 lt!393996)))) (and (bvsge (currentBit!11998 (_1!11812 lt!393996)) #b00000000000000000000000000000000) (bvslt (currentBit!11998 (_1!11812 lt!393996)) #b00000000000000000000000000001000) (bvsge (currentByte!12003 (_1!11812 lt!393996)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 (_1!11812 lt!393996)) (size!6031 (buf!6539 (_1!11812 lt!393996)))) (and (= (currentBit!11998 (_1!11812 lt!393996)) #b00000000000000000000000000000000) (= (currentByte!12003 (_1!11812 lt!393996)) (size!6031 (buf!6539 (_1!11812 lt!393996))))))))))

(assert (=> d!85148 d!85672))

(declare-fun d!85674 () Bool)

(assert (=> d!85674 (= (remainingBits!0 ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393978)))) ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393978))) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393978)))) (bvsub (bvmul ((_ sign_extend 32) (size!6031 (buf!6539 (_1!11812 lt!393978)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12003 (_1!11812 lt!393978))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11998 (_1!11812 lt!393978))))))))

(assert (=> d!85092 d!85674))

(declare-fun d!85676 () Bool)

(assert (=> d!85676 (= (invariant!0 (currentBit!11998 (_1!11812 lt!393978)) (currentByte!12003 (_1!11812 lt!393978)) (size!6031 (buf!6539 (_1!11812 lt!393978)))) (and (bvsge (currentBit!11998 (_1!11812 lt!393978)) #b00000000000000000000000000000000) (bvslt (currentBit!11998 (_1!11812 lt!393978)) #b00000000000000000000000000001000) (bvsge (currentByte!12003 (_1!11812 lt!393978)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12003 (_1!11812 lt!393978)) (size!6031 (buf!6539 (_1!11812 lt!393978)))) (and (= (currentBit!11998 (_1!11812 lt!393978)) #b00000000000000000000000000000000) (= (currentByte!12003 (_1!11812 lt!393978)) (size!6031 (buf!6539 (_1!11812 lt!393978))))))))))

(assert (=> d!85092 d!85676))

(assert (=> d!85066 d!85598))

(declare-fun d!85678 () Bool)

(declare-fun res!213395 () Bool)

(declare-fun e!176464 () Bool)

(assert (=> d!85678 (=> (not res!213395) (not e!176464))))

(assert (=> d!85678 (= res!213395 (= (size!6031 (buf!6539 (_1!11813 lt!394417))) (size!6031 (buf!6539 (_2!11813 lt!394417)))))))

(assert (=> d!85678 (= (isPrefixOf!0 (_1!11813 lt!394417) (_2!11813 lt!394417)) e!176464)))

(declare-fun b!254682 () Bool)

(declare-fun res!213394 () Bool)

(assert (=> b!254682 (=> (not res!213394) (not e!176464))))

(assert (=> b!254682 (= res!213394 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394417))) (currentByte!12003 (_1!11813 lt!394417)) (currentBit!11998 (_1!11813 lt!394417))) (bitIndex!0 (size!6031 (buf!6539 (_2!11813 lt!394417))) (currentByte!12003 (_2!11813 lt!394417)) (currentBit!11998 (_2!11813 lt!394417)))))))

(declare-fun b!254683 () Bool)

(declare-fun e!176465 () Bool)

(assert (=> b!254683 (= e!176464 e!176465)))

(declare-fun res!213396 () Bool)

(assert (=> b!254683 (=> res!213396 e!176465)))

(assert (=> b!254683 (= res!213396 (= (size!6031 (buf!6539 (_1!11813 lt!394417))) #b00000000000000000000000000000000))))

(declare-fun b!254684 () Bool)

(assert (=> b!254684 (= e!176465 (arrayBitRangesEq!0 (buf!6539 (_1!11813 lt!394417)) (buf!6539 (_2!11813 lt!394417)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_1!11813 lt!394417))) (currentByte!12003 (_1!11813 lt!394417)) (currentBit!11998 (_1!11813 lt!394417)))))))

(assert (= (and d!85678 res!213395) b!254682))

(assert (= (and b!254682 res!213394) b!254683))

(assert (= (and b!254683 (not res!213396)) b!254684))

(assert (=> b!254682 m!383429))

(assert (=> b!254682 m!383599))

(assert (=> b!254684 m!383429))

(assert (=> b!254684 m!383429))

(declare-fun m!383643 () Bool)

(assert (=> b!254684 m!383643))

(assert (=> d!85066 d!85678))

(declare-fun d!85680 () Bool)

(assert (=> d!85680 (isPrefixOf!0 lt!394412 (_2!11814 lt!393993))))

(declare-fun lt!395478 () Unit!18237)

(assert (=> d!85680 (= lt!395478 (choose!30 lt!394412 (_2!11814 lt!393981) (_2!11814 lt!393993)))))

(assert (=> d!85680 (isPrefixOf!0 lt!394412 (_2!11814 lt!393981))))

(assert (=> d!85680 (= (lemmaIsPrefixTransitive!0 lt!394412 (_2!11814 lt!393981) (_2!11814 lt!393993)) lt!395478)))

(declare-fun bs!21610 () Bool)

(assert (= bs!21610 d!85680))

(assert (=> bs!21610 m!382373))

(declare-fun m!383645 () Bool)

(assert (=> bs!21610 m!383645))

(declare-fun m!383647 () Bool)

(assert (=> bs!21610 m!383647))

(assert (=> d!85066 d!85680))

(declare-fun d!85682 () Bool)

(declare-fun res!213398 () Bool)

(declare-fun e!176466 () Bool)

(assert (=> d!85682 (=> (not res!213398) (not e!176466))))

(assert (=> d!85682 (= res!213398 (= (size!6031 (buf!6539 lt!394412)) (size!6031 (buf!6539 (_2!11814 lt!393993)))))))

(assert (=> d!85682 (= (isPrefixOf!0 lt!394412 (_2!11814 lt!393993)) e!176466)))

(declare-fun b!254685 () Bool)

(declare-fun res!213397 () Bool)

(assert (=> b!254685 (=> (not res!213397) (not e!176466))))

(assert (=> b!254685 (= res!213397 (bvsle (bitIndex!0 (size!6031 (buf!6539 lt!394412)) (currentByte!12003 lt!394412) (currentBit!11998 lt!394412)) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393993))) (currentByte!12003 (_2!11814 lt!393993)) (currentBit!11998 (_2!11814 lt!393993)))))))

(declare-fun b!254686 () Bool)

(declare-fun e!176467 () Bool)

(assert (=> b!254686 (= e!176466 e!176467)))

(declare-fun res!213399 () Bool)

(assert (=> b!254686 (=> res!213399 e!176467)))

(assert (=> b!254686 (= res!213399 (= (size!6031 (buf!6539 lt!394412)) #b00000000000000000000000000000000))))

(declare-fun b!254687 () Bool)

(assert (=> b!254687 (= e!176467 (arrayBitRangesEq!0 (buf!6539 lt!394412) (buf!6539 (_2!11814 lt!393993)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 lt!394412)) (currentByte!12003 lt!394412) (currentBit!11998 lt!394412))))))

(assert (= (and d!85682 res!213398) b!254685))

(assert (= (and b!254685 res!213397) b!254686))

(assert (= (and b!254686 (not res!213399)) b!254687))

(declare-fun m!383649 () Bool)

(assert (=> b!254685 m!383649))

(assert (=> b!254685 m!382005))

(assert (=> b!254687 m!383649))

(assert (=> b!254687 m!383649))

(declare-fun m!383651 () Bool)

(assert (=> b!254687 m!383651))

(assert (=> d!85066 d!85682))

(declare-fun d!85684 () Bool)

(assert (=> d!85684 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!393981))))

(declare-fun lt!395479 () Unit!18237)

(assert (=> d!85684 (= lt!395479 (choose!11 (_2!11814 lt!393981)))))

(assert (=> d!85684 (= (lemmaIsPrefixRefl!0 (_2!11814 lt!393981)) lt!395479)))

(declare-fun bs!21611 () Bool)

(assert (= bs!21611 d!85684))

(assert (=> bs!21611 m!382361))

(declare-fun m!383653 () Bool)

(assert (=> bs!21611 m!383653))

(assert (=> d!85066 d!85684))

(declare-fun d!85686 () Bool)

(assert (=> d!85686 (isPrefixOf!0 lt!394412 (_2!11814 lt!393993))))

(declare-fun lt!395480 () Unit!18237)

(assert (=> d!85686 (= lt!395480 (choose!30 lt!394412 (_2!11814 lt!393993) (_2!11814 lt!393993)))))

(assert (=> d!85686 (isPrefixOf!0 lt!394412 (_2!11814 lt!393993))))

(assert (=> d!85686 (= (lemmaIsPrefixTransitive!0 lt!394412 (_2!11814 lt!393993) (_2!11814 lt!393993)) lt!395480)))

(declare-fun bs!21612 () Bool)

(assert (= bs!21612 d!85686))

(assert (=> bs!21612 m!382373))

(declare-fun m!383655 () Bool)

(assert (=> bs!21612 m!383655))

(assert (=> bs!21612 m!382373))

(assert (=> d!85066 d!85686))

(declare-fun d!85688 () Bool)

(assert (=> d!85688 (isPrefixOf!0 lt!394412 lt!394412)))

(declare-fun lt!395481 () Unit!18237)

(assert (=> d!85688 (= lt!395481 (choose!11 lt!394412))))

(assert (=> d!85688 (= (lemmaIsPrefixRefl!0 lt!394412) lt!395481)))

(declare-fun bs!21613 () Bool)

(assert (= bs!21613 d!85688))

(assert (=> bs!21613 m!382375))

(declare-fun m!383657 () Bool)

(assert (=> bs!21613 m!383657))

(assert (=> d!85066 d!85688))

(assert (=> d!85066 d!85610))

(assert (=> d!85066 d!85056))

(declare-fun d!85690 () Bool)

(declare-fun res!213401 () Bool)

(declare-fun e!176468 () Bool)

(assert (=> d!85690 (=> (not res!213401) (not e!176468))))

(assert (=> d!85690 (= res!213401 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) (size!6031 (buf!6539 (_2!11814 lt!393981)))))))

(assert (=> d!85690 (= (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 lt!393981)) e!176468)))

(declare-fun b!254688 () Bool)

(declare-fun res!213400 () Bool)

(assert (=> b!254688 (=> (not res!213400) (not e!176468))))

(assert (=> b!254688 (= res!213400 (bvsle (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))) (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(declare-fun b!254689 () Bool)

(declare-fun e!176469 () Bool)

(assert (=> b!254689 (= e!176468 e!176469)))

(declare-fun res!213402 () Bool)

(assert (=> b!254689 (=> res!213402 e!176469)))

(assert (=> b!254689 (= res!213402 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) #b00000000000000000000000000000000))))

(declare-fun b!254690 () Bool)

(assert (=> b!254690 (= e!176469 (arrayBitRangesEq!0 (buf!6539 (_2!11814 lt!393981)) (buf!6539 (_2!11814 lt!393981)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981)))))))

(assert (= (and d!85690 res!213401) b!254688))

(assert (= (and b!254688 res!213400) b!254689))

(assert (= (and b!254689 (not res!213402)) b!254690))

(assert (=> b!254688 m!381999))

(assert (=> b!254688 m!381999))

(assert (=> b!254690 m!381999))

(assert (=> b!254690 m!381999))

(declare-fun m!383659 () Bool)

(assert (=> b!254690 m!383659))

(assert (=> d!85066 d!85690))

(declare-fun d!85692 () Bool)

(declare-fun res!213404 () Bool)

(declare-fun e!176470 () Bool)

(assert (=> d!85692 (=> (not res!213404) (not e!176470))))

(assert (=> d!85692 (= res!213404 (= (size!6031 (buf!6539 lt!394412)) (size!6031 (buf!6539 lt!394412))))))

(assert (=> d!85692 (= (isPrefixOf!0 lt!394412 lt!394412) e!176470)))

(declare-fun b!254691 () Bool)

(declare-fun res!213403 () Bool)

(assert (=> b!254691 (=> (not res!213403) (not e!176470))))

(assert (=> b!254691 (= res!213403 (bvsle (bitIndex!0 (size!6031 (buf!6539 lt!394412)) (currentByte!12003 lt!394412) (currentBit!11998 lt!394412)) (bitIndex!0 (size!6031 (buf!6539 lt!394412)) (currentByte!12003 lt!394412) (currentBit!11998 lt!394412))))))

(declare-fun b!254692 () Bool)

(declare-fun e!176471 () Bool)

(assert (=> b!254692 (= e!176470 e!176471)))

(declare-fun res!213405 () Bool)

(assert (=> b!254692 (=> res!213405 e!176471)))

(assert (=> b!254692 (= res!213405 (= (size!6031 (buf!6539 lt!394412)) #b00000000000000000000000000000000))))

(declare-fun b!254693 () Bool)

(assert (=> b!254693 (= e!176471 (arrayBitRangesEq!0 (buf!6539 lt!394412) (buf!6539 lt!394412) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6031 (buf!6539 lt!394412)) (currentByte!12003 lt!394412) (currentBit!11998 lt!394412))))))

(assert (= (and d!85692 res!213404) b!254691))

(assert (= (and b!254691 res!213403) b!254692))

(assert (= (and b!254692 (not res!213405)) b!254693))

(assert (=> b!254691 m!383649))

(assert (=> b!254691 m!383649))

(assert (=> b!254693 m!383649))

(assert (=> b!254693 m!383649))

(declare-fun m!383661 () Bool)

(assert (=> b!254693 m!383661))

(assert (=> d!85066 d!85692))

(declare-fun b!254705 () Bool)

(declare-fun e!176478 () Bool)

(declare-fun lt!395493 () tuple2!21762)

(declare-fun lt!395494 () tuple2!21764)

(assert (=> b!254705 (= e!176478 (and (_2!11812 lt!395493) (= (_1!11812 lt!395493) (_2!11813 lt!395494))))))

(assert (=> b!254705 (= lt!395493 (checkBitsLoopPure!0 (_1!11813 lt!395494) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!395492 () Unit!18237)

(declare-fun lt!395496 () Unit!18237)

(assert (=> b!254705 (= lt!395492 lt!395496)))

(declare-fun _$23!48 () tuple2!21766)

(declare-fun lt!395495 () (_ BitVec 64))

(assert (=> b!254705 (validate_offset_bits!1 ((_ sign_extend 32) (size!6031 (buf!6539 (_2!11814 _$23!48)))) ((_ sign_extend 32) (currentByte!12003 (_2!11814 lt!393981))) ((_ sign_extend 32) (currentBit!11998 (_2!11814 lt!393981))) lt!395495)))

(assert (=> b!254705 (= lt!395496 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11814 lt!393981) (buf!6539 (_2!11814 _$23!48)) lt!395495))))

(assert (=> b!254705 (= lt!395495 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!254705 (= lt!395494 (reader!0 (_2!11814 lt!393981) (_2!11814 _$23!48)))))

(declare-fun b!254703 () Bool)

(declare-fun res!213414 () Bool)

(assert (=> b!254703 (=> (not res!213414) (not e!176478))))

(assert (=> b!254703 (= res!213414 (= (bitIndex!0 (size!6031 (buf!6539 (_2!11814 _$23!48))) (currentByte!12003 (_2!11814 _$23!48)) (currentBit!11998 (_2!11814 _$23!48))) (bvadd (bitIndex!0 (size!6031 (buf!6539 (_2!11814 lt!393981))) (currentByte!12003 (_2!11814 lt!393981)) (currentBit!11998 (_2!11814 lt!393981))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))))

(declare-fun d!85694 () Bool)

(assert (=> d!85694 e!176478))

(declare-fun res!213412 () Bool)

(assert (=> d!85694 (=> (not res!213412) (not e!176478))))

(assert (=> d!85694 (= res!213412 (= (size!6031 (buf!6539 (_2!11814 lt!393981))) (size!6031 (buf!6539 (_2!11814 _$23!48)))))))

(declare-fun e!176480 () Bool)

(assert (=> d!85694 (and (inv!12 (_2!11814 _$23!48)) e!176480)))

(assert (=> d!85694 (= (choose!51 (_2!11814 lt!393981) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) _$23!48)))

(declare-fun b!254702 () Bool)

(assert (=> b!254702 (= e!176480 (array_inv!5772 (buf!6539 (_2!11814 _$23!48))))))

(declare-fun b!254704 () Bool)

(declare-fun res!213413 () Bool)

(assert (=> b!254704 (=> (not res!213413) (not e!176478))))

(assert (=> b!254704 (= res!213413 (isPrefixOf!0 (_2!11814 lt!393981) (_2!11814 _$23!48)))))

(assert (= d!85694 b!254702))

(assert (= (and d!85694 res!213412) b!254703))

(assert (= (and b!254703 res!213414) b!254704))

(assert (= (and b!254704 res!213413) b!254705))

(declare-fun m!383663 () Bool)

(assert (=> b!254703 m!383663))

(assert (=> b!254703 m!381999))

(declare-fun m!383665 () Bool)

(assert (=> b!254704 m!383665))

(declare-fun m!383667 () Bool)

(assert (=> b!254705 m!383667))

(declare-fun m!383669 () Bool)

(assert (=> b!254705 m!383669))

(declare-fun m!383671 () Bool)

(assert (=> b!254705 m!383671))

(declare-fun m!383673 () Bool)

(assert (=> b!254705 m!383673))

(declare-fun m!383675 () Bool)

(assert (=> b!254702 m!383675))

(declare-fun m!383677 () Bool)

(assert (=> d!85694 m!383677))

(assert (=> d!85096 d!85694))

(push 1)

(assert (not b!254680))

(assert (not b!254636))

(assert (not d!85684))

(assert (not d!85604))

(assert (not b!254632))

(assert (not d!85650))

(assert (not b!254609))

(assert (not bm!4004))

(assert (not b!254648))

(assert (not d!85642))

(assert (not b!254637))

(assert (not d!85578))

(assert (not d!85558))

(assert (not d!85640))

(assert (not b!254641))

(assert (not d!85632))

(assert (not d!85636))

(assert (not d!85614))

(assert (not d!85618))

(assert (not b!254587))

(assert (not bm!4003))

(assert (not b!254691))

(assert (not d!85570))

(assert (not b!254653))

(assert (not b!254679))

(assert (not b!254580))

(assert (not d!85660))

(assert (not b!254705))

(assert (not d!85638))

(assert (not b!254657))

(assert (not d!85664))

(assert (not d!85564))

(assert (not d!85654))

(assert (not b!254575))

(assert (not b!254645))

(assert (not d!85574))

(assert (not d!85652))

(assert (not b!254651))

(assert (not b!254602))

(assert (not b!254656))

(assert (not b!254545))

(assert (not b!254619))

(assert (not d!85628))

(assert (not d!85656))

(assert (not b!254601))

(assert (not b!254693))

(assert (not b!254605))

(assert (not b!254551))

(assert (not b!254577))

(assert (not b!254642))

(assert (not b!254665))

(assert (not d!85572))

(assert (not bm!4005))

(assert (not b!254585))

(assert (not d!85616))

(assert (not b!254613))

(assert (not b!254615))

(assert (not b!254703))

(assert (not b!254516))

(assert (not b!254702))

(assert (not b!254616))

(assert (not bm!4001))

(assert (not b!254518))

(assert (not d!85544))

(assert (not b!254681))

(assert (not d!85606))

(assert (not b!254622))

(assert (not d!85546))

(assert (not d!85644))

(assert (not d!85624))

(assert (not d!85612))

(assert (not d!85532))

(assert (not b!254704))

(assert (not b!254690))

(assert (not b!254552))

(assert (not d!85598))

(assert (not b!254569))

(assert (not b!254519))

(assert (not d!85540))

(assert (not d!85686))

(assert (not b!254684))

(assert (not b!254677))

(assert (not d!85538))

(assert (not b!254542))

(assert (not b!254567))

(assert (not b!254687))

(assert (not d!85688))

(assert (not b!254655))

(assert (not bm!4002))

(assert (not b!254562))

(assert (not b!254644))

(assert (not d!85582))

(assert (not b!254546))

(assert (not b!254563))

(assert (not b!254624))

(assert (not b!254610))

(assert (not d!85560))

(assert (not d!85554))

(assert (not d!85662))

(assert (not d!85594))

(assert (not b!254578))

(assert (not b!254559))

(assert (not d!85634))

(assert (not b!254688))

(assert (not b!254618))

(assert (not b!254612))

(assert (not b!254566))

(assert (not b!254685))

(assert (not b!254596))

(assert (not b!254555))

(assert (not b!254643))

(assert (not d!85680))

(assert (not b!254606))

(assert (not d!85658))

(assert (not b!254556))

(assert (not d!85580))

(assert (not b!254568))

(assert (not d!85622))

(assert (not b!254678))

(assert (not b!254517))

(assert (not b!254549))

(assert (not d!85694))

(assert (not b!254682))

(assert (not b!254650))

(assert (not b!254654))

(assert (not b!254527))

(assert (not b!254633))

(assert (not b!254621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

