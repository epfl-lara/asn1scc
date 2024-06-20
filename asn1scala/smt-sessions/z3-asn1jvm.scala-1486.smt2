; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41134 () Bool)

(assert start!41134)

(declare-fun b!190878 () Bool)

(declare-fun res!159267 () Bool)

(declare-fun e!131656 () Bool)

(assert (=> b!190878 (=> res!159267 e!131656)))

(declare-datatypes ((array!9919 0))(
  ( (array!9920 (arr!5303 (Array (_ BitVec 32) (_ BitVec 8))) (size!4373 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7854 0))(
  ( (BitStream!7855 (buf!4850 array!9919) (currentByte!9128 (_ BitVec 32)) (currentBit!9123 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7854)

(declare-datatypes ((Unit!13584 0))(
  ( (Unit!13585) )
))
(declare-datatypes ((tuple2!16504 0))(
  ( (tuple2!16505 (_1!8897 Unit!13584) (_2!8897 BitStream!7854)) )
))
(declare-fun lt!296639 () tuple2!16504)

(declare-fun isPrefixOf!0 (BitStream!7854 BitStream!7854) Bool)

(assert (=> b!190878 (= res!159267 (not (isPrefixOf!0 thiss!1204 (_2!8897 lt!296639))))))

(declare-fun b!190879 () Bool)

(declare-fun e!131663 () Bool)

(assert (=> b!190879 (= e!131656 e!131663)))

(declare-fun res!159269 () Bool)

(assert (=> b!190879 (=> res!159269 e!131663)))

(declare-datatypes ((tuple2!16506 0))(
  ( (tuple2!16507 (_1!8898 BitStream!7854) (_2!8898 (_ BitVec 64))) )
))
(declare-fun lt!296645 () tuple2!16506)

(declare-datatypes ((tuple2!16508 0))(
  ( (tuple2!16509 (_1!8899 BitStream!7854) (_2!8899 BitStream!7854)) )
))
(declare-fun lt!296632 () tuple2!16508)

(assert (=> b!190879 (= res!159269 (not (= (_1!8898 lt!296645) (_2!8899 lt!296632))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!296643 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16506)

(assert (=> b!190879 (= lt!296645 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!296632) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296643))))

(declare-fun lt!296619 () tuple2!16504)

(declare-fun lt!296641 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190879 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639))) lt!296641)))

(declare-fun lt!296623 () Unit!13584)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7854 array!9919 (_ BitVec 64)) Unit!13584)

(assert (=> b!190879 (= lt!296623 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8897 lt!296639) (buf!4850 (_2!8897 lt!296619)) lt!296641))))

(assert (=> b!190879 (= lt!296641 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!296628 () (_ BitVec 64))

(declare-datatypes ((tuple2!16510 0))(
  ( (tuple2!16511 (_1!8900 BitStream!7854) (_2!8900 Bool)) )
))
(declare-fun lt!296626 () tuple2!16510)

(declare-fun lt!296622 () (_ BitVec 64))

(assert (=> b!190879 (= lt!296643 (bvor lt!296622 (ite (_2!8900 lt!296626) lt!296628 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!296631 () tuple2!16508)

(declare-fun lt!296625 () tuple2!16506)

(assert (=> b!190879 (= lt!296625 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!296631) nBits!348 i!590 lt!296622))))

(declare-fun lt!296630 () (_ BitVec 64))

(assert (=> b!190879 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204)) lt!296630)))

(declare-fun lt!296636 () Unit!13584)

(assert (=> b!190879 (= lt!296636 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4850 (_2!8897 lt!296619)) lt!296630))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190879 (= lt!296622 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!296624 () Bool)

(assert (=> b!190879 (= (_2!8900 lt!296626) lt!296624)))

(declare-fun readBitPure!0 (BitStream!7854) tuple2!16510)

(assert (=> b!190879 (= lt!296626 (readBitPure!0 (_1!8899 lt!296631)))))

(declare-fun reader!0 (BitStream!7854 BitStream!7854) tuple2!16508)

(assert (=> b!190879 (= lt!296632 (reader!0 (_2!8897 lt!296639) (_2!8897 lt!296619)))))

(assert (=> b!190879 (= lt!296631 (reader!0 thiss!1204 (_2!8897 lt!296619)))))

(declare-fun e!131665 () Bool)

(assert (=> b!190879 e!131665))

(declare-fun res!159270 () Bool)

(assert (=> b!190879 (=> (not res!159270) (not e!131665))))

(declare-fun lt!296620 () tuple2!16510)

(declare-fun lt!296642 () tuple2!16510)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190879 (= res!159270 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296620))) (currentByte!9128 (_1!8900 lt!296620)) (currentBit!9123 (_1!8900 lt!296620))) (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296642))) (currentByte!9128 (_1!8900 lt!296642)) (currentBit!9123 (_1!8900 lt!296642)))))))

(declare-fun lt!296633 () Unit!13584)

(declare-fun lt!296646 () BitStream!7854)

(declare-fun readBitPrefixLemma!0 (BitStream!7854 BitStream!7854) Unit!13584)

(assert (=> b!190879 (= lt!296633 (readBitPrefixLemma!0 lt!296646 (_2!8897 lt!296619)))))

(assert (=> b!190879 (= lt!296642 (readBitPure!0 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204))))))

(assert (=> b!190879 (= lt!296620 (readBitPure!0 lt!296646))))

(declare-fun e!131660 () Bool)

(assert (=> b!190879 e!131660))

(declare-fun res!159261 () Bool)

(assert (=> b!190879 (=> (not res!159261) (not e!131660))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190879 (= res!159261 (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296639)))))))

(assert (=> b!190879 (= lt!296646 (BitStream!7855 (buf!4850 (_2!8897 lt!296639)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(declare-fun b!190880 () Bool)

(declare-fun e!131657 () Bool)

(declare-fun lt!296644 () tuple2!16510)

(declare-fun lt!296638 () (_ BitVec 64))

(assert (=> b!190880 (= e!131657 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296644))) (currentByte!9128 (_1!8900 lt!296644)) (currentBit!9123 (_1!8900 lt!296644))) lt!296638))))

(declare-fun b!190881 () Bool)

(assert (=> b!190881 (= e!131660 (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296619)))))))

(declare-fun b!190882 () Bool)

(declare-fun res!159281 () Bool)

(assert (=> b!190882 (=> res!159281 e!131656)))

(declare-fun lt!296629 () (_ BitVec 64))

(declare-fun lt!296637 () (_ BitVec 64))

(assert (=> b!190882 (= res!159281 (or (not (= (size!4373 (buf!4850 (_2!8897 lt!296619))) (size!4373 (buf!4850 thiss!1204)))) (not (= lt!296629 (bvsub (bvadd lt!296637 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!190883 () Bool)

(declare-fun e!131658 () Bool)

(declare-fun array_inv!4114 (array!9919) Bool)

(assert (=> b!190883 (= e!131658 (array_inv!4114 (buf!4850 thiss!1204)))))

(declare-fun b!190884 () Bool)

(declare-fun res!159271 () Bool)

(declare-fun e!131669 () Bool)

(assert (=> b!190884 (=> res!159271 e!131669)))

(assert (=> b!190884 (= res!159271 (not (= (bitIndex!0 (size!4373 (buf!4850 (_1!8898 lt!296625))) (currentByte!9128 (_1!8898 lt!296625)) (currentBit!9123 (_1!8898 lt!296625))) (bitIndex!0 (size!4373 (buf!4850 (_2!8899 lt!296631))) (currentByte!9128 (_2!8899 lt!296631)) (currentBit!9123 (_2!8899 lt!296631))))))))

(declare-fun res!159273 () Bool)

(declare-fun e!131667 () Bool)

(assert (=> start!41134 (=> (not res!159273) (not e!131667))))

(assert (=> start!41134 (= res!159273 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41134 e!131667))

(assert (=> start!41134 true))

(declare-fun inv!12 (BitStream!7854) Bool)

(assert (=> start!41134 (and (inv!12 thiss!1204) e!131658)))

(declare-fun b!190885 () Bool)

(declare-fun e!131666 () Bool)

(assert (=> b!190885 (= e!131669 e!131666)))

(declare-fun res!159282 () Bool)

(assert (=> b!190885 (=> res!159282 e!131666)))

(assert (=> b!190885 (= res!159282 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8899 lt!296631)))) ((_ sign_extend 32) (currentByte!9128 (_1!8899 lt!296631))) ((_ sign_extend 32) (currentBit!9123 (_1!8899 lt!296631))) lt!296630)))))

(assert (=> b!190885 (= (size!4373 (buf!4850 thiss!1204)) (size!4373 (buf!4850 (_2!8897 lt!296619))))))

(declare-fun b!190886 () Bool)

(declare-fun lt!296621 () (_ BitVec 64))

(declare-fun e!131655 () Bool)

(declare-fun lt!296634 () BitStream!7854)

(assert (=> b!190886 (= e!131655 (and (= lt!296637 (bvsub lt!296621 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8899 lt!296632) lt!296634)) (= (_2!8898 lt!296625) (_2!8898 lt!296645)))))))

(declare-fun b!190887 () Bool)

(assert (=> b!190887 (= e!131663 e!131669)))

(declare-fun res!159268 () Bool)

(assert (=> b!190887 (=> res!159268 e!131669)))

(assert (=> b!190887 (= res!159268 (not (= (_1!8899 lt!296632) lt!296634)))))

(assert (=> b!190887 e!131655))

(declare-fun res!159279 () Bool)

(assert (=> b!190887 (=> (not res!159279) (not e!131655))))

(declare-fun lt!296635 () tuple2!16506)

(assert (=> b!190887 (= res!159279 (and (= (_2!8898 lt!296625) (_2!8898 lt!296635)) (= (_1!8898 lt!296625) (_1!8898 lt!296635))))))

(declare-fun lt!296640 () Unit!13584)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13584)

(assert (=> b!190887 (= lt!296640 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8899 lt!296631) nBits!348 i!590 lt!296622))))

(assert (=> b!190887 (= lt!296635 (readNBitsLSBFirstsLoopPure!0 lt!296634 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296643))))

(declare-fun withMovedBitIndex!0 (BitStream!7854 (_ BitVec 64)) BitStream!7854)

