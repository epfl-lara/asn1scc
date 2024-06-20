; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53742 () Bool)

(assert start!53742)

(declare-fun b!250293 () Bool)

(declare-fun res!209529 () Bool)

(declare-fun e!173495 () Bool)

(assert (=> b!250293 (=> (not res!209529) (not e!173495))))

(declare-datatypes ((array!13651 0))(
  ( (array!13652 (arr!6976 (Array (_ BitVec 32) (_ BitVec 8))) (size!5989 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10900 0))(
  ( (BitStream!10901 (buf!6482 array!13651) (currentByte!11913 (_ BitVec 32)) (currentBit!11908 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10900)

(declare-datatypes ((Unit!18114 0))(
  ( (Unit!18115) )
))
(declare-datatypes ((tuple2!21486 0))(
  ( (tuple2!21487 (_1!11668 Unit!18114) (_2!11668 BitStream!10900)) )
))
(declare-fun lt!388868 () tuple2!21486)

(declare-fun isPrefixOf!0 (BitStream!10900 BitStream!10900) Bool)

(assert (=> b!250293 (= res!209529 (isPrefixOf!0 thiss!1005 (_2!11668 lt!388868)))))

(declare-fun res!209528 () Bool)

(declare-fun e!173493 () Bool)

(assert (=> start!53742 (=> (not res!209528) (not e!173493))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53742 (= res!209528 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53742 e!173493))

(assert (=> start!53742 true))

(declare-fun e!173494 () Bool)

(declare-fun inv!12 (BitStream!10900) Bool)

(assert (=> start!53742 (and (inv!12 thiss!1005) e!173494)))

(declare-fun b!250294 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250294 (= e!173493 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005)))))))

(declare-fun e!173496 () Bool)

(assert (=> b!250294 e!173496))

(declare-fun res!209531 () Bool)

(assert (=> b!250294 (=> (not res!209531) (not e!173496))))

(declare-fun lt!388867 () tuple2!21486)

(assert (=> b!250294 (= res!209531 (isPrefixOf!0 thiss!1005 (_2!11668 lt!388867)))))

(declare-fun lt!388861 () Unit!18114)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10900 BitStream!10900 BitStream!10900) Unit!18114)

(assert (=> b!250294 (= lt!388861 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11668 lt!388868) (_2!11668 lt!388867)))))

(declare-fun e!173497 () Bool)

(assert (=> b!250294 e!173497))

(declare-fun res!209525 () Bool)

(assert (=> b!250294 (=> (not res!209525) (not e!173497))))