(assert (=> b!190887 (= lt!296634 (withMovedBitIndex!0 (_1!8899 lt!296631) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!190888 () Bool)

(declare-fun e!131668 () Bool)

(assert (=> b!190888 (= e!131668 e!131657)))

(declare-fun res!159266 () Bool)

(assert (=> b!190888 (=> (not res!159266) (not e!131657))))

(assert (=> b!190888 (= res!159266 (and (= (_2!8900 lt!296644) lt!296624) (= (_1!8900 lt!296644) (_2!8897 lt!296639))))))

(declare-fun readerFrom!0 (BitStream!7854 (_ BitVec 32) (_ BitVec 32)) BitStream!7854)

(assert (=> b!190888 (= lt!296644 (readBitPure!0 (readerFrom!0 (_2!8897 lt!296639) (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204))))))

(declare-fun b!190889 () Bool)

(declare-fun e!131659 () Bool)

(assert (=> b!190889 (= e!131659 e!131656)))

(declare-fun res!159263 () Bool)

(assert (=> b!190889 (=> res!159263 e!131656)))

(assert (=> b!190889 (= res!159263 (not (= lt!296629 (bvsub (bvsub (bvadd lt!296621 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!190889 (= lt!296629 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296619))) (currentByte!9128 (_2!8897 lt!296619)) (currentBit!9123 (_2!8897 lt!296619))))))

(assert (=> b!190889 (isPrefixOf!0 thiss!1204 (_2!8897 lt!296619))))

(declare-fun lt!296647 () Unit!13584)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7854 BitStream!7854 BitStream!7854) Unit!13584)

(assert (=> b!190889 (= lt!296647 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8897 lt!296639) (_2!8897 lt!296619)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7854 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16504)

(assert (=> b!190889 (= lt!296619 (appendBitsLSBFirstLoopTR!0 (_2!8897 lt!296639) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!190890 () Bool)

(assert (=> b!190890 (= e!131665 (= (_2!8900 lt!296620) (_2!8900 lt!296642)))))

(declare-fun b!190891 () Bool)

(declare-fun res!159260 () Bool)

(assert (=> b!190891 (=> (not res!159260) (not e!131655))))

(assert (=> b!190891 (= res!159260 (= (_1!8899 lt!296631) (withMovedBitIndex!0 (_2!8899 lt!296631) (bvsub lt!296637 lt!296629))))))

(declare-fun b!190892 () Bool)

(declare-fun e!131662 () Bool)

(assert (=> b!190892 (= e!131662 (not e!131659))))

(declare-fun res!159278 () Bool)

(assert (=> b!190892 (=> res!159278 e!131659)))

(assert (=> b!190892 (= res!159278 (not (= lt!296621 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!296637))))))

(assert (=> b!190892 (= lt!296621 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))))))

(assert (=> b!190892 (= lt!296637 (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(declare-fun e!131661 () Bool)

(assert (=> b!190892 e!131661))

(declare-fun res!159272 () Bool)

(assert (=> b!190892 (=> (not res!159272) (not e!131661))))

(assert (=> b!190892 (= res!159272 (= (size!4373 (buf!4850 thiss!1204)) (size!4373 (buf!4850 (_2!8897 lt!296639)))))))

(declare-fun appendBit!0 (BitStream!7854 Bool) tuple2!16504)

(assert (=> b!190892 (= lt!296639 (appendBit!0 thiss!1204 lt!296624))))

(assert (=> b!190892 (= lt!296624 (not (= (bvand v!189 lt!296628) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190892 (= lt!296628 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!190893 () Bool)

(assert (=> b!190893 (= e!131661 e!131668)))

(declare-fun res!159280 () Bool)

(assert (=> b!190893 (=> (not res!159280) (not e!131668))))

(declare-fun lt!296627 () (_ BitVec 64))

(assert (=> b!190893 (= res!159280 (= lt!296638 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!296627)))))

(assert (=> b!190893 (= lt!296638 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))))))

(assert (=> b!190893 (= lt!296627 (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(declare-fun b!190894 () Bool)

(declare-fun res!159277 () Bool)

(assert (=> b!190894 (=> (not res!159277) (not e!131655))))

(assert (=> b!190894 (= res!159277 (= (_1!8899 lt!296632) (withMovedBitIndex!0 (_2!8899 lt!296632) (bvsub lt!296621 lt!296629))))))

(declare-fun b!190895 () Bool)

(declare-fun res!159274 () Bool)

(assert (=> b!190895 (=> res!159274 e!131656)))

(assert (=> b!190895 (= res!159274 (not (invariant!0 (currentBit!9123 (_2!8897 lt!296619)) (currentByte!9128 (_2!8897 lt!296619)) (size!4373 (buf!4850 (_2!8897 lt!296619))))))))

(declare-fun b!190896 () Bool)

(declare-fun res!159265 () Bool)

(assert (=> b!190896 (=> res!159265 e!131656)))

(assert (=> b!190896 (= res!159265 (not (isPrefixOf!0 (_2!8897 lt!296639) (_2!8897 lt!296619))))))

(declare-fun b!190897 () Bool)

(assert (=> b!190897 (= e!131667 e!131662)))

(declare-fun res!159262 () Bool)

(assert (=> b!190897 (=> (not res!159262) (not e!131662))))

(assert (=> b!190897 (= res!159262 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 thiss!1204))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204)) lt!296630))))

(assert (=> b!190897 (= lt!296630 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!190898 () Bool)

(declare-fun res!159264 () Bool)

(assert (=> b!190898 (=> (not res!159264) (not e!131662))))

(assert (=> b!190898 (= res!159264 (not (= i!590 nBits!348)))))

(declare-fun b!190899 () Bool)

(declare-fun res!159275 () Bool)

(assert (=> b!190899 (=> (not res!159275) (not e!131662))))

(assert (=> b!190899 (= res!159275 (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 thiss!1204))))))

(declare-fun b!190900 () Bool)

(declare-fun res!159276 () Bool)

(assert (=> b!190900 (=> (not res!159276) (not e!131668))))

(assert (=> b!190900 (= res!159276 (isPrefixOf!0 thiss!1204 (_2!8897 lt!296639)))))

(declare-fun b!190901 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190901 (= e!131666 (= (bvand lt!296622 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!41134 res!159273) b!190897))

(assert (= (and b!190897 res!159262) b!190899))

(assert (= (and b!190899 res!159275) b!190898))

(assert (= (and b!190898 res!159264) b!190892))

(assert (= (and b!190892 res!159272) b!190893))

(assert (= (and b!190893 res!159280) b!190900))

(assert (= (and b!190900 res!159276) b!190888))

(assert (= (and b!190888 res!159266) b!190880))

(assert (= (and b!190892 (not res!159278)) b!190889))

(assert (= (and b!190889 (not res!159263)) b!190895))

(assert (= (and b!190895 (not res!159274)) b!190882))

(assert (= (and b!190882 (not res!159281)) b!190896))

(assert (= (and b!190896 (not res!159265)) b!190878))

(assert (= (and b!190878 (not res!159267)) b!190879))

(assert (= (and b!190879 res!159261) b!190881))

(assert (= (and b!190879 res!159270) b!190890))

(assert (= (and b!190879 (not res!159269)) b!190887))

(assert (= (and b!190887 res!159279) b!190891))

(assert (= (and b!190891 res!159260) b!190894))

(assert (= (and b!190894 res!159277) b!190886))

(assert (= (and b!190887 (not res!159268)) b!190884))

(assert (= (and b!190884 (not res!159271)) b!190885))

(assert (= (and b!190885 (not res!159282)) b!190901))

(assert (= start!41134 b!190883))

(declare-fun m!296485 () Bool)

(assert (=> b!190900 m!296485))

(declare-fun m!296487 () Bool)

(assert (=> b!190888 m!296487))

(assert (=> b!190888 m!296487))

(declare-fun m!296489 () Bool)

(assert (=> b!190888 m!296489))

(declare-fun m!296491 () Bool)

(assert (=> b!190880 m!296491))

(declare-fun m!296493 () Bool)

(assert (=> start!41134 m!296493))

(declare-fun m!296495 () Bool)

(assert (=> b!190894 m!296495))

(declare-fun m!296497 () Bool)

(assert (=> b!190884 m!296497))

(declare-fun m!296499 () Bool)

(assert (=> b!190884 m!296499))

(declare-fun m!296501 () Bool)

(assert (=> b!190899 m!296501))

(declare-fun m!296503 () Bool)

(assert (=> b!190889 m!296503))

(declare-fun m!296505 () Bool)

(assert (=> b!190889 m!296505))

(declare-fun m!296507 () Bool)

(assert (=> b!190889 m!296507))

(declare-fun m!296509 () Bool)

(assert (=> b!190889 m!296509))

(declare-fun m!296511 () Bool)

(assert (=> b!190896 m!296511))

(declare-fun m!296513 () Bool)

(assert (=> b!190881 m!296513))

(declare-fun m!296515 () Bool)

(assert (=> b!190901 m!296515))

(declare-fun m!296517 () Bool)

(assert (=> b!190893 m!296517))

(declare-fun m!296519 () Bool)

(assert (=> b!190893 m!296519))

(declare-fun m!296521 () Bool)

(assert (=> b!190887 m!296521))

(declare-fun m!296523 () Bool)

(assert (=> b!190887 m!296523))

(declare-fun m!296525 () Bool)

(assert (=> b!190887 m!296525))

(declare-fun m!296527 () Bool)

(assert (=> b!190897 m!296527))

(assert (=> b!190892 m!296517))

(assert (=> b!190892 m!296519))

(declare-fun m!296529 () Bool)

(assert (=> b!190892 m!296529))

(declare-fun m!296531 () Bool)

(assert (=> b!190879 m!296531))

(declare-fun m!296533 () Bool)

(assert (=> b!190879 m!296533))

(declare-fun m!296535 () Bool)

(assert (=> b!190879 m!296535))

(declare-fun m!296537 () Bool)

(assert (=> b!190879 m!296537))

(declare-fun m!296539 () Bool)

(assert (=> b!190879 m!296539))

(declare-fun m!296541 () Bool)

(assert (=> b!190879 m!296541))

(declare-fun m!296543 () Bool)

(assert (=> b!190879 m!296543))

(declare-fun m!296545 () Bool)

(assert (=> b!190879 m!296545))

(declare-fun m!296547 () Bool)

(assert (=> b!190879 m!296547))

(declare-fun m!296549 () Bool)

(assert (=> b!190879 m!296549))

(declare-fun m!296551 () Bool)

(assert (=> b!190879 m!296551))

(declare-fun m!296553 () Bool)

(assert (=> b!190879 m!296553))

(declare-fun m!296555 () Bool)

(assert (=> b!190879 m!296555))

(declare-fun m!296557 () Bool)

(assert (=> b!190879 m!296557))

(declare-fun m!296559 () Bool)

(assert (=> b!190879 m!296559))

(declare-fun m!296561 () Bool)

(assert (=> b!190879 m!296561))

(declare-fun m!296563 () Bool)

(assert (=> b!190885 m!296563))

(declare-fun m!296565 () Bool)

(assert (=> b!190891 m!296565))

(declare-fun m!296567 () Bool)

(assert (=> b!190895 m!296567))

(declare-fun m!296569 () Bool)

(assert (=> b!190883 m!296569))

(assert (=> b!190878 m!296485))

(check-sat (not b!190883) (not b!190892) (not b!190899) (not b!190889) (not b!190891) (not start!41134) (not b!190895) (not b!190896) (not b!190897) (not b!190901) (not b!190878) (not b!190879) (not b!190900) (not b!190880) (not b!190893) (not b!190885) (not b!190887) (not b!190884) (not b!190894) (not b!190888) (not b!190881))
(check-sat)
(get-model)

(declare-fun d!65409 () Bool)

(assert (=> d!65409 (= (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296639)))) (and (bvsge (currentBit!9123 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9123 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9128 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296639)))) (and (= (currentBit!9123 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296639))))))))))

(assert (=> b!190879 d!65409))

(declare-fun d!65411 () Bool)

(assert (=> d!65411 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204)) lt!296630)))

(declare-fun lt!296737 () Unit!13584)

(declare-fun choose!9 (BitStream!7854 array!9919 (_ BitVec 64) BitStream!7854) Unit!13584)

(assert (=> d!65411 (= lt!296737 (choose!9 thiss!1204 (buf!4850 (_2!8897 lt!296619)) lt!296630 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204))))))

(assert (=> d!65411 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4850 (_2!8897 lt!296619)) lt!296630) lt!296737)))

(declare-fun bs!16260 () Bool)

(assert (= bs!16260 d!65411))

(assert (=> bs!16260 m!296541))

(declare-fun m!296657 () Bool)

(assert (=> bs!16260 m!296657))

(assert (=> b!190879 d!65411))

(declare-fun d!65413 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!65413 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639))) lt!296641) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639)))) lt!296641))))

(declare-fun bs!16261 () Bool)

(assert (= bs!16261 d!65413))

(declare-fun m!296659 () Bool)

(assert (=> bs!16261 m!296659))

(assert (=> b!190879 d!65413))

(declare-fun d!65415 () Bool)

(assert (=> d!65415 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639))) lt!296641)))

(declare-fun lt!296738 () Unit!13584)

(assert (=> d!65415 (= lt!296738 (choose!9 (_2!8897 lt!296639) (buf!4850 (_2!8897 lt!296619)) lt!296641 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639)))))))

(assert (=> d!65415 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8897 lt!296639) (buf!4850 (_2!8897 lt!296619)) lt!296641) lt!296738)))

(declare-fun bs!16262 () Bool)

(assert (= bs!16262 d!65415))

(assert (=> bs!16262 m!296547))

(declare-fun m!296661 () Bool)

(assert (=> bs!16262 m!296661))

(assert (=> b!190879 d!65415))

(declare-fun d!65417 () Bool)

(declare-fun e!131717 () Bool)

(assert (=> d!65417 e!131717))

(declare-fun res!159357 () Bool)

(assert (=> d!65417 (=> (not res!159357) (not e!131717))))

(declare-fun lt!296754 () (_ BitVec 64))

(declare-fun lt!296751 () (_ BitVec 64))

(declare-fun lt!296755 () (_ BitVec 64))

(assert (=> d!65417 (= res!159357 (= lt!296751 (bvsub lt!296755 lt!296754)))))

(assert (=> d!65417 (or (= (bvand lt!296755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296755 lt!296754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65417 (= lt!296754 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296620)))) ((_ sign_extend 32) (currentByte!9128 (_1!8900 lt!296620))) ((_ sign_extend 32) (currentBit!9123 (_1!8900 lt!296620)))))))

(declare-fun lt!296753 () (_ BitVec 64))

(declare-fun lt!296756 () (_ BitVec 64))

(assert (=> d!65417 (= lt!296755 (bvmul lt!296753 lt!296756))))

(assert (=> d!65417 (or (= lt!296753 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296756 (bvsdiv (bvmul lt!296753 lt!296756) lt!296753)))))

(assert (=> d!65417 (= lt!296756 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65417 (= lt!296753 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296620)))))))

(assert (=> d!65417 (= lt!296751 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 (_1!8900 lt!296620))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 (_1!8900 lt!296620)))))))

(assert (=> d!65417 (invariant!0 (currentBit!9123 (_1!8900 lt!296620)) (currentByte!9128 (_1!8900 lt!296620)) (size!4373 (buf!4850 (_1!8900 lt!296620))))))

(assert (=> d!65417 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296620))) (currentByte!9128 (_1!8900 lt!296620)) (currentBit!9123 (_1!8900 lt!296620))) lt!296751)))

(declare-fun b!190978 () Bool)

(declare-fun res!159356 () Bool)

(assert (=> b!190978 (=> (not res!159356) (not e!131717))))

(assert (=> b!190978 (= res!159356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296751))))

(declare-fun b!190979 () Bool)

(declare-fun lt!296752 () (_ BitVec 64))

(assert (=> b!190979 (= e!131717 (bvsle lt!296751 (bvmul lt!296752 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190979 (or (= lt!296752 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296752 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296752)))))

(assert (=> b!190979 (= lt!296752 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296620)))))))

(assert (= (and d!65417 res!159357) b!190978))

(assert (= (and b!190978 res!159356) b!190979))

(declare-fun m!296663 () Bool)

(assert (=> d!65417 m!296663))

(declare-fun m!296665 () Bool)

(assert (=> d!65417 m!296665))

(assert (=> b!190879 d!65417))

(declare-fun b!190990 () Bool)

(declare-fun res!159365 () Bool)

(declare-fun e!131723 () Bool)

(assert (=> b!190990 (=> (not res!159365) (not e!131723))))

(declare-fun lt!296810 () tuple2!16508)

(assert (=> b!190990 (= res!159365 (isPrefixOf!0 (_1!8899 lt!296810) (_2!8897 lt!296639)))))

(declare-fun d!65419 () Bool)

(assert (=> d!65419 e!131723))

(declare-fun res!159366 () Bool)

(assert (=> d!65419 (=> (not res!159366) (not e!131723))))

(assert (=> d!65419 (= res!159366 (isPrefixOf!0 (_1!8899 lt!296810) (_2!8899 lt!296810)))))

(declare-fun lt!296809 () BitStream!7854)

(assert (=> d!65419 (= lt!296810 (tuple2!16509 lt!296809 (_2!8897 lt!296619)))))

(declare-fun lt!296808 () Unit!13584)

(declare-fun lt!296813 () Unit!13584)

(assert (=> d!65419 (= lt!296808 lt!296813)))

(assert (=> d!65419 (isPrefixOf!0 lt!296809 (_2!8897 lt!296619))))

(assert (=> d!65419 (= lt!296813 (lemmaIsPrefixTransitive!0 lt!296809 (_2!8897 lt!296619) (_2!8897 lt!296619)))))

(declare-fun lt!296815 () Unit!13584)

(declare-fun lt!296799 () Unit!13584)

(assert (=> d!65419 (= lt!296815 lt!296799)))

(assert (=> d!65419 (isPrefixOf!0 lt!296809 (_2!8897 lt!296619))))

(assert (=> d!65419 (= lt!296799 (lemmaIsPrefixTransitive!0 lt!296809 (_2!8897 lt!296639) (_2!8897 lt!296619)))))

(declare-fun lt!296797 () Unit!13584)

(declare-fun e!131722 () Unit!13584)

(assert (=> d!65419 (= lt!296797 e!131722)))

(declare-fun c!9652 () Bool)