(assert (=> b!250294 (= res!209525 (= (size!5989 (buf!6482 (_2!11668 lt!388868))) (size!5989 (buf!6482 (_2!11668 lt!388867)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10900 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21486)

(assert (=> b!250294 (= lt!388867 (appendNBitsLoop!0 (_2!11668 lt!388868) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250294 (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388863 () Unit!18114)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10900 BitStream!10900 (_ BitVec 64) (_ BitVec 64)) Unit!18114)

(assert (=> b!250294 (= lt!388863 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11668 lt!388868) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173492 () Bool)

(assert (=> b!250294 e!173492))

(declare-fun res!209530 () Bool)

(assert (=> b!250294 (=> (not res!209530) (not e!173492))))

(assert (=> b!250294 (= res!209530 (= (size!5989 (buf!6482 thiss!1005)) (size!5989 (buf!6482 (_2!11668 lt!388868)))))))

(declare-fun appendBit!0 (BitStream!10900 Bool) tuple2!21486)

(assert (=> b!250294 (= lt!388868 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250295 () Bool)

(declare-fun e!173490 () Bool)

(assert (=> b!250295 (= e!173495 e!173490)))

(declare-fun res!209533 () Bool)

(assert (=> b!250295 (=> (not res!209533) (not e!173490))))

(declare-datatypes ((tuple2!21488 0))(
  ( (tuple2!21489 (_1!11669 BitStream!10900) (_2!11669 Bool)) )
))
(declare-fun lt!388862 () tuple2!21488)

(assert (=> b!250295 (= res!209533 (and (= (_2!11669 lt!388862) bit!26) (= (_1!11669 lt!388862) (_2!11668 lt!388868))))))

(declare-fun readBitPure!0 (BitStream!10900) tuple2!21488)

(declare-fun readerFrom!0 (BitStream!10900 (_ BitVec 32) (_ BitVec 32)) BitStream!10900)

(assert (=> b!250295 (= lt!388862 (readBitPure!0 (readerFrom!0 (_2!11668 lt!388868) (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005))))))

(declare-fun b!250296 () Bool)

(declare-fun res!209527 () Bool)

(assert (=> b!250296 (=> (not res!209527) (not e!173493))))

(assert (=> b!250296 (= res!209527 (bvslt from!289 nBits!297))))

(declare-fun b!250297 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250297 (= e!173496 (invariant!0 (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005) (size!5989 (buf!6482 (_2!11668 lt!388868)))))))

(declare-fun b!250298 () Bool)

(declare-fun array_inv!5730 (array!13651) Bool)

(assert (=> b!250298 (= e!173494 (array_inv!5730 (buf!6482 thiss!1005)))))

(declare-fun b!250299 () Bool)

(declare-fun e!173491 () Bool)

(declare-fun lt!388865 () tuple2!21488)

(declare-datatypes ((tuple2!21490 0))(
  ( (tuple2!21491 (_1!11670 BitStream!10900) (_2!11670 BitStream!10900)) )
))
(declare-fun lt!388869 () tuple2!21490)

(assert (=> b!250299 (= e!173491 (not (or (not (_2!11669 lt!388865)) (not (= (_1!11669 lt!388865) (_2!11670 lt!388869))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10900 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21488)

(assert (=> b!250299 (= lt!388865 (checkBitsLoopPure!0 (_1!11670 lt!388869) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388866 () (_ BitVec 64))

(assert (=> b!250299 (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388867)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) lt!388866)))

(declare-fun lt!388864 () Unit!18114)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10900 array!13651 (_ BitVec 64)) Unit!18114)

(assert (=> b!250299 (= lt!388864 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11668 lt!388868) (buf!6482 (_2!11668 lt!388867)) lt!388866))))

(declare-fun reader!0 (BitStream!10900 BitStream!10900) tuple2!21490)

(assert (=> b!250299 (= lt!388869 (reader!0 (_2!11668 lt!388868) (_2!11668 lt!388867)))))

(declare-fun b!250300 () Bool)

(declare-fun res!209535 () Bool)

(assert (=> b!250300 (=> (not res!209535) (not e!173491))))

(assert (=> b!250300 (= res!209535 (isPrefixOf!0 (_2!11668 lt!388868) (_2!11668 lt!388867)))))

(declare-fun b!250301 () Bool)

(declare-fun lt!388859 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250301 (= e!173490 (= (bitIndex!0 (size!5989 (buf!6482 (_1!11669 lt!388862))) (currentByte!11913 (_1!11669 lt!388862)) (currentBit!11908 (_1!11669 lt!388862))) lt!388859))))

(declare-fun b!250302 () Bool)

(assert (=> b!250302 (= e!173492 e!173495)))

(declare-fun res!209532 () Bool)

(assert (=> b!250302 (=> (not res!209532) (not e!173495))))

(declare-fun lt!388860 () (_ BitVec 64))

(assert (=> b!250302 (= res!209532 (= lt!388859 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388860)))))

(assert (=> b!250302 (= lt!388859 (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))))))

(assert (=> b!250302 (= lt!388860 (bitIndex!0 (size!5989 (buf!6482 thiss!1005)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005)))))

(declare-fun b!250303 () Bool)

(declare-fun res!209534 () Bool)

(assert (=> b!250303 (=> (not res!209534) (not e!173493))))

(assert (=> b!250303 (= res!209534 (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 thiss!1005))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250304 () Bool)

(assert (=> b!250304 (= e!173497 e!173491)))

(declare-fun res!209526 () Bool)

(assert (=> b!250304 (=> (not res!209526) (not e!173491))))

(assert (=> b!250304 (= res!209526 (= (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388867))) (currentByte!11913 (_2!11668 lt!388867)) (currentBit!11908 (_2!11668 lt!388867))) (bvadd (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))) lt!388866)))))

(assert (=> b!250304 (= lt!388866 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!53742 res!209528) b!250303))

(assert (= (and b!250303 res!209534) b!250296))

(assert (= (and b!250296 res!209527) b!250294))

(assert (= (and b!250294 res!209530) b!250302))

(assert (= (and b!250302 res!209532) b!250293))

(assert (= (and b!250293 res!209529) b!250295))

(assert (= (and b!250295 res!209533) b!250301))

(assert (= (and b!250294 res!209525) b!250304))

(assert (= (and b!250304 res!209526) b!250300))

(assert (= (and b!250300 res!209535) b!250299))

(assert (= (and b!250294 res!209531) b!250297))

(assert (= start!53742 b!250298))

(declare-fun m!376743 () Bool)

(assert (=> b!250304 m!376743))

(declare-fun m!376745 () Bool)

(assert (=> b!250304 m!376745))

(declare-fun m!376747 () Bool)

(assert (=> start!53742 m!376747))

(declare-fun m!376749 () Bool)

(assert (=> b!250301 m!376749))

(declare-fun m!376751 () Bool)

(assert (=> b!250299 m!376751))

(declare-fun m!376753 () Bool)

(assert (=> b!250299 m!376753))

(declare-fun m!376755 () Bool)

(assert (=> b!250299 m!376755))

(declare-fun m!376757 () Bool)

(assert (=> b!250299 m!376757))

(declare-fun m!376759 () Bool)

(assert (=> b!250294 m!376759))

(declare-fun m!376761 () Bool)

(assert (=> b!250294 m!376761))

(declare-fun m!376763 () Bool)

(assert (=> b!250294 m!376763))

(declare-fun m!376765 () Bool)

(assert (=> b!250294 m!376765))

(declare-fun m!376767 () Bool)

(assert (=> b!250294 m!376767))

(declare-fun m!376769 () Bool)

(assert (=> b!250294 m!376769))

(declare-fun m!376771 () Bool)

(assert (=> b!250294 m!376771))

(declare-fun m!376773 () Bool)

(assert (=> b!250297 m!376773))

(declare-fun m!376775 () Bool)

(assert (=> b!250293 m!376775))

(declare-fun m!376777 () Bool)

(assert (=> b!250300 m!376777))

(declare-fun m!376779 () Bool)

(assert (=> b!250298 m!376779))

(declare-fun m!376781 () Bool)

(assert (=> b!250295 m!376781))

(assert (=> b!250295 m!376781))

(declare-fun m!376783 () Bool)

(assert (=> b!250295 m!376783))

(declare-fun m!376785 () Bool)

(assert (=> b!250303 m!376785))

(assert (=> b!250302 m!376745))

(declare-fun m!376787 () Bool)

(assert (=> b!250302 m!376787))

(push 1)

(assert (not b!250302))

(assert (not b!250301))

(assert (not b!250304))

(assert (not b!250298))

(assert (not b!250293))

(assert (not b!250300))

(assert (not b!250297))

(assert (not start!53742))

(assert (not b!250295))

(assert (not b!250299))

(assert (not b!250303))

(assert (not b!250294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83788 () Bool)

(declare-fun e!173586 () Bool)

(assert (=> d!83788 e!173586))

(declare-fun res!209657 () Bool)

(assert (=> d!83788 (=> (not res!209657) (not e!173586))))

(declare-fun lt!389066 () (_ BitVec 64))

(declare-fun lt!389070 () (_ BitVec 64))

(declare-fun lt!389069 () (_ BitVec 64))

(assert (=> d!83788 (= res!209657 (= lt!389066 (bvsub lt!389069 lt!389070)))))

(assert (=> d!83788 (or (= (bvand lt!389069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389070 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389069 lt!389070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83788 (= lt!389070 (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388867)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388867))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388867)))))))

(declare-fun lt!389067 () (_ BitVec 64))

(declare-fun lt!389065 () (_ BitVec 64))

(assert (=> d!83788 (= lt!389069 (bvmul lt!389067 lt!389065))))

(assert (=> d!83788 (or (= lt!389067 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389065 (bvsdiv (bvmul lt!389067 lt!389065) lt!389067)))))

(assert (=> d!83788 (= lt!389065 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83788 (= lt!389067 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388867)))))))

(assert (=> d!83788 (= lt!389066 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388867))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388867)))))))

(assert (=> d!83788 (invariant!0 (currentBit!11908 (_2!11668 lt!388867)) (currentByte!11913 (_2!11668 lt!388867)) (size!5989 (buf!6482 (_2!11668 lt!388867))))))

(assert (=> d!83788 (= (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388867))) (currentByte!11913 (_2!11668 lt!388867)) (currentBit!11908 (_2!11668 lt!388867))) lt!389066)))

(declare-fun b!250437 () Bool)

(declare-fun res!209656 () Bool)

(assert (=> b!250437 (=> (not res!209656) (not e!173586))))

(assert (=> b!250437 (= res!209656 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389066))))

(declare-fun b!250438 () Bool)

(declare-fun lt!389068 () (_ BitVec 64))

(assert (=> b!250438 (= e!173586 (bvsle lt!389066 (bvmul lt!389068 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250438 (or (= lt!389068 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389068 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389068)))))

(assert (=> b!250438 (= lt!389068 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388867)))))))

(assert (= (and d!83788 res!209657) b!250437))

(assert (= (and b!250437 res!209656) b!250438))

(declare-fun m!376953 () Bool)

(assert (=> d!83788 m!376953))

(declare-fun m!376955 () Bool)

(assert (=> d!83788 m!376955))

(assert (=> b!250304 d!83788))

(declare-fun d!83800 () Bool)

(declare-fun e!173587 () Bool)

(assert (=> d!83800 e!173587))

(declare-fun res!209659 () Bool)

(assert (=> d!83800 (=> (not res!209659) (not e!173587))))

(declare-fun lt!389072 () (_ BitVec 64))

(declare-fun lt!389075 () (_ BitVec 64))

(declare-fun lt!389076 () (_ BitVec 64))

(assert (=> d!83800 (= res!209659 (= lt!389072 (bvsub lt!389075 lt!389076)))))

(assert (=> d!83800 (or (= (bvand lt!389075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389075 lt!389076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83800 (= lt!389076 (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868)))))))

(declare-fun lt!389073 () (_ BitVec 64))

(declare-fun lt!389071 () (_ BitVec 64))

(assert (=> d!83800 (= lt!389075 (bvmul lt!389073 lt!389071))))

(assert (=> d!83800 (or (= lt!389073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389071 (bvsdiv (bvmul lt!389073 lt!389071) lt!389073)))))

(assert (=> d!83800 (= lt!389071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83800 (= lt!389073 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))))))

(assert (=> d!83800 (= lt!389072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868)))))))

(assert (=> d!83800 (invariant!0 (currentBit!11908 (_2!11668 lt!388868)) (currentByte!11913 (_2!11668 lt!388868)) (size!5989 (buf!6482 (_2!11668 lt!388868))))))

(assert (=> d!83800 (= (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))) lt!389072)))

(declare-fun b!250439 () Bool)

(declare-fun res!209658 () Bool)

(assert (=> b!250439 (=> (not res!209658) (not e!173587))))

(assert (=> b!250439 (= res!209658 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389072))))

(declare-fun b!250440 () Bool)

(declare-fun lt!389074 () (_ BitVec 64))

(assert (=> b!250440 (= e!173587 (bvsle lt!389072 (bvmul lt!389074 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250440 (or (= lt!389074 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389074 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389074)))))

(assert (=> b!250440 (= lt!389074 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))))))

(assert (= (and d!83800 res!209659) b!250439))

(assert (= (and b!250439 res!209658) b!250440))

(declare-fun m!376957 () Bool)

(assert (=> d!83800 m!376957))

(declare-fun m!376959 () Bool)

(assert (=> d!83800 m!376959))

(assert (=> b!250304 d!83800))

(declare-fun d!83802 () Bool)

(declare-fun res!209666 () Bool)

(declare-fun e!173593 () Bool)

(assert (=> d!83802 (=> (not res!209666) (not e!173593))))

(assert (=> d!83802 (= res!209666 (= (size!5989 (buf!6482 thiss!1005)) (size!5989 (buf!6482 (_2!11668 lt!388868)))))))

(assert (=> d!83802 (= (isPrefixOf!0 thiss!1005 (_2!11668 lt!388868)) e!173593)))

(declare-fun b!250447 () Bool)

(declare-fun res!209668 () Bool)

(assert (=> b!250447 (=> (not res!209668) (not e!173593))))

(assert (=> b!250447 (= res!209668 (bvsle (bitIndex!0 (size!5989 (buf!6482 thiss!1005)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005)) (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868)))))))

(declare-fun b!250448 () Bool)

(declare-fun e!173592 () Bool)

(assert (=> b!250448 (= e!173593 e!173592)))

(declare-fun res!209667 () Bool)

(assert (=> b!250448 (=> res!209667 e!173592)))

(assert (=> b!250448 (= res!209667 (= (size!5989 (buf!6482 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250449 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13651 array!13651 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250449 (= e!173592 (arrayBitRangesEq!0 (buf!6482 thiss!1005) (buf!6482 (_2!11668 lt!388868)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5989 (buf!6482 thiss!1005)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005))))))

(assert (= (and d!83802 res!209666) b!250447))

(assert (= (and b!250447 res!209668) b!250448))

(assert (= (and b!250448 (not res!209667)) b!250449))

(assert (=> b!250447 m!376787))

(assert (=> b!250447 m!376745))

(assert (=> b!250449 m!376787))

(assert (=> b!250449 m!376787))

(declare-fun m!376961 () Bool)

(assert (=> b!250449 m!376961))

(assert (=> b!250293 d!83802))

(declare-fun d!83804 () Bool)

(assert (=> d!83804 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 thiss!1005))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 thiss!1005))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21240 () Bool)

(assert (= bs!21240 d!83804))

(declare-fun m!376963 () Bool)

(assert (=> bs!21240 m!376963))

(assert (=> b!250303 d!83804))

(declare-fun d!83806 () Bool)

(assert (=> d!83806 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005) (size!5989 (buf!6482 thiss!1005))))))

(declare-fun bs!21241 () Bool)

(assert (= bs!21241 d!83806))

(declare-fun m!376965 () Bool)

(assert (=> bs!21241 m!376965))

(assert (=> start!53742 d!83806))

(assert (=> b!250302 d!83800))

(declare-fun d!83808 () Bool)

(declare-fun e!173594 () Bool)

(assert (=> d!83808 e!173594))

(declare-fun res!209670 () Bool)

(assert (=> d!83808 (=> (not res!209670) (not e!173594))))

(declare-fun lt!389081 () (_ BitVec 64))

(declare-fun lt!389082 () (_ BitVec 64))

(declare-fun lt!389078 () (_ BitVec 64))

(assert (=> d!83808 (= res!209670 (= lt!389078 (bvsub lt!389081 lt!389082)))))

(assert (=> d!83808 (or (= (bvand lt!389081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389082 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389081 lt!389082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83808 (= lt!389082 (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 thiss!1005))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005))))))

(declare-fun lt!389079 () (_ BitVec 64))

(declare-fun lt!389077 () (_ BitVec 64))

(assert (=> d!83808 (= lt!389081 (bvmul lt!389079 lt!389077))))

(assert (=> d!83808 (or (= lt!389079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389077 (bvsdiv (bvmul lt!389079 lt!389077) lt!389079)))))

(assert (=> d!83808 (= lt!389077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83808 (= lt!389079 ((_ sign_extend 32) (size!5989 (buf!6482 thiss!1005))))))

(assert (=> d!83808 (= lt!389078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11913 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11908 thiss!1005))))))