(assert (=> d!65419 (= c!9652 (not (= (size!4373 (buf!4850 (_2!8897 lt!296639))) #b00000000000000000000000000000000)))))

(declare-fun lt!296811 () Unit!13584)

(declare-fun lt!296803 () Unit!13584)

(assert (=> d!65419 (= lt!296811 lt!296803)))

(assert (=> d!65419 (isPrefixOf!0 (_2!8897 lt!296619) (_2!8897 lt!296619))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7854) Unit!13584)

(assert (=> d!65419 (= lt!296803 (lemmaIsPrefixRefl!0 (_2!8897 lt!296619)))))

(declare-fun lt!296816 () Unit!13584)

(declare-fun lt!296806 () Unit!13584)

(assert (=> d!65419 (= lt!296816 lt!296806)))

(assert (=> d!65419 (= lt!296806 (lemmaIsPrefixRefl!0 (_2!8897 lt!296619)))))

(declare-fun lt!296798 () Unit!13584)

(declare-fun lt!296805 () Unit!13584)

(assert (=> d!65419 (= lt!296798 lt!296805)))

(assert (=> d!65419 (isPrefixOf!0 lt!296809 lt!296809)))

(assert (=> d!65419 (= lt!296805 (lemmaIsPrefixRefl!0 lt!296809))))

(declare-fun lt!296812 () Unit!13584)

(declare-fun lt!296801 () Unit!13584)

(assert (=> d!65419 (= lt!296812 lt!296801)))

(assert (=> d!65419 (isPrefixOf!0 (_2!8897 lt!296639) (_2!8897 lt!296639))))

(assert (=> d!65419 (= lt!296801 (lemmaIsPrefixRefl!0 (_2!8897 lt!296639)))))

(assert (=> d!65419 (= lt!296809 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))))))

(assert (=> d!65419 (isPrefixOf!0 (_2!8897 lt!296639) (_2!8897 lt!296619))))

(assert (=> d!65419 (= (reader!0 (_2!8897 lt!296639) (_2!8897 lt!296619)) lt!296810)))

(declare-fun b!190991 () Bool)

(declare-fun Unit!13588 () Unit!13584)

(assert (=> b!190991 (= e!131722 Unit!13588)))

(declare-fun b!190992 () Bool)

(declare-fun res!159364 () Bool)

(assert (=> b!190992 (=> (not res!159364) (not e!131723))))

(assert (=> b!190992 (= res!159364 (isPrefixOf!0 (_2!8899 lt!296810) (_2!8897 lt!296619)))))

(declare-fun b!190993 () Bool)

(declare-fun lt!296800 () Unit!13584)

(assert (=> b!190993 (= e!131722 lt!296800)))

(declare-fun lt!296802 () (_ BitVec 64))

(assert (=> b!190993 (= lt!296802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!296814 () (_ BitVec 64))

(assert (=> b!190993 (= lt!296814 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9919 array!9919 (_ BitVec 64) (_ BitVec 64)) Unit!13584)

(assert (=> b!190993 (= lt!296800 (arrayBitRangesEqSymmetric!0 (buf!4850 (_2!8897 lt!296639)) (buf!4850 (_2!8897 lt!296619)) lt!296802 lt!296814))))

(declare-fun arrayBitRangesEq!0 (array!9919 array!9919 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190993 (arrayBitRangesEq!0 (buf!4850 (_2!8897 lt!296619)) (buf!4850 (_2!8897 lt!296639)) lt!296802 lt!296814)))

(declare-fun lt!296804 () (_ BitVec 64))

(declare-fun lt!296807 () (_ BitVec 64))

(declare-fun b!190994 () Bool)

(assert (=> b!190994 (= e!131723 (= (_1!8899 lt!296810) (withMovedBitIndex!0 (_2!8899 lt!296810) (bvsub lt!296804 lt!296807))))))

(assert (=> b!190994 (or (= (bvand lt!296804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296804 lt!296807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190994 (= lt!296807 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296619))) (currentByte!9128 (_2!8897 lt!296619)) (currentBit!9123 (_2!8897 lt!296619))))))

(assert (=> b!190994 (= lt!296804 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))))))

(assert (= (and d!65419 c!9652) b!190993))

(assert (= (and d!65419 (not c!9652)) b!190991))

(assert (= (and d!65419 res!159366) b!190990))

(assert (= (and b!190990 res!159365) b!190992))

(assert (= (and b!190992 res!159364) b!190994))

(declare-fun m!296667 () Bool)

(assert (=> b!190990 m!296667))

(assert (=> b!190993 m!296517))

(declare-fun m!296669 () Bool)

(assert (=> b!190993 m!296669))

(declare-fun m!296671 () Bool)

(assert (=> b!190993 m!296671))

(declare-fun m!296673 () Bool)

(assert (=> b!190994 m!296673))

(assert (=> b!190994 m!296503))

(assert (=> b!190994 m!296517))

(declare-fun m!296675 () Bool)

(assert (=> b!190992 m!296675))

(declare-fun m!296677 () Bool)

(assert (=> d!65419 m!296677))

(declare-fun m!296679 () Bool)

(assert (=> d!65419 m!296679))

(assert (=> d!65419 m!296511))

(declare-fun m!296681 () Bool)

(assert (=> d!65419 m!296681))

(declare-fun m!296683 () Bool)

(assert (=> d!65419 m!296683))

(declare-fun m!296685 () Bool)

(assert (=> d!65419 m!296685))

(declare-fun m!296687 () Bool)

(assert (=> d!65419 m!296687))

(declare-fun m!296689 () Bool)

(assert (=> d!65419 m!296689))

(declare-fun m!296691 () Bool)

(assert (=> d!65419 m!296691))

(declare-fun m!296693 () Bool)

(assert (=> d!65419 m!296693))

(declare-fun m!296695 () Bool)

(assert (=> d!65419 m!296695))

(assert (=> b!190879 d!65419))

(declare-fun d!65421 () Bool)

(declare-datatypes ((tuple2!16520 0))(
  ( (tuple2!16521 (_1!8905 Bool) (_2!8905 BitStream!7854)) )
))
(declare-fun lt!296819 () tuple2!16520)

(declare-fun readBit!0 (BitStream!7854) tuple2!16520)

(assert (=> d!65421 (= lt!296819 (readBit!0 lt!296646))))

(assert (=> d!65421 (= (readBitPure!0 lt!296646) (tuple2!16511 (_2!8905 lt!296819) (_1!8905 lt!296819)))))

(declare-fun bs!16263 () Bool)

(assert (= bs!16263 d!65421))

(declare-fun m!296697 () Bool)

(assert (=> bs!16263 m!296697))

(assert (=> b!190879 d!65421))

(declare-fun d!65423 () Bool)

(declare-datatypes ((tuple2!16522 0))(
  ( (tuple2!16523 (_1!8906 (_ BitVec 64)) (_2!8906 BitStream!7854)) )
))
(declare-fun lt!296822 () tuple2!16522)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16522)

(assert (=> d!65423 (= lt!296822 (readNBitsLSBFirstsLoop!0 (_1!8899 lt!296632) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296643))))

(assert (=> d!65423 (= (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!296632) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296643) (tuple2!16507 (_2!8906 lt!296822) (_1!8906 lt!296822)))))

(declare-fun bs!16264 () Bool)

(assert (= bs!16264 d!65423))

(declare-fun m!296699 () Bool)

(assert (=> bs!16264 m!296699))

(assert (=> b!190879 d!65423))

(declare-fun d!65425 () Bool)

(assert (=> d!65425 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204)) lt!296630) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204))) lt!296630))))

(declare-fun bs!16265 () Bool)

(assert (= bs!16265 d!65425))

(declare-fun m!296701 () Bool)

(assert (=> bs!16265 m!296701))

(assert (=> b!190879 d!65425))

(declare-fun d!65427 () Bool)

(declare-fun e!131726 () Bool)

(assert (=> d!65427 e!131726))

(declare-fun res!159369 () Bool)

(assert (=> d!65427 (=> (not res!159369) (not e!131726))))

(declare-fun lt!296833 () tuple2!16510)

(declare-fun lt!296834 () tuple2!16510)

(assert (=> d!65427 (= res!159369 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296833))) (currentByte!9128 (_1!8900 lt!296833)) (currentBit!9123 (_1!8900 lt!296833))) (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296834))) (currentByte!9128 (_1!8900 lt!296834)) (currentBit!9123 (_1!8900 lt!296834)))))))

(declare-fun lt!296831 () BitStream!7854)

(declare-fun lt!296832 () Unit!13584)

(declare-fun choose!50 (BitStream!7854 BitStream!7854 BitStream!7854 tuple2!16510 tuple2!16510 BitStream!7854 Bool tuple2!16510 tuple2!16510 BitStream!7854 Bool) Unit!13584)

(assert (=> d!65427 (= lt!296832 (choose!50 lt!296646 (_2!8897 lt!296619) lt!296831 lt!296833 (tuple2!16511 (_1!8900 lt!296833) (_2!8900 lt!296833)) (_1!8900 lt!296833) (_2!8900 lt!296833) lt!296834 (tuple2!16511 (_1!8900 lt!296834) (_2!8900 lt!296834)) (_1!8900 lt!296834) (_2!8900 lt!296834)))))

(assert (=> d!65427 (= lt!296834 (readBitPure!0 lt!296831))))

(assert (=> d!65427 (= lt!296833 (readBitPure!0 lt!296646))))

(assert (=> d!65427 (= lt!296831 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 lt!296646) (currentBit!9123 lt!296646)))))

(assert (=> d!65427 (invariant!0 (currentBit!9123 lt!296646) (currentByte!9128 lt!296646) (size!4373 (buf!4850 (_2!8897 lt!296619))))))

(assert (=> d!65427 (= (readBitPrefixLemma!0 lt!296646 (_2!8897 lt!296619)) lt!296832)))

(declare-fun b!190997 () Bool)

(assert (=> b!190997 (= e!131726 (= (_2!8900 lt!296833) (_2!8900 lt!296834)))))

(assert (= (and d!65427 res!159369) b!190997))

(declare-fun m!296703 () Bool)

(assert (=> d!65427 m!296703))

(assert (=> d!65427 m!296553))

(declare-fun m!296705 () Bool)

(assert (=> d!65427 m!296705))

(declare-fun m!296707 () Bool)

(assert (=> d!65427 m!296707))

(declare-fun m!296709 () Bool)

(assert (=> d!65427 m!296709))

(declare-fun m!296711 () Bool)

(assert (=> d!65427 m!296711))

(assert (=> b!190879 d!65427))

(declare-fun d!65429 () Bool)

(declare-fun lt!296835 () tuple2!16520)

(assert (=> d!65429 (= lt!296835 (readBit!0 (_1!8899 lt!296631)))))

(assert (=> d!65429 (= (readBitPure!0 (_1!8899 lt!296631)) (tuple2!16511 (_2!8905 lt!296835) (_1!8905 lt!296835)))))

(declare-fun bs!16266 () Bool)

(assert (= bs!16266 d!65429))

(declare-fun m!296713 () Bool)

(assert (=> bs!16266 m!296713))

(assert (=> b!190879 d!65429))

(declare-fun lt!296836 () tuple2!16522)

(declare-fun d!65431 () Bool)

(assert (=> d!65431 (= lt!296836 (readNBitsLSBFirstsLoop!0 (_1!8899 lt!296631) nBits!348 i!590 lt!296622))))

(assert (=> d!65431 (= (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!296631) nBits!348 i!590 lt!296622) (tuple2!16507 (_2!8906 lt!296836) (_1!8906 lt!296836)))))

(declare-fun bs!16267 () Bool)

(assert (= bs!16267 d!65431))

(declare-fun m!296715 () Bool)

(assert (=> bs!16267 m!296715))

(assert (=> b!190879 d!65431))

(declare-fun d!65433 () Bool)

(assert (=> d!65433 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!190879 d!65433))

(declare-fun d!65435 () Bool)

(declare-fun lt!296837 () tuple2!16520)

(assert (=> d!65435 (= lt!296837 (readBit!0 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204))))))

(assert (=> d!65435 (= (readBitPure!0 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204))) (tuple2!16511 (_2!8905 lt!296837) (_1!8905 lt!296837)))))

(declare-fun bs!16268 () Bool)

(assert (= bs!16268 d!65435))

(declare-fun m!296717 () Bool)

(assert (=> bs!16268 m!296717))

(assert (=> b!190879 d!65435))

(declare-fun d!65437 () Bool)

(declare-fun e!131727 () Bool)

(assert (=> d!65437 e!131727))

(declare-fun res!159371 () Bool)

(assert (=> d!65437 (=> (not res!159371) (not e!131727))))

(declare-fun lt!296838 () (_ BitVec 64))

(declare-fun lt!296842 () (_ BitVec 64))

(declare-fun lt!296841 () (_ BitVec 64))

(assert (=> d!65437 (= res!159371 (= lt!296838 (bvsub lt!296842 lt!296841)))))

(assert (=> d!65437 (or (= (bvand lt!296842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296842 lt!296841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65437 (= lt!296841 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296642)))) ((_ sign_extend 32) (currentByte!9128 (_1!8900 lt!296642))) ((_ sign_extend 32) (currentBit!9123 (_1!8900 lt!296642)))))))

(declare-fun lt!296840 () (_ BitVec 64))

(declare-fun lt!296843 () (_ BitVec 64))

(assert (=> d!65437 (= lt!296842 (bvmul lt!296840 lt!296843))))

(assert (=> d!65437 (or (= lt!296840 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296843 (bvsdiv (bvmul lt!296840 lt!296843) lt!296840)))))

(assert (=> d!65437 (= lt!296843 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65437 (= lt!296840 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296642)))))))

(assert (=> d!65437 (= lt!296838 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 (_1!8900 lt!296642))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 (_1!8900 lt!296642)))))))

(assert (=> d!65437 (invariant!0 (currentBit!9123 (_1!8900 lt!296642)) (currentByte!9128 (_1!8900 lt!296642)) (size!4373 (buf!4850 (_1!8900 lt!296642))))))

(assert (=> d!65437 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296642))) (currentByte!9128 (_1!8900 lt!296642)) (currentBit!9123 (_1!8900 lt!296642))) lt!296838)))

(declare-fun b!190998 () Bool)

(declare-fun res!159370 () Bool)

(assert (=> b!190998 (=> (not res!159370) (not e!131727))))

(assert (=> b!190998 (= res!159370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296838))))

(declare-fun b!190999 () Bool)

(declare-fun lt!296839 () (_ BitVec 64))

(assert (=> b!190999 (= e!131727 (bvsle lt!296838 (bvmul lt!296839 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!190999 (or (= lt!296839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296839)))))

(assert (=> b!190999 (= lt!296839 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296642)))))))

(assert (= (and d!65437 res!159371) b!190998))

(assert (= (and b!190998 res!159370) b!190999))

(declare-fun m!296719 () Bool)

(assert (=> d!65437 m!296719))

(declare-fun m!296721 () Bool)

(assert (=> d!65437 m!296721))