(assert (=> d!83808 (invariant!0 (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005) (size!5989 (buf!6482 thiss!1005)))))

(assert (=> d!83808 (= (bitIndex!0 (size!5989 (buf!6482 thiss!1005)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005)) lt!389078)))

(declare-fun b!250450 () Bool)

(declare-fun res!209669 () Bool)

(assert (=> b!250450 (=> (not res!209669) (not e!173594))))

(assert (=> b!250450 (= res!209669 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389078))))

(declare-fun b!250451 () Bool)

(declare-fun lt!389080 () (_ BitVec 64))

(assert (=> b!250451 (= e!173594 (bvsle lt!389078 (bvmul lt!389080 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250451 (or (= lt!389080 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389080 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389080)))))

(assert (=> b!250451 (= lt!389080 ((_ sign_extend 32) (size!5989 (buf!6482 thiss!1005))))))

(assert (= (and d!83808 res!209670) b!250450))

(assert (= (and b!250450 res!209669) b!250451))

(assert (=> d!83808 m!376963))

(assert (=> d!83808 m!376965))

(assert (=> b!250302 d!83808))

(declare-fun d!83810 () Bool)

(declare-datatypes ((tuple2!21506 0))(
  ( (tuple2!21507 (_1!11678 Bool) (_2!11678 BitStream!10900)) )
))
(declare-fun lt!389085 () tuple2!21506)

(declare-fun readBit!0 (BitStream!10900) tuple2!21506)

(assert (=> d!83810 (= lt!389085 (readBit!0 (readerFrom!0 (_2!11668 lt!388868) (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005))))))

(assert (=> d!83810 (= (readBitPure!0 (readerFrom!0 (_2!11668 lt!388868) (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005))) (tuple2!21489 (_2!11678 lt!389085) (_1!11678 lt!389085)))))

(declare-fun bs!21242 () Bool)

(assert (= bs!21242 d!83810))

(assert (=> bs!21242 m!376781))

(declare-fun m!376967 () Bool)

(assert (=> bs!21242 m!376967))

(assert (=> b!250295 d!83810))

(declare-fun d!83812 () Bool)

(declare-fun e!173597 () Bool)

(assert (=> d!83812 e!173597))

(declare-fun res!209674 () Bool)

(assert (=> d!83812 (=> (not res!209674) (not e!173597))))

(assert (=> d!83812 (= res!209674 (invariant!0 (currentBit!11908 (_2!11668 lt!388868)) (currentByte!11913 (_2!11668 lt!388868)) (size!5989 (buf!6482 (_2!11668 lt!388868)))))))

(assert (=> d!83812 (= (readerFrom!0 (_2!11668 lt!388868) (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005)) (BitStream!10901 (buf!6482 (_2!11668 lt!388868)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005)))))

(declare-fun b!250454 () Bool)

(assert (=> b!250454 (= e!173597 (invariant!0 (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005) (size!5989 (buf!6482 (_2!11668 lt!388868)))))))

(assert (= (and d!83812 res!209674) b!250454))

(assert (=> d!83812 m!376959))

(assert (=> b!250454 m!376773))

(assert (=> b!250295 d!83812))

(declare-fun d!83814 () Bool)

(declare-fun res!209675 () Bool)

(declare-fun e!173599 () Bool)

(assert (=> d!83814 (=> (not res!209675) (not e!173599))))

(assert (=> d!83814 (= res!209675 (= (size!5989 (buf!6482 thiss!1005)) (size!5989 (buf!6482 (_2!11668 lt!388867)))))))

(assert (=> d!83814 (= (isPrefixOf!0 thiss!1005 (_2!11668 lt!388867)) e!173599)))

(declare-fun b!250455 () Bool)

(declare-fun res!209677 () Bool)

(assert (=> b!250455 (=> (not res!209677) (not e!173599))))

(assert (=> b!250455 (= res!209677 (bvsle (bitIndex!0 (size!5989 (buf!6482 thiss!1005)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005)) (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388867))) (currentByte!11913 (_2!11668 lt!388867)) (currentBit!11908 (_2!11668 lt!388867)))))))

(declare-fun b!250456 () Bool)

(declare-fun e!173598 () Bool)

(assert (=> b!250456 (= e!173599 e!173598)))

(declare-fun res!209676 () Bool)

(assert (=> b!250456 (=> res!209676 e!173598)))

(assert (=> b!250456 (= res!209676 (= (size!5989 (buf!6482 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250457 () Bool)

(assert (=> b!250457 (= e!173598 (arrayBitRangesEq!0 (buf!6482 thiss!1005) (buf!6482 (_2!11668 lt!388867)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5989 (buf!6482 thiss!1005)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005))))))

(assert (= (and d!83814 res!209675) b!250455))

(assert (= (and b!250455 res!209677) b!250456))

(assert (= (and b!250456 (not res!209676)) b!250457))

(assert (=> b!250455 m!376787))

(assert (=> b!250455 m!376743))

(assert (=> b!250457 m!376787))

(assert (=> b!250457 m!376787))

(declare-fun m!376969 () Bool)

(assert (=> b!250457 m!376969))

(assert (=> b!250294 d!83814))

(declare-fun b!250467 () Bool)

(declare-fun res!209689 () Bool)

(declare-fun e!173605 () Bool)

(assert (=> b!250467 (=> (not res!209689) (not e!173605))))

(declare-fun lt!389094 () (_ BitVec 64))

(declare-fun lt!389097 () (_ BitVec 64))

(declare-fun lt!389096 () tuple2!21486)

(assert (=> b!250467 (= res!209689 (= (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!389096))) (currentByte!11913 (_2!11668 lt!389096)) (currentBit!11908 (_2!11668 lt!389096))) (bvadd lt!389094 lt!389097)))))

(assert (=> b!250467 (or (not (= (bvand lt!389094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389097 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389094 lt!389097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250467 (= lt!389097 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!250467 (= lt!389094 (bitIndex!0 (size!5989 (buf!6482 thiss!1005)) (currentByte!11913 thiss!1005) (currentBit!11908 thiss!1005)))))

(declare-fun b!250470 () Bool)

(declare-fun e!173604 () Bool)

(declare-fun lt!389095 () tuple2!21488)

(assert (=> b!250470 (= e!173604 (= (bitIndex!0 (size!5989 (buf!6482 (_1!11669 lt!389095))) (currentByte!11913 (_1!11669 lt!389095)) (currentBit!11908 (_1!11669 lt!389095))) (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!389096))) (currentByte!11913 (_2!11668 lt!389096)) (currentBit!11908 (_2!11668 lt!389096)))))))

(declare-fun b!250468 () Bool)

(declare-fun res!209687 () Bool)

(assert (=> b!250468 (=> (not res!209687) (not e!173605))))

(assert (=> b!250468 (= res!209687 (isPrefixOf!0 thiss!1005 (_2!11668 lt!389096)))))

(declare-fun d!83816 () Bool)

(assert (=> d!83816 e!173605))

(declare-fun res!209688 () Bool)

(assert (=> d!83816 (=> (not res!209688) (not e!173605))))

(assert (=> d!83816 (= res!209688 (= (size!5989 (buf!6482 thiss!1005)) (size!5989 (buf!6482 (_2!11668 lt!389096)))))))

(declare-fun choose!16 (BitStream!10900 Bool) tuple2!21486)

(assert (=> d!83816 (= lt!389096 (choose!16 thiss!1005 bit!26))))

(assert (=> d!83816 (validate_offset_bit!0 ((_ sign_extend 32) (size!5989 (buf!6482 thiss!1005))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005)))))

(assert (=> d!83816 (= (appendBit!0 thiss!1005 bit!26) lt!389096)))

(declare-fun b!250469 () Bool)

(assert (=> b!250469 (= e!173605 e!173604)))

(declare-fun res!209686 () Bool)

(assert (=> b!250469 (=> (not res!209686) (not e!173604))))

(assert (=> b!250469 (= res!209686 (and (= (_2!11669 lt!389095) bit!26) (= (_1!11669 lt!389095) (_2!11668 lt!389096))))))

(assert (=> b!250469 (= lt!389095 (readBitPure!0 (readerFrom!0 (_2!11668 lt!389096) (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005))))))

(assert (= (and d!83816 res!209688) b!250467))

(assert (= (and b!250467 res!209689) b!250468))

(assert (= (and b!250468 res!209687) b!250469))

(assert (= (and b!250469 res!209686) b!250470))

(declare-fun m!376971 () Bool)

(assert (=> b!250469 m!376971))

(assert (=> b!250469 m!376971))

(declare-fun m!376973 () Bool)

(assert (=> b!250469 m!376973))

(declare-fun m!376975 () Bool)

(assert (=> b!250468 m!376975))

(declare-fun m!376977 () Bool)

(assert (=> b!250467 m!376977))

(assert (=> b!250467 m!376787))

(declare-fun m!376979 () Bool)

(assert (=> d!83816 m!376979))

(declare-fun m!376981 () Bool)

(assert (=> d!83816 m!376981))

(declare-fun m!376983 () Bool)

(assert (=> b!250470 m!376983))

(assert (=> b!250470 m!376977))

(assert (=> b!250294 d!83816))

(declare-fun d!83820 () Bool)

(assert (=> d!83820 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21243 () Bool)

(assert (= bs!21243 d!83820))

(assert (=> bs!21243 m!376957))

(assert (=> b!250294 d!83820))

(declare-fun d!83822 () Bool)

(declare-fun e!173611 () Bool)

(assert (=> d!83822 e!173611))

(declare-fun res!209698 () Bool)

(assert (=> d!83822 (=> (not res!209698) (not e!173611))))

(assert (=> d!83822 (= res!209698 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!389118 () Unit!18114)

(declare-fun choose!27 (BitStream!10900 BitStream!10900 (_ BitVec 64) (_ BitVec 64)) Unit!18114)

(assert (=> d!83822 (= lt!389118 (choose!27 thiss!1005 (_2!11668 lt!388868) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!83822 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!83822 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11668 lt!388868) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!389118)))

(declare-fun b!250479 () Bool)

(assert (=> b!250479 (= e!173611 (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!83822 res!209698) b!250479))

(declare-fun m!376989 () Bool)

(assert (=> d!83822 m!376989))

(assert (=> b!250479 m!376761))

(assert (=> b!250294 d!83822))

(declare-fun d!83826 () Bool)

(assert (=> d!83826 (isPrefixOf!0 thiss!1005 (_2!11668 lt!388867))))

(declare-fun lt!389137 () Unit!18114)

(declare-fun choose!30 (BitStream!10900 BitStream!10900 BitStream!10900) Unit!18114)

(assert (=> d!83826 (= lt!389137 (choose!30 thiss!1005 (_2!11668 lt!388868) (_2!11668 lt!388867)))))

(assert (=> d!83826 (isPrefixOf!0 thiss!1005 (_2!11668 lt!388868))))

(assert (=> d!83826 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11668 lt!388868) (_2!11668 lt!388867)) lt!389137)))

(declare-fun bs!21244 () Bool)

(assert (= bs!21244 d!83826))

(assert (=> bs!21244 m!376765))

(declare-fun m!376993 () Bool)

(assert (=> bs!21244 m!376993))

(assert (=> bs!21244 m!376775))

(assert (=> b!250294 d!83826))

(declare-fun d!83830 () Bool)

(declare-fun e!173643 () Bool)

(assert (=> d!83830 e!173643))

(declare-fun res!209758 () Bool)

(assert (=> d!83830 (=> (not res!209758) (not e!173643))))

(declare-fun lt!389195 () tuple2!21486)

(assert (=> d!83830 (= res!209758 (= (size!5989 (buf!6482 (_2!11668 lt!388868))) (size!5989 (buf!6482 (_2!11668 lt!389195)))))))

(declare-fun choose!51 (BitStream!10900 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21486)

(assert (=> d!83830 (= lt!389195 (choose!51 (_2!11668 lt!388868) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83830 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!83830 (= (appendNBitsLoop!0 (_2!11668 lt!388868) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!389195)))

(declare-fun b!250537 () Bool)

(declare-fun res!209755 () Bool)

(assert (=> b!250537 (=> (not res!209755) (not e!173643))))

(declare-fun lt!389194 () (_ BitVec 64))

(declare-fun lt!389198 () (_ BitVec 64))

(assert (=> b!250537 (= res!209755 (= (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!389195))) (currentByte!11913 (_2!11668 lt!389195)) (currentBit!11908 (_2!11668 lt!389195))) (bvadd lt!389194 lt!389198)))))

(assert (=> b!250537 (or (not (= (bvand lt!389194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389198 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389194 lt!389198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250537 (= lt!389198 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250537 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250537 (= lt!389194 (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))))))

(declare-fun b!250538 () Bool)

(declare-fun res!209756 () Bool)

(assert (=> b!250538 (=> (not res!209756) (not e!173643))))

(assert (=> b!250538 (= res!209756 (isPrefixOf!0 (_2!11668 lt!388868) (_2!11668 lt!389195)))))

(declare-fun b!250540 () Bool)

(declare-fun e!173644 () Bool)

(declare-fun lt!389197 () (_ BitVec 64))

(assert (=> b!250540 (= e!173644 (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) lt!389197))))

(declare-fun b!250539 () Bool)

(declare-fun lt!389192 () tuple2!21488)

(declare-fun lt!389193 () tuple2!21490)

(assert (=> b!250539 (= e!173643 (and (_2!11669 lt!389192) (= (_1!11669 lt!389192) (_2!11670 lt!389193))))))

(assert (=> b!250539 (= lt!389192 (checkBitsLoopPure!0 (_1!11670 lt!389193) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389196 () Unit!18114)

(declare-fun lt!389199 () Unit!18114)

(assert (=> b!250539 (= lt!389196 lt!389199)))

(assert (=> b!250539 (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!389195)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) lt!389197)))

(assert (=> b!250539 (= lt!389199 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11668 lt!388868) (buf!6482 (_2!11668 lt!389195)) lt!389197))))

(assert (=> b!250539 e!173644))

(declare-fun res!209757 () Bool)

(assert (=> b!250539 (=> (not res!209757) (not e!173644))))

(assert (=> b!250539 (= res!209757 (and (= (size!5989 (buf!6482 (_2!11668 lt!388868))) (size!5989 (buf!6482 (_2!11668 lt!389195)))) (bvsge lt!389197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250539 (= lt!389197 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250539 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250539 (= lt!389193 (reader!0 (_2!11668 lt!388868) (_2!11668 lt!389195)))))

(assert (= (and d!83830 res!209758) b!250537))

(assert (= (and b!250537 res!209755) b!250538))

(assert (= (and b!250538 res!209756) b!250539))

(assert (= (and b!250539 res!209757) b!250540))

(declare-fun m!377049 () Bool)

(assert (=> b!250537 m!377049))

(assert (=> b!250537 m!376745))

(declare-fun m!377051 () Bool)

(assert (=> b!250540 m!377051))

(declare-fun m!377053 () Bool)

(assert (=> b!250539 m!377053))

(declare-fun m!377055 () Bool)

(assert (=> b!250539 m!377055))

(declare-fun m!377057 () Bool)

(assert (=> b!250539 m!377057))

(declare-fun m!377059 () Bool)

(assert (=> b!250539 m!377059))

(declare-fun m!377061 () Bool)

(assert (=> b!250538 m!377061))

(declare-fun m!377063 () Bool)

(assert (=> d!83830 m!377063))

(assert (=> b!250294 d!83830))

(declare-fun d!83858 () Bool)

(assert (=> d!83858 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388868)))) ((_ sign_extend 32) (currentByte!11913 thiss!1005)) ((_ sign_extend 32) (currentBit!11908 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21250 () Bool)

(assert (= bs!21250 d!83858))

(declare-fun m!377065 () Bool)

(assert (=> bs!21250 m!377065))

(assert (=> b!250294 d!83858))

(declare-fun d!83860 () Bool)

(declare-fun lt!389202 () tuple2!21506)

(declare-fun checkBitsLoop!0 (BitStream!10900 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21506)

(assert (=> d!83860 (= lt!389202 (checkBitsLoop!0 (_1!11670 lt!388869) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83860 (= (checkBitsLoopPure!0 (_1!11670 lt!388869) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21489 (_2!11678 lt!389202) (_1!11678 lt!389202)))))

(declare-fun bs!21251 () Bool)

(assert (= bs!21251 d!83860))

(declare-fun m!377067 () Bool)

(assert (=> bs!21251 m!377067))

(assert (=> b!250299 d!83860))

(declare-fun d!83862 () Bool)

(assert (=> d!83862 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388867)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) lt!388866) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388867)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868)))) lt!388866))))

(declare-fun bs!21252 () Bool)

(assert (= bs!21252 d!83862))

(declare-fun m!377069 () Bool)

(assert (=> bs!21252 m!377069))

(assert (=> b!250299 d!83862))

(declare-fun d!83864 () Bool)

(assert (=> d!83864 (validate_offset_bits!1 ((_ sign_extend 32) (size!5989 (buf!6482 (_2!11668 lt!388867)))) ((_ sign_extend 32) (currentByte!11913 (_2!11668 lt!388868))) ((_ sign_extend 32) (currentBit!11908 (_2!11668 lt!388868))) lt!388866)))

(declare-fun lt!389205 () Unit!18114)

(declare-fun choose!9 (BitStream!10900 array!13651 (_ BitVec 64) BitStream!10900) Unit!18114)

(assert (=> d!83864 (= lt!389205 (choose!9 (_2!11668 lt!388868) (buf!6482 (_2!11668 lt!388867)) lt!388866 (BitStream!10901 (buf!6482 (_2!11668 lt!388867)) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868)))))))