(assert (=> b!190879 d!65437))

(declare-fun b!191000 () Bool)

(declare-fun res!159373 () Bool)

(declare-fun e!131729 () Bool)

(assert (=> b!191000 (=> (not res!159373) (not e!131729))))

(declare-fun lt!296857 () tuple2!16508)

(assert (=> b!191000 (= res!159373 (isPrefixOf!0 (_1!8899 lt!296857) thiss!1204))))

(declare-fun d!65439 () Bool)

(assert (=> d!65439 e!131729))

(declare-fun res!159374 () Bool)

(assert (=> d!65439 (=> (not res!159374) (not e!131729))))

(assert (=> d!65439 (= res!159374 (isPrefixOf!0 (_1!8899 lt!296857) (_2!8899 lt!296857)))))

(declare-fun lt!296856 () BitStream!7854)

(assert (=> d!65439 (= lt!296857 (tuple2!16509 lt!296856 (_2!8897 lt!296619)))))

(declare-fun lt!296855 () Unit!13584)

(declare-fun lt!296860 () Unit!13584)

(assert (=> d!65439 (= lt!296855 lt!296860)))

(assert (=> d!65439 (isPrefixOf!0 lt!296856 (_2!8897 lt!296619))))

(assert (=> d!65439 (= lt!296860 (lemmaIsPrefixTransitive!0 lt!296856 (_2!8897 lt!296619) (_2!8897 lt!296619)))))

(declare-fun lt!296862 () Unit!13584)

(declare-fun lt!296846 () Unit!13584)

(assert (=> d!65439 (= lt!296862 lt!296846)))

(assert (=> d!65439 (isPrefixOf!0 lt!296856 (_2!8897 lt!296619))))

(assert (=> d!65439 (= lt!296846 (lemmaIsPrefixTransitive!0 lt!296856 thiss!1204 (_2!8897 lt!296619)))))

(declare-fun lt!296844 () Unit!13584)

(declare-fun e!131728 () Unit!13584)

(assert (=> d!65439 (= lt!296844 e!131728)))

(declare-fun c!9653 () Bool)

(assert (=> d!65439 (= c!9653 (not (= (size!4373 (buf!4850 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!296858 () Unit!13584)

(declare-fun lt!296850 () Unit!13584)

(assert (=> d!65439 (= lt!296858 lt!296850)))

(assert (=> d!65439 (isPrefixOf!0 (_2!8897 lt!296619) (_2!8897 lt!296619))))

(assert (=> d!65439 (= lt!296850 (lemmaIsPrefixRefl!0 (_2!8897 lt!296619)))))

(declare-fun lt!296863 () Unit!13584)

(declare-fun lt!296853 () Unit!13584)

(assert (=> d!65439 (= lt!296863 lt!296853)))

(assert (=> d!65439 (= lt!296853 (lemmaIsPrefixRefl!0 (_2!8897 lt!296619)))))

(declare-fun lt!296845 () Unit!13584)

(declare-fun lt!296852 () Unit!13584)

(assert (=> d!65439 (= lt!296845 lt!296852)))

(assert (=> d!65439 (isPrefixOf!0 lt!296856 lt!296856)))

(assert (=> d!65439 (= lt!296852 (lemmaIsPrefixRefl!0 lt!296856))))

(declare-fun lt!296859 () Unit!13584)

(declare-fun lt!296848 () Unit!13584)

(assert (=> d!65439 (= lt!296859 lt!296848)))

(assert (=> d!65439 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!65439 (= lt!296848 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!65439 (= lt!296856 (BitStream!7855 (buf!4850 (_2!8897 lt!296619)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(assert (=> d!65439 (isPrefixOf!0 thiss!1204 (_2!8897 lt!296619))))

(assert (=> d!65439 (= (reader!0 thiss!1204 (_2!8897 lt!296619)) lt!296857)))

(declare-fun b!191001 () Bool)

(declare-fun Unit!13589 () Unit!13584)

(assert (=> b!191001 (= e!131728 Unit!13589)))

(declare-fun b!191002 () Bool)

(declare-fun res!159372 () Bool)

(assert (=> b!191002 (=> (not res!159372) (not e!131729))))

(assert (=> b!191002 (= res!159372 (isPrefixOf!0 (_2!8899 lt!296857) (_2!8897 lt!296619)))))

(declare-fun b!191003 () Bool)

(declare-fun lt!296847 () Unit!13584)

(assert (=> b!191003 (= e!131728 lt!296847)))

(declare-fun lt!296849 () (_ BitVec 64))

(assert (=> b!191003 (= lt!296849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!296861 () (_ BitVec 64))

(assert (=> b!191003 (= lt!296861 (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(assert (=> b!191003 (= lt!296847 (arrayBitRangesEqSymmetric!0 (buf!4850 thiss!1204) (buf!4850 (_2!8897 lt!296619)) lt!296849 lt!296861))))

(assert (=> b!191003 (arrayBitRangesEq!0 (buf!4850 (_2!8897 lt!296619)) (buf!4850 thiss!1204) lt!296849 lt!296861)))

(declare-fun lt!296854 () (_ BitVec 64))

(declare-fun lt!296851 () (_ BitVec 64))

(declare-fun b!191004 () Bool)

(assert (=> b!191004 (= e!131729 (= (_1!8899 lt!296857) (withMovedBitIndex!0 (_2!8899 lt!296857) (bvsub lt!296851 lt!296854))))))

(assert (=> b!191004 (or (= (bvand lt!296851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296854 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296851 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296851 lt!296854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191004 (= lt!296854 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296619))) (currentByte!9128 (_2!8897 lt!296619)) (currentBit!9123 (_2!8897 lt!296619))))))

(assert (=> b!191004 (= lt!296851 (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(assert (= (and d!65439 c!9653) b!191003))

(assert (= (and d!65439 (not c!9653)) b!191001))

(assert (= (and d!65439 res!159374) b!191000))

(assert (= (and b!191000 res!159373) b!191002))

(assert (= (and b!191002 res!159372) b!191004))

(declare-fun m!296723 () Bool)

(assert (=> b!191000 m!296723))

(assert (=> b!191003 m!296519))

(declare-fun m!296725 () Bool)

(assert (=> b!191003 m!296725))

(declare-fun m!296727 () Bool)

(assert (=> b!191003 m!296727))

(declare-fun m!296729 () Bool)

(assert (=> b!191004 m!296729))

(assert (=> b!191004 m!296503))

(assert (=> b!191004 m!296519))

(declare-fun m!296731 () Bool)

(assert (=> b!191002 m!296731))

(declare-fun m!296733 () Bool)

(assert (=> d!65439 m!296733))

(declare-fun m!296735 () Bool)

(assert (=> d!65439 m!296735))

(assert (=> d!65439 m!296505))

(declare-fun m!296737 () Bool)

(assert (=> d!65439 m!296737))

(declare-fun m!296739 () Bool)

(assert (=> d!65439 m!296739))

(assert (=> d!65439 m!296685))

(assert (=> d!65439 m!296687))

(declare-fun m!296741 () Bool)

(assert (=> d!65439 m!296741))

(declare-fun m!296743 () Bool)

(assert (=> d!65439 m!296743))

(declare-fun m!296745 () Bool)

(assert (=> d!65439 m!296745))

(declare-fun m!296747 () Bool)

(assert (=> d!65439 m!296747))

(assert (=> b!190879 d!65439))

(declare-fun d!65441 () Bool)

(assert (=> d!65441 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!190901 d!65441))

(declare-fun d!65443 () Bool)

(declare-fun e!131730 () Bool)

(assert (=> d!65443 e!131730))

(declare-fun res!159376 () Bool)

(assert (=> d!65443 (=> (not res!159376) (not e!131730))))

(declare-fun lt!296868 () (_ BitVec 64))

(declare-fun lt!296867 () (_ BitVec 64))

(declare-fun lt!296864 () (_ BitVec 64))

(assert (=> d!65443 (= res!159376 (= lt!296864 (bvsub lt!296868 lt!296867)))))

(assert (=> d!65443 (or (= (bvand lt!296868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296868 lt!296867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65443 (= lt!296867 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296644)))) ((_ sign_extend 32) (currentByte!9128 (_1!8900 lt!296644))) ((_ sign_extend 32) (currentBit!9123 (_1!8900 lt!296644)))))))

(declare-fun lt!296866 () (_ BitVec 64))

(declare-fun lt!296869 () (_ BitVec 64))

(assert (=> d!65443 (= lt!296868 (bvmul lt!296866 lt!296869))))

(assert (=> d!65443 (or (= lt!296866 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296869 (bvsdiv (bvmul lt!296866 lt!296869) lt!296866)))))

(assert (=> d!65443 (= lt!296869 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65443 (= lt!296866 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296644)))))))

(assert (=> d!65443 (= lt!296864 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 (_1!8900 lt!296644))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 (_1!8900 lt!296644)))))))

(assert (=> d!65443 (invariant!0 (currentBit!9123 (_1!8900 lt!296644)) (currentByte!9128 (_1!8900 lt!296644)) (size!4373 (buf!4850 (_1!8900 lt!296644))))))

(assert (=> d!65443 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296644))) (currentByte!9128 (_1!8900 lt!296644)) (currentBit!9123 (_1!8900 lt!296644))) lt!296864)))

(declare-fun b!191005 () Bool)

(declare-fun res!159375 () Bool)

(assert (=> b!191005 (=> (not res!159375) (not e!131730))))

(assert (=> b!191005 (= res!159375 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296864))))

(declare-fun b!191006 () Bool)

(declare-fun lt!296865 () (_ BitVec 64))

(assert (=> b!191006 (= e!131730 (bvsle lt!296864 (bvmul lt!296865 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191006 (or (= lt!296865 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296865 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296865)))))

(assert (=> b!191006 (= lt!296865 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8900 lt!296644)))))))

(assert (= (and d!65443 res!159376) b!191005))

(assert (= (and b!191005 res!159375) b!191006))

(declare-fun m!296749 () Bool)

(assert (=> d!65443 m!296749))

(declare-fun m!296751 () Bool)

(assert (=> d!65443 m!296751))

(assert (=> b!190880 d!65443))

(declare-fun d!65445 () Bool)

(declare-fun e!131733 () Bool)

(assert (=> d!65445 e!131733))

(declare-fun res!159379 () Bool)

(assert (=> d!65445 (=> (not res!159379) (not e!131733))))

(declare-fun lt!296875 () (_ BitVec 64))

(declare-fun lt!296874 () BitStream!7854)

(assert (=> d!65445 (= res!159379 (= (bvadd lt!296875 (bvsub lt!296637 lt!296629)) (bitIndex!0 (size!4373 (buf!4850 lt!296874)) (currentByte!9128 lt!296874) (currentBit!9123 lt!296874))))))

(assert (=> d!65445 (or (not (= (bvand lt!296875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296637 lt!296629) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296875 (bvsub lt!296637 lt!296629)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65445 (= lt!296875 (bitIndex!0 (size!4373 (buf!4850 (_2!8899 lt!296631))) (currentByte!9128 (_2!8899 lt!296631)) (currentBit!9123 (_2!8899 lt!296631))))))

(declare-fun moveBitIndex!0 (BitStream!7854 (_ BitVec 64)) tuple2!16504)

(assert (=> d!65445 (= lt!296874 (_2!8897 (moveBitIndex!0 (_2!8899 lt!296631) (bvsub lt!296637 lt!296629))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7854 (_ BitVec 64)) Bool)

(assert (=> d!65445 (moveBitIndexPrecond!0 (_2!8899 lt!296631) (bvsub lt!296637 lt!296629))))

(assert (=> d!65445 (= (withMovedBitIndex!0 (_2!8899 lt!296631) (bvsub lt!296637 lt!296629)) lt!296874)))

(declare-fun b!191009 () Bool)

(assert (=> b!191009 (= e!131733 (= (size!4373 (buf!4850 (_2!8899 lt!296631))) (size!4373 (buf!4850 lt!296874))))))

(assert (= (and d!65445 res!159379) b!191009))

(declare-fun m!296753 () Bool)

(assert (=> d!65445 m!296753))

(assert (=> d!65445 m!296499))

(declare-fun m!296755 () Bool)

(assert (=> d!65445 m!296755))

(declare-fun m!296757 () Bool)

(assert (=> d!65445 m!296757))

(assert (=> b!190891 d!65445))

(declare-fun d!65447 () Bool)

(assert (=> d!65447 (= (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296619)))) (and (bvsge (currentBit!9123 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9123 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9128 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296619)))) (and (= (currentBit!9123 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296619))))))))))

(assert (=> b!190881 d!65447))

(declare-fun d!65449 () Bool)

(declare-fun e!131734 () Bool)

(assert (=> d!65449 e!131734))

(declare-fun res!159381 () Bool)

(assert (=> d!65449 (=> (not res!159381) (not e!131734))))

(declare-fun lt!296880 () (_ BitVec 64))

(declare-fun lt!296879 () (_ BitVec 64))

(declare-fun lt!296876 () (_ BitVec 64))

(assert (=> d!65449 (= res!159381 (= lt!296876 (bvsub lt!296880 lt!296879)))))

(assert (=> d!65449 (or (= (bvand lt!296880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296880 lt!296879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65449 (= lt!296879 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296639)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639)))))))

(declare-fun lt!296878 () (_ BitVec 64))

(declare-fun lt!296881 () (_ BitVec 64))

(assert (=> d!65449 (= lt!296880 (bvmul lt!296878 lt!296881))))

(assert (=> d!65449 (or (= lt!296878 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296881 (bvsdiv (bvmul lt!296878 lt!296881) lt!296878)))))

(assert (=> d!65449 (= lt!296881 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65449 (= lt!296878 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296639)))))))

(assert (=> d!65449 (= lt!296876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639)))))))

(assert (=> d!65449 (invariant!0 (currentBit!9123 (_2!8897 lt!296639)) (currentByte!9128 (_2!8897 lt!296639)) (size!4373 (buf!4850 (_2!8897 lt!296639))))))

(assert (=> d!65449 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))) lt!296876)))

(declare-fun b!191010 () Bool)

(declare-fun res!159380 () Bool)

(assert (=> b!191010 (=> (not res!159380) (not e!131734))))

(assert (=> b!191010 (= res!159380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296876))))

(declare-fun b!191011 () Bool)

(declare-fun lt!296877 () (_ BitVec 64))

(assert (=> b!191011 (= e!131734 (bvsle lt!296876 (bvmul lt!296877 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191011 (or (= lt!296877 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296877 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296877)))))

(assert (=> b!191011 (= lt!296877 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296639)))))))