(assert (=> d!83864 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11668 lt!388868) (buf!6482 (_2!11668 lt!388867)) lt!388866) lt!389205)))

(declare-fun bs!21253 () Bool)

(assert (= bs!21253 d!83864))

(assert (=> bs!21253 m!376753))

(declare-fun m!377071 () Bool)

(assert (=> bs!21253 m!377071))

(assert (=> b!250299 d!83864))

(declare-fun e!173658 () Bool)

(declare-fun b!250566 () Bool)

(declare-fun lt!389288 () tuple2!21490)

(declare-fun lt!389285 () (_ BitVec 64))

(declare-fun lt!389296 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10900 (_ BitVec 64)) BitStream!10900)

(assert (=> b!250566 (= e!173658 (= (_1!11670 lt!389288) (withMovedBitIndex!0 (_2!11670 lt!389288) (bvsub lt!389285 lt!389296))))))

(assert (=> b!250566 (or (= (bvand lt!389285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389296 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389285 lt!389296) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250566 (= lt!389296 (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388867))) (currentByte!11913 (_2!11668 lt!388867)) (currentBit!11908 (_2!11668 lt!388867))))))

(assert (=> b!250566 (= lt!389285 (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))))))

(declare-fun b!250567 () Bool)

(declare-fun res!209780 () Bool)

(assert (=> b!250567 (=> (not res!209780) (not e!173658))))

(assert (=> b!250567 (= res!209780 (isPrefixOf!0 (_1!11670 lt!389288) (_2!11668 lt!388868)))))

(declare-fun b!250568 () Bool)

(declare-fun res!209782 () Bool)

(assert (=> b!250568 (=> (not res!209782) (not e!173658))))

(assert (=> b!250568 (= res!209782 (isPrefixOf!0 (_2!11670 lt!389288) (_2!11668 lt!388867)))))

(declare-fun d!83866 () Bool)

(assert (=> d!83866 e!173658))

(declare-fun res!209781 () Bool)

(assert (=> d!83866 (=> (not res!209781) (not e!173658))))

(assert (=> d!83866 (= res!209781 (isPrefixOf!0 (_1!11670 lt!389288) (_2!11670 lt!389288)))))

(declare-fun lt!389297 () BitStream!10900)

(assert (=> d!83866 (= lt!389288 (tuple2!21491 lt!389297 (_2!11668 lt!388867)))))

(declare-fun lt!389283 () Unit!18114)

(declare-fun lt!389286 () Unit!18114)

(assert (=> d!83866 (= lt!389283 lt!389286)))

(assert (=> d!83866 (isPrefixOf!0 lt!389297 (_2!11668 lt!388867))))

(assert (=> d!83866 (= lt!389286 (lemmaIsPrefixTransitive!0 lt!389297 (_2!11668 lt!388867) (_2!11668 lt!388867)))))

(declare-fun lt!389289 () Unit!18114)

(declare-fun lt!389301 () Unit!18114)

(assert (=> d!83866 (= lt!389289 lt!389301)))

(assert (=> d!83866 (isPrefixOf!0 lt!389297 (_2!11668 lt!388867))))

(assert (=> d!83866 (= lt!389301 (lemmaIsPrefixTransitive!0 lt!389297 (_2!11668 lt!388868) (_2!11668 lt!388867)))))

(declare-fun lt!389299 () Unit!18114)

(declare-fun e!173659 () Unit!18114)

(assert (=> d!83866 (= lt!389299 e!173659)))

(declare-fun c!11593 () Bool)