(assert (= (and d!65449 res!159381) b!191010))

(assert (= (and b!191010 res!159380) b!191011))

(declare-fun m!296759 () Bool)

(assert (=> d!65449 m!296759))

(declare-fun m!296761 () Bool)

(assert (=> d!65449 m!296761))

(assert (=> b!190892 d!65449))

(declare-fun d!65451 () Bool)

(declare-fun e!131735 () Bool)

(assert (=> d!65451 e!131735))

(declare-fun res!159383 () Bool)

(assert (=> d!65451 (=> (not res!159383) (not e!131735))))

(declare-fun lt!296885 () (_ BitVec 64))

(declare-fun lt!296886 () (_ BitVec 64))

(declare-fun lt!296882 () (_ BitVec 64))

(assert (=> d!65451 (= res!159383 (= lt!296882 (bvsub lt!296886 lt!296885)))))

(assert (=> d!65451 (or (= (bvand lt!296886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296885 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296886 lt!296885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65451 (= lt!296885 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 thiss!1204))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204))))))

(declare-fun lt!296884 () (_ BitVec 64))

(declare-fun lt!296887 () (_ BitVec 64))

(assert (=> d!65451 (= lt!296886 (bvmul lt!296884 lt!296887))))

(assert (=> d!65451 (or (= lt!296884 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296887 (bvsdiv (bvmul lt!296884 lt!296887) lt!296884)))))

(assert (=> d!65451 (= lt!296887 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65451 (= lt!296884 ((_ sign_extend 32) (size!4373 (buf!4850 thiss!1204))))))

(assert (=> d!65451 (= lt!296882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 thiss!1204))))))

(assert (=> d!65451 (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 thiss!1204)))))

(assert (=> d!65451 (= (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)) lt!296882)))

(declare-fun b!191012 () Bool)

(declare-fun res!159382 () Bool)

(assert (=> b!191012 (=> (not res!159382) (not e!131735))))

(assert (=> b!191012 (= res!159382 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296882))))

(declare-fun b!191013 () Bool)

(declare-fun lt!296883 () (_ BitVec 64))

(assert (=> b!191013 (= e!131735 (bvsle lt!296882 (bvmul lt!296883 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191013 (or (= lt!296883 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296883 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296883)))))

(assert (=> b!191013 (= lt!296883 ((_ sign_extend 32) (size!4373 (buf!4850 thiss!1204))))))

(assert (= (and d!65451 res!159383) b!191012))

(assert (= (and b!191012 res!159382) b!191013))

(declare-fun m!296763 () Bool)

(assert (=> d!65451 m!296763))

(assert (=> d!65451 m!296501))

(assert (=> b!190892 d!65451))

(declare-fun b!191024 () Bool)

(declare-fun res!159393 () Bool)

(declare-fun e!131741 () Bool)

(assert (=> b!191024 (=> (not res!159393) (not e!131741))))

(declare-fun lt!296898 () tuple2!16504)

(assert (=> b!191024 (= res!159393 (isPrefixOf!0 thiss!1204 (_2!8897 lt!296898)))))

(declare-fun b!191026 () Bool)

(declare-fun e!131740 () Bool)

(declare-fun lt!296899 () tuple2!16510)

(assert (=> b!191026 (= e!131740 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!296899))) (currentByte!9128 (_1!8900 lt!296899)) (currentBit!9123 (_1!8900 lt!296899))) (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296898))) (currentByte!9128 (_2!8897 lt!296898)) (currentBit!9123 (_2!8897 lt!296898)))))))

(declare-fun d!65453 () Bool)

(assert (=> d!65453 e!131741))

(declare-fun res!159392 () Bool)

(assert (=> d!65453 (=> (not res!159392) (not e!131741))))

(assert (=> d!65453 (= res!159392 (= (size!4373 (buf!4850 thiss!1204)) (size!4373 (buf!4850 (_2!8897 lt!296898)))))))

(declare-fun choose!16 (BitStream!7854 Bool) tuple2!16504)

(assert (=> d!65453 (= lt!296898 (choose!16 thiss!1204 lt!296624))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!65453 (validate_offset_bit!0 ((_ sign_extend 32) (size!4373 (buf!4850 thiss!1204))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204)))))

(assert (=> d!65453 (= (appendBit!0 thiss!1204 lt!296624) lt!296898)))

(declare-fun b!191025 () Bool)

(assert (=> b!191025 (= e!131741 e!131740)))

(declare-fun res!159395 () Bool)

(assert (=> b!191025 (=> (not res!159395) (not e!131740))))

(assert (=> b!191025 (= res!159395 (and (= (_2!8900 lt!296899) lt!296624) (= (_1!8900 lt!296899) (_2!8897 lt!296898))))))

(assert (=> b!191025 (= lt!296899 (readBitPure!0 (readerFrom!0 (_2!8897 lt!296898) (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204))))))

(declare-fun b!191023 () Bool)

(declare-fun res!159394 () Bool)

(assert (=> b!191023 (=> (not res!159394) (not e!131741))))

(declare-fun lt!296896 () (_ BitVec 64))

(declare-fun lt!296897 () (_ BitVec 64))

(assert (=> b!191023 (= res!159394 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296898))) (currentByte!9128 (_2!8897 lt!296898)) (currentBit!9123 (_2!8897 lt!296898))) (bvadd lt!296896 lt!296897)))))

(assert (=> b!191023 (or (not (= (bvand lt!296896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296897 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296896 lt!296897) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191023 (= lt!296897 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!191023 (= lt!296896 (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(assert (= (and d!65453 res!159392) b!191023))

(assert (= (and b!191023 res!159394) b!191024))

(assert (= (and b!191024 res!159393) b!191025))

(assert (= (and b!191025 res!159395) b!191026))

(declare-fun m!296765 () Bool)

(assert (=> d!65453 m!296765))

(declare-fun m!296767 () Bool)

(assert (=> d!65453 m!296767))

(declare-fun m!296769 () Bool)

(assert (=> b!191026 m!296769))

(declare-fun m!296771 () Bool)

(assert (=> b!191026 m!296771))

(declare-fun m!296773 () Bool)

(assert (=> b!191025 m!296773))

(assert (=> b!191025 m!296773))

(declare-fun m!296775 () Bool)

(assert (=> b!191025 m!296775))

(assert (=> b!191023 m!296771))

(assert (=> b!191023 m!296519))

(declare-fun m!296777 () Bool)

(assert (=> b!191024 m!296777))

(assert (=> b!190892 d!65453))

(declare-fun d!65455 () Bool)

(declare-fun lt!296915 () tuple2!16506)

(declare-fun lt!296917 () tuple2!16506)

(assert (=> d!65455 (and (= (_2!8898 lt!296915) (_2!8898 lt!296917)) (= (_1!8898 lt!296915) (_1!8898 lt!296917)))))

(declare-fun lt!296914 () BitStream!7854)

(declare-fun lt!296912 () (_ BitVec 64))

(declare-fun lt!296916 () Unit!13584)

(declare-fun lt!296913 () Bool)

(declare-fun choose!56 (BitStream!7854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16506 tuple2!16506 BitStream!7854 (_ BitVec 64) Bool BitStream!7854 (_ BitVec 64) tuple2!16506 tuple2!16506 BitStream!7854 (_ BitVec 64)) Unit!13584)

(assert (=> d!65455 (= lt!296916 (choose!56 (_1!8899 lt!296631) nBits!348 i!590 lt!296622 lt!296915 (tuple2!16507 (_1!8898 lt!296915) (_2!8898 lt!296915)) (_1!8898 lt!296915) (_2!8898 lt!296915) lt!296913 lt!296914 lt!296912 lt!296917 (tuple2!16507 (_1!8898 lt!296917) (_2!8898 lt!296917)) (_1!8898 lt!296917) (_2!8898 lt!296917)))))

(assert (=> d!65455 (= lt!296917 (readNBitsLSBFirstsLoopPure!0 lt!296914 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!296912))))

(assert (=> d!65455 (= lt!296912 (bvor lt!296622 (ite lt!296913 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65455 (= lt!296914 (withMovedBitIndex!0 (_1!8899 lt!296631) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!65455 (= lt!296913 (_2!8900 (readBitPure!0 (_1!8899 lt!296631))))))

(assert (=> d!65455 (= lt!296915 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!296631) nBits!348 i!590 lt!296622))))

(assert (=> d!65455 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8899 lt!296631) nBits!348 i!590 lt!296622) lt!296916)))

(declare-fun bs!16270 () Bool)

(assert (= bs!16270 d!65455))

(assert (=> bs!16270 m!296549))

(assert (=> bs!16270 m!296551))

(assert (=> bs!16270 m!296525))

(declare-fun m!296779 () Bool)

(assert (=> bs!16270 m!296779))

(declare-fun m!296781 () Bool)

(assert (=> bs!16270 m!296781))

(assert (=> b!190887 d!65455))

(declare-fun lt!296918 () tuple2!16522)

(declare-fun d!65457 () Bool)

(assert (=> d!65457 (= lt!296918 (readNBitsLSBFirstsLoop!0 lt!296634 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296643))))

(assert (=> d!65457 (= (readNBitsLSBFirstsLoopPure!0 lt!296634 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!296643) (tuple2!16507 (_2!8906 lt!296918) (_1!8906 lt!296918)))))

(declare-fun bs!16271 () Bool)

(assert (= bs!16271 d!65457))

(declare-fun m!296783 () Bool)

(assert (=> bs!16271 m!296783))

(assert (=> b!190887 d!65457))

(declare-fun d!65459 () Bool)

(declare-fun e!131742 () Bool)

(assert (=> d!65459 e!131742))

(declare-fun res!159396 () Bool)

(assert (=> d!65459 (=> (not res!159396) (not e!131742))))

(declare-fun lt!296920 () (_ BitVec 64))

(declare-fun lt!296919 () BitStream!7854)

(assert (=> d!65459 (= res!159396 (= (bvadd lt!296920 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4373 (buf!4850 lt!296919)) (currentByte!9128 lt!296919) (currentBit!9123 lt!296919))))))

(assert (=> d!65459 (or (not (= (bvand lt!296920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!296920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!296920 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65459 (= lt!296920 (bitIndex!0 (size!4373 (buf!4850 (_1!8899 lt!296631))) (currentByte!9128 (_1!8899 lt!296631)) (currentBit!9123 (_1!8899 lt!296631))))))

(assert (=> d!65459 (= lt!296919 (_2!8897 (moveBitIndex!0 (_1!8899 lt!296631) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!65459 (moveBitIndexPrecond!0 (_1!8899 lt!296631) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!65459 (= (withMovedBitIndex!0 (_1!8899 lt!296631) #b0000000000000000000000000000000000000000000000000000000000000001) lt!296919)))

(declare-fun b!191027 () Bool)

(assert (=> b!191027 (= e!131742 (= (size!4373 (buf!4850 (_1!8899 lt!296631))) (size!4373 (buf!4850 lt!296919))))))

(assert (= (and d!65459 res!159396) b!191027))

(declare-fun m!296785 () Bool)

(assert (=> d!65459 m!296785))

(declare-fun m!296787 () Bool)

(assert (=> d!65459 m!296787))

(declare-fun m!296789 () Bool)

(assert (=> d!65459 m!296789))

(declare-fun m!296791 () Bool)

(assert (=> d!65459 m!296791))

(assert (=> b!190887 d!65459))

(declare-fun d!65461 () Bool)

(declare-fun lt!296921 () tuple2!16520)

(assert (=> d!65461 (= lt!296921 (readBit!0 (readerFrom!0 (_2!8897 lt!296639) (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204))))))

(assert (=> d!65461 (= (readBitPure!0 (readerFrom!0 (_2!8897 lt!296639) (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204))) (tuple2!16511 (_2!8905 lt!296921) (_1!8905 lt!296921)))))

(declare-fun bs!16272 () Bool)

(assert (= bs!16272 d!65461))

(assert (=> bs!16272 m!296487))

(declare-fun m!296793 () Bool)

(assert (=> bs!16272 m!296793))

(assert (=> b!190888 d!65461))

(declare-fun d!65463 () Bool)

(declare-fun e!131745 () Bool)

(assert (=> d!65463 e!131745))

(declare-fun res!159400 () Bool)

(assert (=> d!65463 (=> (not res!159400) (not e!131745))))

(assert (=> d!65463 (= res!159400 (invariant!0 (currentBit!9123 (_2!8897 lt!296639)) (currentByte!9128 (_2!8897 lt!296639)) (size!4373 (buf!4850 (_2!8897 lt!296639)))))))

(assert (=> d!65463 (= (readerFrom!0 (_2!8897 lt!296639) (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204)) (BitStream!7855 (buf!4850 (_2!8897 lt!296639)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)))))

(declare-fun b!191030 () Bool)

(assert (=> b!191030 (= e!131745 (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 (_2!8897 lt!296639)))))))

(assert (= (and d!65463 res!159400) b!191030))

(assert (=> d!65463 m!296761))

(assert (=> b!191030 m!296559))

(assert (=> b!190888 d!65463))

(declare-fun d!65465 () Bool)

(assert (=> d!65465 (= (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 thiss!1204))) (and (bvsge (currentBit!9123 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9123 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9128 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9128 thiss!1204) (size!4373 (buf!4850 thiss!1204))) (and (= (currentBit!9123 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9128 thiss!1204) (size!4373 (buf!4850 thiss!1204)))))))))

(assert (=> b!190899 d!65465))

(declare-fun d!65467 () Bool)

(declare-fun res!159409 () Bool)

(declare-fun e!131751 () Bool)

(assert (=> d!65467 (=> (not res!159409) (not e!131751))))

(assert (=> d!65467 (= res!159409 (= (size!4373 (buf!4850 thiss!1204)) (size!4373 (buf!4850 (_2!8897 lt!296639)))))))

(assert (=> d!65467 (= (isPrefixOf!0 thiss!1204 (_2!8897 lt!296639)) e!131751)))

(declare-fun b!191037 () Bool)

(declare-fun res!159408 () Bool)

(assert (=> b!191037 (=> (not res!159408) (not e!131751))))

(assert (=> b!191037 (= res!159408 (bvsle (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)) (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639)))))))

(declare-fun b!191038 () Bool)

(declare-fun e!131750 () Bool)

(assert (=> b!191038 (= e!131751 e!131750)))

(declare-fun res!159407 () Bool)

(assert (=> b!191038 (=> res!159407 e!131750)))

(assert (=> b!191038 (= res!159407 (= (size!4373 (buf!4850 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!191039 () Bool)

(assert (=> b!191039 (= e!131750 (arrayBitRangesEq!0 (buf!4850 thiss!1204) (buf!4850 (_2!8897 lt!296639)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204))))))

(assert (= (and d!65467 res!159409) b!191037))

(assert (= (and b!191037 res!159408) b!191038))

(assert (= (and b!191038 (not res!159407)) b!191039))

(assert (=> b!191037 m!296519))

(assert (=> b!191037 m!296517))

(assert (=> b!191039 m!296519))

(assert (=> b!191039 m!296519))

(declare-fun m!296795 () Bool)

(assert (=> b!191039 m!296795))

(assert (=> b!190878 d!65467))

(declare-fun d!65469 () Bool)

(declare-fun e!131752 () Bool)

(assert (=> d!65469 e!131752))

(declare-fun res!159411 () Bool)

(assert (=> d!65469 (=> (not res!159411) (not e!131752))))

(declare-fun lt!296922 () (_ BitVec 64))

(declare-fun lt!296926 () (_ BitVec 64))

(declare-fun lt!296925 () (_ BitVec 64))

(assert (=> d!65469 (= res!159411 (= lt!296922 (bvsub lt!296926 lt!296925)))))

(assert (=> d!65469 (or (= (bvand lt!296926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!296925 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!296926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296926 lt!296925) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65469 (= lt!296925 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296619))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296619)))))))

(declare-fun lt!296924 () (_ BitVec 64))

(declare-fun lt!296927 () (_ BitVec 64))

(assert (=> d!65469 (= lt!296926 (bvmul lt!296924 lt!296927))))

(assert (=> d!65469 (or (= lt!296924 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!296927 (bvsdiv (bvmul lt!296924 lt!296927) lt!296924)))))

(assert (=> d!65469 (= lt!296927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65469 (= lt!296924 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))))))

(assert (=> d!65469 (= lt!296922 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296619))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296619)))))))

(assert (=> d!65469 (invariant!0 (currentBit!9123 (_2!8897 lt!296619)) (currentByte!9128 (_2!8897 lt!296619)) (size!4373 (buf!4850 (_2!8897 lt!296619))))))

(assert (=> d!65469 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296619))) (currentByte!9128 (_2!8897 lt!296619)) (currentBit!9123 (_2!8897 lt!296619))) lt!296922)))

(declare-fun b!191040 () Bool)

(declare-fun res!159410 () Bool)

(assert (=> b!191040 (=> (not res!159410) (not e!131752))))

(assert (=> b!191040 (= res!159410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!296922))))

(declare-fun b!191041 () Bool)

(declare-fun lt!296923 () (_ BitVec 64))

(assert (=> b!191041 (= e!131752 (bvsle lt!296922 (bvmul lt!296923 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191041 (or (= lt!296923 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!296923 #b0000000000000000000000000000000000000000000000000000000000001000) lt!296923)))))

(assert (=> b!191041 (= lt!296923 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296619)))))))

(assert (= (and d!65469 res!159411) b!191040))

(assert (= (and b!191040 res!159410) b!191041))

(declare-fun m!296797 () Bool)

(assert (=> d!65469 m!296797))

(assert (=> d!65469 m!296567))

(assert (=> b!190889 d!65469))

(declare-fun d!65471 () Bool)

(declare-fun res!159414 () Bool)

(declare-fun e!131754 () Bool)

(assert (=> d!65471 (=> (not res!159414) (not e!131754))))

(assert (=> d!65471 (= res!159414 (= (size!4373 (buf!4850 thiss!1204)) (size!4373 (buf!4850 (_2!8897 lt!296619)))))))

(assert (=> d!65471 (= (isPrefixOf!0 thiss!1204 (_2!8897 lt!296619)) e!131754)))

(declare-fun b!191042 () Bool)

(declare-fun res!159413 () Bool)

(assert (=> b!191042 (=> (not res!159413) (not e!131754))))

(assert (=> b!191042 (= res!159413 (bvsle (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204)) (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296619))) (currentByte!9128 (_2!8897 lt!296619)) (currentBit!9123 (_2!8897 lt!296619)))))))

(declare-fun b!191043 () Bool)

(declare-fun e!131753 () Bool)

(assert (=> b!191043 (= e!131754 e!131753)))

(declare-fun res!159412 () Bool)

(assert (=> b!191043 (=> res!159412 e!131753)))

(assert (=> b!191043 (= res!159412 (= (size!4373 (buf!4850 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!191044 () Bool)

(assert (=> b!191044 (= e!131753 (arrayBitRangesEq!0 (buf!4850 thiss!1204) (buf!4850 (_2!8897 lt!296619)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4373 (buf!4850 thiss!1204)) (currentByte!9128 thiss!1204) (currentBit!9123 thiss!1204))))))

(assert (= (and d!65471 res!159414) b!191042))

(assert (= (and b!191042 res!159413) b!191043))

(assert (= (and b!191043 (not res!159412)) b!191044))

(assert (=> b!191042 m!296519))

(assert (=> b!191042 m!296503))

(assert (=> b!191044 m!296519))

(assert (=> b!191044 m!296519))

(declare-fun m!296799 () Bool)

(assert (=> b!191044 m!296799))

(assert (=> b!190889 d!65471))

(declare-fun d!65473 () Bool)

(assert (=> d!65473 (isPrefixOf!0 thiss!1204 (_2!8897 lt!296619))))

(declare-fun lt!296930 () Unit!13584)

(declare-fun choose!30 (BitStream!7854 BitStream!7854 BitStream!7854) Unit!13584)

(assert (=> d!65473 (= lt!296930 (choose!30 thiss!1204 (_2!8897 lt!296639) (_2!8897 lt!296619)))))

(assert (=> d!65473 (isPrefixOf!0 thiss!1204 (_2!8897 lt!296639))))

(assert (=> d!65473 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8897 lt!296639) (_2!8897 lt!296619)) lt!296930)))

(declare-fun bs!16273 () Bool)

(assert (= bs!16273 d!65473))

(assert (=> bs!16273 m!296505))

(declare-fun m!296801 () Bool)

(assert (=> bs!16273 m!296801))

(assert (=> bs!16273 m!296485))

(assert (=> b!190889 d!65473))

(declare-fun d!65475 () Bool)

(declare-fun e!131829 () Bool)

(assert (=> d!65475 e!131829))

(declare-fun res!159526 () Bool)

(assert (=> d!65475 (=> (not res!159526) (not e!131829))))

(declare-fun lt!297305 () tuple2!16504)

(assert (=> d!65475 (= res!159526 (invariant!0 (currentBit!9123 (_2!8897 lt!297305)) (currentByte!9128 (_2!8897 lt!297305)) (size!4373 (buf!4850 (_2!8897 lt!297305)))))))

(declare-fun e!131831 () tuple2!16504)

(assert (=> d!65475 (= lt!297305 e!131831)))

(declare-fun c!9662 () Bool)

(assert (=> d!65475 (= c!9662 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!65475 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!65475 (= (appendBitsLSBFirstLoopTR!0 (_2!8897 lt!296639) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!297305)))

(declare-fun b!191167 () Bool)

(declare-fun res!159529 () Bool)

(assert (=> b!191167 (=> (not res!159529) (not e!131829))))

(assert (=> b!191167 (= res!159529 (= (size!4373 (buf!4850 (_2!8897 lt!296639))) (size!4373 (buf!4850 (_2!8897 lt!297305)))))))

(declare-fun b!191168 () Bool)

(declare-fun res!159530 () Bool)

(assert (=> b!191168 (=> (not res!159530) (not e!131829))))

(assert (=> b!191168 (= res!159530 (isPrefixOf!0 (_2!8897 lt!296639) (_2!8897 lt!297305)))))

(declare-fun b!191169 () Bool)

(declare-fun lt!297293 () tuple2!16510)

(declare-fun lt!297322 () tuple2!16504)

(assert (=> b!191169 (= lt!297293 (readBitPure!0 (readerFrom!0 (_2!8897 lt!297322) (currentBit!9123 (_2!8897 lt!296639)) (currentByte!9128 (_2!8897 lt!296639)))))))

(declare-fun res!159533 () Bool)

(declare-fun lt!297321 () Bool)

(assert (=> b!191169 (= res!159533 (and (= (_2!8900 lt!297293) lt!297321) (= (_1!8900 lt!297293) (_2!8897 lt!297322))))))

(declare-fun e!131836 () Bool)

(assert (=> b!191169 (=> (not res!159533) (not e!131836))))

(declare-fun e!131835 () Bool)

(assert (=> b!191169 (= e!131835 e!131836)))

(declare-fun b!191170 () Bool)

(declare-fun res!159525 () Bool)

(assert (=> b!191170 (=> (not res!159525) (not e!131829))))

(declare-fun lt!297300 () (_ BitVec 64))

(declare-fun lt!297327 () (_ BitVec 64))

(assert (=> b!191170 (= res!159525 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297305))) (currentByte!9128 (_2!8897 lt!297305)) (currentBit!9123 (_2!8897 lt!297305))) (bvsub lt!297327 lt!297300)))))

(assert (=> b!191170 (or (= (bvand lt!297327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297327 lt!297300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191170 (= lt!297300 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!297319 () (_ BitVec 64))

(declare-fun lt!297330 () (_ BitVec 64))

(assert (=> b!191170 (= lt!297327 (bvadd lt!297319 lt!297330))))

(assert (=> b!191170 (or (not (= (bvand lt!297319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297330 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297319 lt!297330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191170 (= lt!297330 ((_ sign_extend 32) nBits!348))))

(assert (=> b!191170 (= lt!297319 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))))))

(declare-fun b!191171 () Bool)

(declare-fun e!131834 () Bool)

(declare-fun lt!297282 () tuple2!16506)

(declare-fun lt!297284 () tuple2!16508)

(assert (=> b!191171 (= e!131834 (= (_1!8898 lt!297282) (_2!8899 lt!297284)))))

(declare-fun b!191172 () Bool)

(declare-fun e!131832 () (_ BitVec 64))

(assert (=> b!191172 (= e!131832 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!191173 () Bool)

(declare-fun res!159528 () Bool)

(assert (=> b!191173 (= res!159528 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297322))) (currentByte!9128 (_2!8897 lt!297322)) (currentBit!9123 (_2!8897 lt!297322))) (bvadd (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!191173 (=> (not res!159528) (not e!131835))))

(declare-fun call!3041 () Bool)

(declare-fun bm!3038 () Bool)

(assert (=> bm!3038 (= call!3041 (isPrefixOf!0 (_2!8897 lt!296639) (ite c!9662 (_2!8897 lt!296639) (_2!8897 lt!297322))))))

(declare-fun b!191174 () Bool)

(assert (=> b!191174 (= e!131832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!191175 () Bool)

(declare-fun e!131830 () Bool)

(declare-fun lt!297291 () tuple2!16510)

(declare-fun lt!297320 () tuple2!16510)

(assert (=> b!191175 (= e!131830 (= (_2!8900 lt!297291) (_2!8900 lt!297320)))))

(declare-fun b!191176 () Bool)

(declare-fun e!131828 () Bool)

(declare-fun lt!297329 () (_ BitVec 64))

(assert (=> b!191176 (= e!131828 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!296639)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639))) lt!297329))))

(declare-fun b!191177 () Bool)

(declare-fun res!159532 () Bool)

(assert (=> b!191177 (= res!159532 call!3041)))

(assert (=> b!191177 (=> (not res!159532) (not e!131835))))

(declare-fun b!191178 () Bool)

(declare-fun lt!297275 () tuple2!16504)

(assert (=> b!191178 (= e!131831 (tuple2!16505 (_1!8897 lt!297275) (_2!8897 lt!297275)))))

(assert (=> b!191178 (= lt!297321 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191178 (= lt!297322 (appendBit!0 (_2!8897 lt!296639) lt!297321))))

(declare-fun res!159531 () Bool)

(assert (=> b!191178 (= res!159531 (= (size!4373 (buf!4850 (_2!8897 lt!296639))) (size!4373 (buf!4850 (_2!8897 lt!297322)))))))

(assert (=> b!191178 (=> (not res!159531) (not e!131835))))

(assert (=> b!191178 e!131835))

(declare-fun lt!297302 () tuple2!16504)

(assert (=> b!191178 (= lt!297302 lt!297322)))

(assert (=> b!191178 (= lt!297275 (appendBitsLSBFirstLoopTR!0 (_2!8897 lt!297302) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!297303 () Unit!13584)

(assert (=> b!191178 (= lt!297303 (lemmaIsPrefixTransitive!0 (_2!8897 lt!296639) (_2!8897 lt!297302) (_2!8897 lt!297275)))))

(assert (=> b!191178 (isPrefixOf!0 (_2!8897 lt!296639) (_2!8897 lt!297275))))

(declare-fun lt!297324 () Unit!13584)

(assert (=> b!191178 (= lt!297324 lt!297303)))

(assert (=> b!191178 (invariant!0 (currentBit!9123 (_2!8897 lt!296639)) (currentByte!9128 (_2!8897 lt!296639)) (size!4373 (buf!4850 (_2!8897 lt!297302))))))

(declare-fun lt!297309 () BitStream!7854)

(assert (=> b!191178 (= lt!297309 (BitStream!7855 (buf!4850 (_2!8897 lt!297302)) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))))))

(assert (=> b!191178 (invariant!0 (currentBit!9123 lt!297309) (currentByte!9128 lt!297309) (size!4373 (buf!4850 (_2!8897 lt!297275))))))

(declare-fun lt!297317 () BitStream!7854)

(assert (=> b!191178 (= lt!297317 (BitStream!7855 (buf!4850 (_2!8897 lt!297275)) (currentByte!9128 lt!297309) (currentBit!9123 lt!297309)))))

(assert (=> b!191178 (= lt!297291 (readBitPure!0 lt!297309))))

(assert (=> b!191178 (= lt!297320 (readBitPure!0 lt!297317))))

(declare-fun lt!297326 () Unit!13584)

(assert (=> b!191178 (= lt!297326 (readBitPrefixLemma!0 lt!297309 (_2!8897 lt!297275)))))

(declare-fun res!159527 () Bool)

(assert (=> b!191178 (= res!159527 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!297291))) (currentByte!9128 (_1!8900 lt!297291)) (currentBit!9123 (_1!8900 lt!297291))) (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!297320))) (currentByte!9128 (_1!8900 lt!297320)) (currentBit!9123 (_1!8900 lt!297320)))))))

(assert (=> b!191178 (=> (not res!159527) (not e!131830))))

(assert (=> b!191178 e!131830))

(declare-fun lt!297280 () Unit!13584)