(assert (=> d!83866 (= c!11593 (not (= (size!5989 (buf!6482 (_2!11668 lt!388868))) #b00000000000000000000000000000000)))))

(declare-fun lt!389298 () Unit!18114)

(declare-fun lt!389287 () Unit!18114)

(assert (=> d!83866 (= lt!389298 lt!389287)))

(assert (=> d!83866 (isPrefixOf!0 (_2!11668 lt!388867) (_2!11668 lt!388867))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10900) Unit!18114)

(assert (=> d!83866 (= lt!389287 (lemmaIsPrefixRefl!0 (_2!11668 lt!388867)))))

(declare-fun lt!389292 () Unit!18114)

(declare-fun lt!389300 () Unit!18114)

(assert (=> d!83866 (= lt!389292 lt!389300)))

(assert (=> d!83866 (= lt!389300 (lemmaIsPrefixRefl!0 (_2!11668 lt!388867)))))

(declare-fun lt!389282 () Unit!18114)

(declare-fun lt!389294 () Unit!18114)

(assert (=> d!83866 (= lt!389282 lt!389294)))

(assert (=> d!83866 (isPrefixOf!0 lt!389297 lt!389297)))

(assert (=> d!83866 (= lt!389294 (lemmaIsPrefixRefl!0 lt!389297))))

(declare-fun lt!389293 () Unit!18114)

(declare-fun lt!389291 () Unit!18114)

(assert (=> d!83866 (= lt!389293 lt!389291)))

(assert (=> d!83866 (isPrefixOf!0 (_2!11668 lt!388868) (_2!11668 lt!388868))))

(assert (=> d!83866 (= lt!389291 (lemmaIsPrefixRefl!0 (_2!11668 lt!388868)))))

(assert (=> d!83866 (= lt!389297 (BitStream!10901 (buf!6482 (_2!11668 lt!388867)) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))))))

(assert (=> d!83866 (isPrefixOf!0 (_2!11668 lt!388868) (_2!11668 lt!388867))))

(assert (=> d!83866 (= (reader!0 (_2!11668 lt!388868) (_2!11668 lt!388867)) lt!389288)))

(declare-fun b!250569 () Bool)

(declare-fun lt!389290 () Unit!18114)

(assert (=> b!250569 (= e!173659 lt!389290)))

(declare-fun lt!389295 () (_ BitVec 64))

(assert (=> b!250569 (= lt!389295 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!389284 () (_ BitVec 64))

(assert (=> b!250569 (= lt!389284 (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13651 array!13651 (_ BitVec 64) (_ BitVec 64)) Unit!18114)

(assert (=> b!250569 (= lt!389290 (arrayBitRangesEqSymmetric!0 (buf!6482 (_2!11668 lt!388868)) (buf!6482 (_2!11668 lt!388867)) lt!389295 lt!389284))))

(assert (=> b!250569 (arrayBitRangesEq!0 (buf!6482 (_2!11668 lt!388867)) (buf!6482 (_2!11668 lt!388868)) lt!389295 lt!389284)))

(declare-fun b!250570 () Bool)

(declare-fun Unit!18121 () Unit!18114)

(assert (=> b!250570 (= e!173659 Unit!18121)))

(assert (= (and d!83866 c!11593) b!250569))

(assert (= (and d!83866 (not c!11593)) b!250570))

(assert (= (and d!83866 res!209781) b!250567))

(assert (= (and b!250567 res!209780) b!250568))

(assert (= (and b!250568 res!209782) b!250566))

(assert (=> d!83866 m!376777))

(declare-fun m!377099 () Bool)

(assert (=> d!83866 m!377099))

(declare-fun m!377101 () Bool)

(assert (=> d!83866 m!377101))

(declare-fun m!377103 () Bool)

(assert (=> d!83866 m!377103))

(declare-fun m!377105 () Bool)

(assert (=> d!83866 m!377105))

(declare-fun m!377107 () Bool)

(assert (=> d!83866 m!377107))

(declare-fun m!377109 () Bool)

(assert (=> d!83866 m!377109))

(declare-fun m!377111 () Bool)

(assert (=> d!83866 m!377111))

(declare-fun m!377113 () Bool)

(assert (=> d!83866 m!377113))

(declare-fun m!377115 () Bool)

(assert (=> d!83866 m!377115))

(declare-fun m!377117 () Bool)

(assert (=> d!83866 m!377117))

(declare-fun m!377119 () Bool)

(assert (=> b!250568 m!377119))

(declare-fun m!377121 () Bool)

(assert (=> b!250567 m!377121))

(declare-fun m!377123 () Bool)

(assert (=> b!250566 m!377123))

(assert (=> b!250566 m!376743))

(assert (=> b!250566 m!376745))

(assert (=> b!250569 m!376745))

(declare-fun m!377125 () Bool)

(assert (=> b!250569 m!377125))

(declare-fun m!377127 () Bool)

(assert (=> b!250569 m!377127))

(assert (=> b!250299 d!83866))

(declare-fun d!83880 () Bool)

(assert (=> d!83880 (= (array_inv!5730 (buf!6482 thiss!1005)) (bvsge (size!5989 (buf!6482 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!250298 d!83880))

(declare-fun d!83882 () Bool)

(assert (=> d!83882 (= (invariant!0 (currentBit!11908 thiss!1005) (currentByte!11913 thiss!1005) (size!5989 (buf!6482 (_2!11668 lt!388868)))) (and (bvsge (currentBit!11908 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11908 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11913 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11913 thiss!1005) (size!5989 (buf!6482 (_2!11668 lt!388868)))) (and (= (currentBit!11908 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11913 thiss!1005) (size!5989 (buf!6482 (_2!11668 lt!388868))))))))))

(assert (=> b!250297 d!83882))

(declare-fun d!83884 () Bool)

(declare-fun e!173660 () Bool)

(assert (=> d!83884 e!173660))

(declare-fun res!209784 () Bool)

(assert (=> d!83884 (=> (not res!209784) (not e!173660))))

(declare-fun lt!389307 () (_ BitVec 64))

(declare-fun lt!389306 () (_ BitVec 64))

(declare-fun lt!389303 () (_ BitVec 64))

(assert (=> d!83884 (= res!209784 (= lt!389303 (bvsub lt!389306 lt!389307)))))

(assert (=> d!83884 (or (= (bvand lt!389306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389306 lt!389307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83884 (= lt!389307 (remainingBits!0 ((_ sign_extend 32) (size!5989 (buf!6482 (_1!11669 lt!388862)))) ((_ sign_extend 32) (currentByte!11913 (_1!11669 lt!388862))) ((_ sign_extend 32) (currentBit!11908 (_1!11669 lt!388862)))))))

(declare-fun lt!389304 () (_ BitVec 64))

(declare-fun lt!389302 () (_ BitVec 64))

(assert (=> d!83884 (= lt!389306 (bvmul lt!389304 lt!389302))))

(assert (=> d!83884 (or (= lt!389304 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389302 (bvsdiv (bvmul lt!389304 lt!389302) lt!389304)))))

(assert (=> d!83884 (= lt!389302 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83884 (= lt!389304 ((_ sign_extend 32) (size!5989 (buf!6482 (_1!11669 lt!388862)))))))

(assert (=> d!83884 (= lt!389303 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11913 (_1!11669 lt!388862))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11908 (_1!11669 lt!388862)))))))

(assert (=> d!83884 (invariant!0 (currentBit!11908 (_1!11669 lt!388862)) (currentByte!11913 (_1!11669 lt!388862)) (size!5989 (buf!6482 (_1!11669 lt!388862))))))

(assert (=> d!83884 (= (bitIndex!0 (size!5989 (buf!6482 (_1!11669 lt!388862))) (currentByte!11913 (_1!11669 lt!388862)) (currentBit!11908 (_1!11669 lt!388862))) lt!389303)))

(declare-fun b!250571 () Bool)

(declare-fun res!209783 () Bool)

(assert (=> b!250571 (=> (not res!209783) (not e!173660))))

(assert (=> b!250571 (= res!209783 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389303))))

(declare-fun b!250572 () Bool)

(declare-fun lt!389305 () (_ BitVec 64))

(assert (=> b!250572 (= e!173660 (bvsle lt!389303 (bvmul lt!389305 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250572 (or (= lt!389305 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389305 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389305)))))

(assert (=> b!250572 (= lt!389305 ((_ sign_extend 32) (size!5989 (buf!6482 (_1!11669 lt!388862)))))))

(assert (= (and d!83884 res!209784) b!250571))

(assert (= (and b!250571 res!209783) b!250572))

(declare-fun m!377129 () Bool)

(assert (=> d!83884 m!377129))

(declare-fun m!377131 () Bool)

(assert (=> d!83884 m!377131))

(assert (=> b!250301 d!83884))

(declare-fun d!83886 () Bool)

(declare-fun res!209785 () Bool)

(declare-fun e!173662 () Bool)

(assert (=> d!83886 (=> (not res!209785) (not e!173662))))

(assert (=> d!83886 (= res!209785 (= (size!5989 (buf!6482 (_2!11668 lt!388868))) (size!5989 (buf!6482 (_2!11668 lt!388867)))))))

(assert (=> d!83886 (= (isPrefixOf!0 (_2!11668 lt!388868) (_2!11668 lt!388867)) e!173662)))

(declare-fun b!250573 () Bool)

(declare-fun res!209787 () Bool)

(assert (=> b!250573 (=> (not res!209787) (not e!173662))))

(assert (=> b!250573 (= res!209787 (bvsle (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868))) (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388867))) (currentByte!11913 (_2!11668 lt!388867)) (currentBit!11908 (_2!11668 lt!388867)))))))

(declare-fun b!250574 () Bool)

(declare-fun e!173661 () Bool)

(assert (=> b!250574 (= e!173662 e!173661)))

(declare-fun res!209786 () Bool)

(assert (=> b!250574 (=> res!209786 e!173661)))

(assert (=> b!250574 (= res!209786 (= (size!5989 (buf!6482 (_2!11668 lt!388868))) #b00000000000000000000000000000000))))

(declare-fun b!250575 () Bool)

(assert (=> b!250575 (= e!173661 (arrayBitRangesEq!0 (buf!6482 (_2!11668 lt!388868)) (buf!6482 (_2!11668 lt!388867)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5989 (buf!6482 (_2!11668 lt!388868))) (currentByte!11913 (_2!11668 lt!388868)) (currentBit!11908 (_2!11668 lt!388868)))))))

(assert (= (and d!83886 res!209785) b!250573))

(assert (= (and b!250573 res!209787) b!250574))

(assert (= (and b!250574 (not res!209786)) b!250575))

(assert (=> b!250573 m!376745))

(assert (=> b!250573 m!376743))

(assert (=> b!250575 m!376745))

(assert (=> b!250575 m!376745))

(declare-fun m!377133 () Bool)

(assert (=> b!250575 m!377133))

(assert (=> b!250300 d!83886))

(push 1)

(assert (not d!83806))

(assert (not d!83858))

(assert (not d!83862))

(assert (not d!83860))

(assert (not b!250573))

(assert (not d!83804))

(assert (not b!250457))

(assert (not b!250575))

(assert (not b!250566))

(assert (not b!250567))

(assert (not d!83864))

(assert (not b!250467))

(assert (not d!83820))

(assert (not d!83826))

(assert (not d!83810))

(assert (not b!250479))

(assert (not b!250455))

(assert (not b!250454))

(assert (not d!83808))

(assert (not b!250447))

(assert (not b!250569))

(assert (not d!83822))

(assert (not b!250449))

(assert (not d!83866))

(assert (not b!250469))

(assert (not d!83812))

(assert (not d!83830))

(assert (not b!250537))

(assert (not d!83884))

(assert (not b!250468))

(assert (not b!250538))

(assert (not b!250568))

(assert (not b!250470))

(assert (not d!83800))

(assert (not d!83816))

(assert (not d!83788))

(assert (not b!250540))

(assert (not b!250539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