(assert (=> b!191178 (= lt!297280 lt!297326)))

(declare-fun lt!297306 () tuple2!16508)

(assert (=> b!191178 (= lt!297306 (reader!0 (_2!8897 lt!296639) (_2!8897 lt!297275)))))

(declare-fun lt!297295 () tuple2!16508)

(assert (=> b!191178 (= lt!297295 (reader!0 (_2!8897 lt!297302) (_2!8897 lt!297275)))))

(declare-fun lt!297307 () tuple2!16510)

(assert (=> b!191178 (= lt!297307 (readBitPure!0 (_1!8899 lt!297306)))))

(assert (=> b!191178 (= (_2!8900 lt!297307) lt!297321)))

(declare-fun lt!297276 () Unit!13584)

(declare-fun Unit!13590 () Unit!13584)

(assert (=> b!191178 (= lt!297276 Unit!13590)))

(declare-fun lt!297328 () (_ BitVec 64))

(assert (=> b!191178 (= lt!297328 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297285 () (_ BitVec 64))

(assert (=> b!191178 (= lt!297285 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297301 () Unit!13584)

(assert (=> b!191178 (= lt!297301 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8897 lt!296639) (buf!4850 (_2!8897 lt!297275)) lt!297285))))

(assert (=> b!191178 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!297275)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639))) lt!297285)))

(declare-fun lt!297316 () Unit!13584)

(assert (=> b!191178 (= lt!297316 lt!297301)))

(declare-fun lt!297289 () tuple2!16506)

(assert (=> b!191178 (= lt!297289 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!297306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297328))))

(declare-fun lt!297315 () (_ BitVec 64))

(assert (=> b!191178 (= lt!297315 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!297283 () Unit!13584)

(assert (=> b!191178 (= lt!297283 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8897 lt!297302) (buf!4850 (_2!8897 lt!297275)) lt!297315))))

(assert (=> b!191178 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!297275)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!297302))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!297302))) lt!297315)))

(declare-fun lt!297313 () Unit!13584)

(assert (=> b!191178 (= lt!297313 lt!297283)))

(declare-fun lt!297311 () tuple2!16506)

(assert (=> b!191178 (= lt!297311 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!297295) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!297328 (ite (_2!8900 lt!297307) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!297287 () tuple2!16506)

(assert (=> b!191178 (= lt!297287 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!297306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297328))))

(declare-fun c!9663 () Bool)

(assert (=> b!191178 (= c!9663 (_2!8900 (readBitPure!0 (_1!8899 lt!297306))))))

(declare-fun lt!297314 () tuple2!16506)

(assert (=> b!191178 (= lt!297314 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8899 lt!297306) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!297328 e!131832)))))

(declare-fun lt!297278 () Unit!13584)

(assert (=> b!191178 (= lt!297278 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8899 lt!297306) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!297328))))

(assert (=> b!191178 (and (= (_2!8898 lt!297287) (_2!8898 lt!297314)) (= (_1!8898 lt!297287) (_1!8898 lt!297314)))))

(declare-fun lt!297304 () Unit!13584)

(assert (=> b!191178 (= lt!297304 lt!297278)))

(assert (=> b!191178 (= (_1!8899 lt!297306) (withMovedBitIndex!0 (_2!8899 lt!297306) (bvsub (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))) (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297275))) (currentByte!9128 (_2!8897 lt!297275)) (currentBit!9123 (_2!8897 lt!297275))))))))

(declare-fun lt!297299 () Unit!13584)

(declare-fun Unit!13591 () Unit!13584)

(assert (=> b!191178 (= lt!297299 Unit!13591)))

(assert (=> b!191178 (= (_1!8899 lt!297295) (withMovedBitIndex!0 (_2!8899 lt!297295) (bvsub (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297302))) (currentByte!9128 (_2!8897 lt!297302)) (currentBit!9123 (_2!8897 lt!297302))) (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297275))) (currentByte!9128 (_2!8897 lt!297275)) (currentBit!9123 (_2!8897 lt!297275))))))))

(declare-fun lt!297310 () Unit!13584)

(declare-fun Unit!13592 () Unit!13584)

(assert (=> b!191178 (= lt!297310 Unit!13592)))

(assert (=> b!191178 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))) (bvsub (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297302))) (currentByte!9128 (_2!8897 lt!297302)) (currentBit!9123 (_2!8897 lt!297302))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!297308 () Unit!13584)

(declare-fun Unit!13593 () Unit!13584)

(assert (=> b!191178 (= lt!297308 Unit!13593)))

(assert (=> b!191178 (= (_2!8898 lt!297289) (_2!8898 lt!297311))))

(declare-fun lt!297281 () Unit!13584)

(declare-fun Unit!13594 () Unit!13584)

(assert (=> b!191178 (= lt!297281 Unit!13594)))

(assert (=> b!191178 (invariant!0 (currentBit!9123 (_2!8897 lt!297275)) (currentByte!9128 (_2!8897 lt!297275)) (size!4373 (buf!4850 (_2!8897 lt!297275))))))

(declare-fun lt!297277 () Unit!13584)

(declare-fun Unit!13595 () Unit!13584)

(assert (=> b!191178 (= lt!297277 Unit!13595)))

(assert (=> b!191178 (= (size!4373 (buf!4850 (_2!8897 lt!296639))) (size!4373 (buf!4850 (_2!8897 lt!297275))))))

(declare-fun lt!297312 () Unit!13584)

(declare-fun Unit!13596 () Unit!13584)

(assert (=> b!191178 (= lt!297312 Unit!13596)))

(assert (=> b!191178 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297275))) (currentByte!9128 (_2!8897 lt!297275)) (currentBit!9123 (_2!8897 lt!297275))) (bvsub (bvadd (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297325 () Unit!13584)

(declare-fun Unit!13597 () Unit!13584)

(assert (=> b!191178 (= lt!297325 Unit!13597)))

(declare-fun lt!297294 () Unit!13584)

(declare-fun Unit!13598 () Unit!13584)

(assert (=> b!191178 (= lt!297294 Unit!13598)))

(assert (=> b!191178 (= lt!297284 (reader!0 (_2!8897 lt!296639) (_2!8897 lt!297275)))))

(declare-fun lt!297318 () (_ BitVec 64))

(assert (=> b!191178 (= lt!297318 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!297292 () Unit!13584)

(assert (=> b!191178 (= lt!297292 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8897 lt!296639) (buf!4850 (_2!8897 lt!297275)) lt!297318))))

(assert (=> b!191178 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!297275)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639))) lt!297318)))

(declare-fun lt!297290 () Unit!13584)

(assert (=> b!191178 (= lt!297290 lt!297292)))

(assert (=> b!191178 (= lt!297282 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!297284) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!159524 () Bool)

(assert (=> b!191178 (= res!159524 (= (_2!8898 lt!297282) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!191178 (=> (not res!159524) (not e!131834))))

(assert (=> b!191178 e!131834))

(declare-fun lt!297288 () Unit!13584)

(declare-fun Unit!13599 () Unit!13584)

(assert (=> b!191178 (= lt!297288 Unit!13599)))

(declare-fun b!191179 () Bool)

(declare-fun e!131833 () Bool)

(assert (=> b!191179 (= e!131829 e!131833)))

(declare-fun res!159534 () Bool)

(assert (=> b!191179 (=> (not res!159534) (not e!131833))))

(declare-fun lt!297298 () tuple2!16506)

(assert (=> b!191179 (= res!159534 (= (_2!8898 lt!297298) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!297279 () tuple2!16508)

(assert (=> b!191179 (= lt!297298 (readNBitsLSBFirstsLoopPure!0 (_1!8899 lt!297279) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!297297 () Unit!13584)

(declare-fun lt!297286 () Unit!13584)

(assert (=> b!191179 (= lt!297297 lt!297286)))

(assert (=> b!191179 (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8897 lt!297305)))) ((_ sign_extend 32) (currentByte!9128 (_2!8897 lt!296639))) ((_ sign_extend 32) (currentBit!9123 (_2!8897 lt!296639))) lt!297329)))

(assert (=> b!191179 (= lt!297286 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8897 lt!296639) (buf!4850 (_2!8897 lt!297305)) lt!297329))))

(assert (=> b!191179 e!131828))

(declare-fun res!159523 () Bool)

(assert (=> b!191179 (=> (not res!159523) (not e!131828))))

(assert (=> b!191179 (= res!159523 (and (= (size!4373 (buf!4850 (_2!8897 lt!296639))) (size!4373 (buf!4850 (_2!8897 lt!297305)))) (bvsge lt!297329 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191179 (= lt!297329 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!191179 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!191179 (= lt!297279 (reader!0 (_2!8897 lt!296639) (_2!8897 lt!297305)))))

(declare-fun b!191180 () Bool)

(assert (=> b!191180 (= e!131836 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8900 lt!297293))) (currentByte!9128 (_1!8900 lt!297293)) (currentBit!9123 (_1!8900 lt!297293))) (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!297322))) (currentByte!9128 (_2!8897 lt!297322)) (currentBit!9123 (_2!8897 lt!297322)))))))

(declare-fun b!191181 () Bool)

(assert (=> b!191181 (= e!131833 (= (_1!8898 lt!297298) (_2!8899 lt!297279)))))

(declare-fun b!191182 () Bool)

(declare-fun Unit!13600 () Unit!13584)

(assert (=> b!191182 (= e!131831 (tuple2!16505 Unit!13600 (_2!8897 lt!296639)))))

(declare-fun lt!297323 () Unit!13584)

(assert (=> b!191182 (= lt!297323 (lemmaIsPrefixRefl!0 (_2!8897 lt!296639)))))

(assert (=> b!191182 call!3041))

(declare-fun lt!297296 () Unit!13584)

(assert (=> b!191182 (= lt!297296 lt!297323)))

(assert (= (and d!65475 c!9662) b!191182))

(assert (= (and d!65475 (not c!9662)) b!191178))

(assert (= (and b!191178 res!159531) b!191173))

(assert (= (and b!191173 res!159528) b!191177))

(assert (= (and b!191177 res!159532) b!191169))

(assert (= (and b!191169 res!159533) b!191180))

(assert (= (and b!191178 res!159527) b!191175))

(assert (= (and b!191178 c!9663) b!191172))

(assert (= (and b!191178 (not c!9663)) b!191174))

(assert (= (and b!191178 res!159524) b!191171))

(assert (= (or b!191182 b!191177) bm!3038))

(assert (= (and d!65475 res!159526) b!191167))

(assert (= (and b!191167 res!159529) b!191170))

(assert (= (and b!191170 res!159525) b!191168))

(assert (= (and b!191168 res!159530) b!191179))

(assert (= (and b!191179 res!159523) b!191176))

(assert (= (and b!191179 res!159534) b!191181))

(declare-fun m!296963 () Bool)

(assert (=> b!191173 m!296963))

(assert (=> b!191173 m!296517))

(declare-fun m!296965 () Bool)

(assert (=> d!65475 m!296965))

(declare-fun m!296967 () Bool)

(assert (=> b!191169 m!296967))

(assert (=> b!191169 m!296967))

(declare-fun m!296969 () Bool)

(assert (=> b!191169 m!296969))

(declare-fun m!296971 () Bool)

(assert (=> b!191170 m!296971))

(assert (=> b!191170 m!296517))

(declare-fun m!296973 () Bool)

(assert (=> b!191178 m!296973))

(declare-fun m!296975 () Bool)

(assert (=> b!191178 m!296975))

(declare-fun m!296977 () Bool)

(assert (=> b!191178 m!296977))

(declare-fun m!296979 () Bool)

(assert (=> b!191178 m!296979))

(declare-fun m!296981 () Bool)

(assert (=> b!191178 m!296981))

(declare-fun m!296983 () Bool)

(assert (=> b!191178 m!296983))

(declare-fun m!296985 () Bool)

(assert (=> b!191178 m!296985))

(declare-fun m!296987 () Bool)

(assert (=> b!191178 m!296987))

(declare-fun m!296989 () Bool)

(assert (=> b!191178 m!296989))

(declare-fun m!296991 () Bool)

(assert (=> b!191178 m!296991))

(declare-fun m!296993 () Bool)

(assert (=> b!191178 m!296993))

(declare-fun m!296995 () Bool)

(assert (=> b!191178 m!296995))

(declare-fun m!296997 () Bool)

(assert (=> b!191178 m!296997))

(assert (=> b!191178 m!296983))

(declare-fun m!296999 () Bool)

(assert (=> b!191178 m!296999))

(declare-fun m!297001 () Bool)

(assert (=> b!191178 m!297001))

(declare-fun m!297003 () Bool)

(assert (=> b!191178 m!297003))

(declare-fun m!297005 () Bool)

(assert (=> b!191178 m!297005))

(declare-fun m!297007 () Bool)

(assert (=> b!191178 m!297007))

(declare-fun m!297009 () Bool)

(assert (=> b!191178 m!297009))

(declare-fun m!297011 () Bool)

(assert (=> b!191178 m!297011))

(declare-fun m!297013 () Bool)

(assert (=> b!191178 m!297013))

(declare-fun m!297015 () Bool)

(assert (=> b!191178 m!297015))

(declare-fun m!297017 () Bool)

(assert (=> b!191178 m!297017))

(declare-fun m!297019 () Bool)

(assert (=> b!191178 m!297019))

(declare-fun m!297021 () Bool)

(assert (=> b!191178 m!297021))

(declare-fun m!297023 () Bool)

(assert (=> b!191178 m!297023))

(declare-fun m!297025 () Bool)

(assert (=> b!191178 m!297025))

(assert (=> b!191178 m!296517))

(declare-fun m!297027 () Bool)

(assert (=> b!191178 m!297027))

(declare-fun m!297029 () Bool)

(assert (=> b!191178 m!297029))

(declare-fun m!297031 () Bool)

(assert (=> b!191178 m!297031))

(declare-fun m!297033 () Bool)

(assert (=> b!191178 m!297033))

(declare-fun m!297035 () Bool)

(assert (=> b!191178 m!297035))

(declare-fun m!297037 () Bool)

(assert (=> b!191178 m!297037))

(declare-fun m!297039 () Bool)

(assert (=> b!191176 m!297039))

(declare-fun m!297041 () Bool)

(assert (=> b!191168 m!297041))

(declare-fun m!297043 () Bool)

(assert (=> b!191179 m!297043))

(assert (=> b!191179 m!297015))

(assert (=> b!191179 m!297023))

(declare-fun m!297045 () Bool)

(assert (=> b!191179 m!297045))

(declare-fun m!297047 () Bool)

(assert (=> b!191179 m!297047))

(declare-fun m!297049 () Bool)

(assert (=> b!191179 m!297049))

(declare-fun m!297051 () Bool)

(assert (=> bm!3038 m!297051))

(declare-fun m!297053 () Bool)

(assert (=> b!191180 m!297053))

(assert (=> b!191180 m!296963))

(assert (=> b!191182 m!296677))

(assert (=> b!190889 d!65475))

(assert (=> b!190900 d!65467))

(declare-fun d!65583 () Bool)

(assert (=> d!65583 (= (invariant!0 (currentBit!9123 (_2!8897 lt!296619)) (currentByte!9128 (_2!8897 lt!296619)) (size!4373 (buf!4850 (_2!8897 lt!296619)))) (and (bvsge (currentBit!9123 (_2!8897 lt!296619)) #b00000000000000000000000000000000) (bvslt (currentBit!9123 (_2!8897 lt!296619)) #b00000000000000000000000000001000) (bvsge (currentByte!9128 (_2!8897 lt!296619)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9128 (_2!8897 lt!296619)) (size!4373 (buf!4850 (_2!8897 lt!296619)))) (and (= (currentBit!9123 (_2!8897 lt!296619)) #b00000000000000000000000000000000) (= (currentByte!9128 (_2!8897 lt!296619)) (size!4373 (buf!4850 (_2!8897 lt!296619))))))))))

(assert (=> b!190895 d!65583))

(declare-fun d!65585 () Bool)

(assert (=> d!65585 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8899 lt!296631)))) ((_ sign_extend 32) (currentByte!9128 (_1!8899 lt!296631))) ((_ sign_extend 32) (currentBit!9123 (_1!8899 lt!296631))) lt!296630) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8899 lt!296631)))) ((_ sign_extend 32) (currentByte!9128 (_1!8899 lt!296631))) ((_ sign_extend 32) (currentBit!9123 (_1!8899 lt!296631)))) lt!296630))))

(declare-fun bs!16295 () Bool)

(assert (= bs!16295 d!65585))

(declare-fun m!297055 () Bool)

(assert (=> bs!16295 m!297055))

(assert (=> b!190885 d!65585))

(declare-fun d!65587 () Bool)

(declare-fun res!159537 () Bool)

(declare-fun e!131838 () Bool)

(assert (=> d!65587 (=> (not res!159537) (not e!131838))))

(assert (=> d!65587 (= res!159537 (= (size!4373 (buf!4850 (_2!8897 lt!296639))) (size!4373 (buf!4850 (_2!8897 lt!296619)))))))

(assert (=> d!65587 (= (isPrefixOf!0 (_2!8897 lt!296639) (_2!8897 lt!296619)) e!131838)))

(declare-fun b!191183 () Bool)

(declare-fun res!159536 () Bool)

(assert (=> b!191183 (=> (not res!159536) (not e!131838))))

(assert (=> b!191183 (= res!159536 (bvsle (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639))) (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296619))) (currentByte!9128 (_2!8897 lt!296619)) (currentBit!9123 (_2!8897 lt!296619)))))))

(declare-fun b!191184 () Bool)

(declare-fun e!131837 () Bool)

(assert (=> b!191184 (= e!131838 e!131837)))

(declare-fun res!159535 () Bool)

(assert (=> b!191184 (=> res!159535 e!131837)))

(assert (=> b!191184 (= res!159535 (= (size!4373 (buf!4850 (_2!8897 lt!296639))) #b00000000000000000000000000000000))))

(declare-fun b!191185 () Bool)

(assert (=> b!191185 (= e!131837 (arrayBitRangesEq!0 (buf!4850 (_2!8897 lt!296639)) (buf!4850 (_2!8897 lt!296619)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4373 (buf!4850 (_2!8897 lt!296639))) (currentByte!9128 (_2!8897 lt!296639)) (currentBit!9123 (_2!8897 lt!296639)))))))

(assert (= (and d!65587 res!159537) b!191183))

(assert (= (and b!191183 res!159536) b!191184))

(assert (= (and b!191184 (not res!159535)) b!191185))

(assert (=> b!191183 m!296517))

(assert (=> b!191183 m!296503))

(assert (=> b!191185 m!296517))

(assert (=> b!191185 m!296517))

(declare-fun m!297057 () Bool)

(assert (=> b!191185 m!297057))

(assert (=> b!190896 d!65587))

(declare-fun d!65589 () Bool)

(assert (=> d!65589 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4373 (buf!4850 thiss!1204))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204)) lt!296630) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 thiss!1204))) ((_ sign_extend 32) (currentByte!9128 thiss!1204)) ((_ sign_extend 32) (currentBit!9123 thiss!1204))) lt!296630))))

(declare-fun bs!16296 () Bool)

(assert (= bs!16296 d!65589))

(assert (=> bs!16296 m!296763))

(assert (=> b!190897 d!65589))

(assert (=> b!190893 d!65449))

(assert (=> b!190893 d!65451))

(declare-fun d!65591 () Bool)

(assert (=> d!65591 (= (array_inv!4114 (buf!4850 thiss!1204)) (bvsge (size!4373 (buf!4850 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!190883 d!65591))

(declare-fun d!65593 () Bool)

(declare-fun e!131839 () Bool)

(assert (=> d!65593 e!131839))

(declare-fun res!159538 () Bool)

(assert (=> d!65593 (=> (not res!159538) (not e!131839))))

(declare-fun lt!297332 () (_ BitVec 64))

(declare-fun lt!297331 () BitStream!7854)

(assert (=> d!65593 (= res!159538 (= (bvadd lt!297332 (bvsub lt!296621 lt!296629)) (bitIndex!0 (size!4373 (buf!4850 lt!297331)) (currentByte!9128 lt!297331) (currentBit!9123 lt!297331))))))

(assert (=> d!65593 (or (not (= (bvand lt!297332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!296621 lt!296629) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!297332 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!297332 (bvsub lt!296621 lt!296629)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65593 (= lt!297332 (bitIndex!0 (size!4373 (buf!4850 (_2!8899 lt!296632))) (currentByte!9128 (_2!8899 lt!296632)) (currentBit!9123 (_2!8899 lt!296632))))))

(assert (=> d!65593 (= lt!297331 (_2!8897 (moveBitIndex!0 (_2!8899 lt!296632) (bvsub lt!296621 lt!296629))))))

(assert (=> d!65593 (moveBitIndexPrecond!0 (_2!8899 lt!296632) (bvsub lt!296621 lt!296629))))

(assert (=> d!65593 (= (withMovedBitIndex!0 (_2!8899 lt!296632) (bvsub lt!296621 lt!296629)) lt!297331)))

(declare-fun b!191186 () Bool)

(assert (=> b!191186 (= e!131839 (= (size!4373 (buf!4850 (_2!8899 lt!296632))) (size!4373 (buf!4850 lt!297331))))))

(assert (= (and d!65593 res!159538) b!191186))

(declare-fun m!297059 () Bool)

(assert (=> d!65593 m!297059))

(declare-fun m!297061 () Bool)

(assert (=> d!65593 m!297061))

(declare-fun m!297063 () Bool)

(assert (=> d!65593 m!297063))

(declare-fun m!297065 () Bool)

(assert (=> d!65593 m!297065))

(assert (=> b!190894 d!65593))

(declare-fun d!65595 () Bool)

(assert (=> d!65595 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9123 thiss!1204) (currentByte!9128 thiss!1204) (size!4373 (buf!4850 thiss!1204))))))

(declare-fun bs!16297 () Bool)

(assert (= bs!16297 d!65595))

(assert (=> bs!16297 m!296501))

(assert (=> start!41134 d!65595))

(declare-fun d!65597 () Bool)

(declare-fun e!131840 () Bool)

(assert (=> d!65597 e!131840))

(declare-fun res!159540 () Bool)

(assert (=> d!65597 (=> (not res!159540) (not e!131840))))

(declare-fun lt!297337 () (_ BitVec 64))

(declare-fun lt!297333 () (_ BitVec 64))

(declare-fun lt!297336 () (_ BitVec 64))

(assert (=> d!65597 (= res!159540 (= lt!297333 (bvsub lt!297337 lt!297336)))))

(assert (=> d!65597 (or (= (bvand lt!297337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297337 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297337 lt!297336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65597 (= lt!297336 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8898 lt!296625)))) ((_ sign_extend 32) (currentByte!9128 (_1!8898 lt!296625))) ((_ sign_extend 32) (currentBit!9123 (_1!8898 lt!296625)))))))

(declare-fun lt!297335 () (_ BitVec 64))

(declare-fun lt!297338 () (_ BitVec 64))

(assert (=> d!65597 (= lt!297337 (bvmul lt!297335 lt!297338))))

(assert (=> d!65597 (or (= lt!297335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297338 (bvsdiv (bvmul lt!297335 lt!297338) lt!297335)))))

(assert (=> d!65597 (= lt!297338 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65597 (= lt!297335 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8898 lt!296625)))))))

(assert (=> d!65597 (= lt!297333 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 (_1!8898 lt!296625))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 (_1!8898 lt!296625)))))))

(assert (=> d!65597 (invariant!0 (currentBit!9123 (_1!8898 lt!296625)) (currentByte!9128 (_1!8898 lt!296625)) (size!4373 (buf!4850 (_1!8898 lt!296625))))))

(assert (=> d!65597 (= (bitIndex!0 (size!4373 (buf!4850 (_1!8898 lt!296625))) (currentByte!9128 (_1!8898 lt!296625)) (currentBit!9123 (_1!8898 lt!296625))) lt!297333)))

(declare-fun b!191187 () Bool)

(declare-fun res!159539 () Bool)

(assert (=> b!191187 (=> (not res!159539) (not e!131840))))

(assert (=> b!191187 (= res!159539 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297333))))

(declare-fun b!191188 () Bool)

(declare-fun lt!297334 () (_ BitVec 64))

(assert (=> b!191188 (= e!131840 (bvsle lt!297333 (bvmul lt!297334 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191188 (or (= lt!297334 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297334 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297334)))))

(assert (=> b!191188 (= lt!297334 ((_ sign_extend 32) (size!4373 (buf!4850 (_1!8898 lt!296625)))))))

(assert (= (and d!65597 res!159540) b!191187))

(assert (= (and b!191187 res!159539) b!191188))

(declare-fun m!297067 () Bool)

(assert (=> d!65597 m!297067))

(declare-fun m!297069 () Bool)

(assert (=> d!65597 m!297069))

(assert (=> b!190884 d!65597))

(declare-fun d!65599 () Bool)

(declare-fun e!131841 () Bool)

(assert (=> d!65599 e!131841))

(declare-fun res!159542 () Bool)

(assert (=> d!65599 (=> (not res!159542) (not e!131841))))

(declare-fun lt!297339 () (_ BitVec 64))

(declare-fun lt!297343 () (_ BitVec 64))

(declare-fun lt!297342 () (_ BitVec 64))

(assert (=> d!65599 (= res!159542 (= lt!297339 (bvsub lt!297343 lt!297342)))))

(assert (=> d!65599 (or (= (bvand lt!297343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!297342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!297343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!297343 lt!297342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!65599 (= lt!297342 (remainingBits!0 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8899 lt!296631)))) ((_ sign_extend 32) (currentByte!9128 (_2!8899 lt!296631))) ((_ sign_extend 32) (currentBit!9123 (_2!8899 lt!296631)))))))

(declare-fun lt!297341 () (_ BitVec 64))

(declare-fun lt!297344 () (_ BitVec 64))

(assert (=> d!65599 (= lt!297343 (bvmul lt!297341 lt!297344))))

(assert (=> d!65599 (or (= lt!297341 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!297344 (bvsdiv (bvmul lt!297341 lt!297344) lt!297341)))))

(assert (=> d!65599 (= lt!297344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!65599 (= lt!297341 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8899 lt!296631)))))))

(assert (=> d!65599 (= lt!297339 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9128 (_2!8899 lt!296631))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9123 (_2!8899 lt!296631)))))))

(assert (=> d!65599 (invariant!0 (currentBit!9123 (_2!8899 lt!296631)) (currentByte!9128 (_2!8899 lt!296631)) (size!4373 (buf!4850 (_2!8899 lt!296631))))))

(assert (=> d!65599 (= (bitIndex!0 (size!4373 (buf!4850 (_2!8899 lt!296631))) (currentByte!9128 (_2!8899 lt!296631)) (currentBit!9123 (_2!8899 lt!296631))) lt!297339)))

(declare-fun b!191189 () Bool)

(declare-fun res!159541 () Bool)

(assert (=> b!191189 (=> (not res!159541) (not e!131841))))

(assert (=> b!191189 (= res!159541 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!297339))))

(declare-fun b!191190 () Bool)

(declare-fun lt!297340 () (_ BitVec 64))

(assert (=> b!191190 (= e!131841 (bvsle lt!297339 (bvmul lt!297340 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!191190 (or (= lt!297340 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!297340 #b0000000000000000000000000000000000000000000000000000000000001000) lt!297340)))))

(assert (=> b!191190 (= lt!297340 ((_ sign_extend 32) (size!4373 (buf!4850 (_2!8899 lt!296631)))))))

(assert (= (and d!65599 res!159542) b!191189))

(assert (= (and b!191189 res!159541) b!191190))

(declare-fun m!297071 () Bool)

(assert (=> d!65599 m!297071))

(declare-fun m!297073 () Bool)

(assert (=> d!65599 m!297073))

(assert (=> b!190884 d!65599))

(check-sat (not b!191003) (not d!65419) (not b!191169) (not b!191170) (not b!191185) (not d!65461) (not d!65437) (not b!191176) (not d!65413) (not d!65421) (not d!65415) (not b!190993) (not b!191037) (not d!65429) (not d!65473) (not d!65435) (not b!191180) (not d!65455) (not d!65459) (not d!65411) (not b!191042) (not b!191000) (not d!65451) (not d!65417) (not b!191039) (not d!65431) (not b!191044) (not d!65427) (not d!65423) (not b!191183) (not b!190990) (not d!65593) (not b!191182) (not b!191002) (not d!65469) (not d!65599) (not b!191178) (not d!65463) (not d!65439) (not b!191030) (not d!65585) (not b!191026) (not d!65449) (not d!65595) (not d!65443) (not b!190992) (not b!191168) (not d!65597) (not b!191004) (not bm!3038) (not b!191023) (not d!65457) (not b!191025) (not d!65475) (not d!65453) (not b!191024) (not d!65589) (not b!190994) (not d!65425) (not d!65445) (not b!191179) (not b!191173))
(check-sat)
