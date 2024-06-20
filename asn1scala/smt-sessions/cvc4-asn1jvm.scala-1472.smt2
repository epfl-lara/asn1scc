; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40548 () Bool)

(assert start!40548)

(declare-fun b!186357 () Bool)

(declare-fun e!128957 () Bool)

(declare-fun e!128959 () Bool)

(assert (=> b!186357 (= e!128957 (not e!128959))))

(declare-fun res!155158 () Bool)

(assert (=> b!186357 (=> res!155158 e!128959)))

(declare-fun lt!287880 () (_ BitVec 64))

(declare-fun lt!287876 () (_ BitVec 64))

(assert (=> b!186357 (= res!155158 (not (= lt!287880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287876))))))

(declare-datatypes ((array!9824 0))(
  ( (array!9825 (arr!5262 (Array (_ BitVec 32) (_ BitVec 8))) (size!4332 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7772 0))(
  ( (BitStream!7773 (buf!4795 array!9824) (currentByte!9045 (_ BitVec 32)) (currentBit!9040 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13333 0))(
  ( (Unit!13334) )
))
(declare-datatypes ((tuple2!16124 0))(
  ( (tuple2!16125 (_1!8707 Unit!13333) (_2!8707 BitStream!7772)) )
))
(declare-fun lt!287872 () tuple2!16124)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186357 (= lt!287880 (bitIndex!0 (size!4332 (buf!4795 (_2!8707 lt!287872))) (currentByte!9045 (_2!8707 lt!287872)) (currentBit!9040 (_2!8707 lt!287872))))))

(declare-fun thiss!1204 () BitStream!7772)

(assert (=> b!186357 (= lt!287876 (bitIndex!0 (size!4332 (buf!4795 thiss!1204)) (currentByte!9045 thiss!1204) (currentBit!9040 thiss!1204)))))

(declare-fun e!128953 () Bool)

(assert (=> b!186357 e!128953))

(declare-fun res!155157 () Bool)

(assert (=> b!186357 (=> (not res!155157) (not e!128953))))

(assert (=> b!186357 (= res!155157 (= (size!4332 (buf!4795 thiss!1204)) (size!4332 (buf!4795 (_2!8707 lt!287872)))))))

(declare-fun lt!287893 () Bool)

(declare-fun appendBit!0 (BitStream!7772 Bool) tuple2!16124)

(assert (=> b!186357 (= lt!287872 (appendBit!0 thiss!1204 lt!287893))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!287878 () (_ BitVec 64))

(assert (=> b!186357 (= lt!287893 (not (= (bvand v!189 lt!287878) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!186357 (= lt!287878 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!186358 () Bool)

(declare-fun res!155163 () Bool)

(assert (=> b!186358 (=> (not res!155163) (not e!128957))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186358 (= res!155163 (invariant!0 (currentBit!9040 thiss!1204) (currentByte!9045 thiss!1204) (size!4332 (buf!4795 thiss!1204))))))

(declare-fun b!186359 () Bool)

(declare-fun res!155160 () Bool)

(declare-fun e!128954 () Bool)

(assert (=> b!186359 (=> res!155160 e!128954)))

(declare-fun isPrefixOf!0 (BitStream!7772 BitStream!7772) Bool)

(assert (=> b!186359 (= res!155160 (not (isPrefixOf!0 thiss!1204 (_2!8707 lt!287872))))))

(declare-fun b!186360 () Bool)

(declare-fun e!128958 () Bool)

(assert (=> b!186360 (= e!128958 e!128957)))

(declare-fun res!155161 () Bool)

(assert (=> b!186360 (=> (not res!155161) (not e!128957))))

(declare-fun lt!287882 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186360 (= res!155161 (validate_offset_bits!1 ((_ sign_extend 32) (size!4332 (buf!4795 thiss!1204))) ((_ sign_extend 32) (currentByte!9045 thiss!1204)) ((_ sign_extend 32) (currentBit!9040 thiss!1204)) lt!287882))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!186360 (= lt!287882 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!186361 () Bool)

(declare-fun e!128965 () Bool)

(declare-datatypes ((tuple2!16126 0))(
  ( (tuple2!16127 (_1!8708 BitStream!7772) (_2!8708 Bool)) )
))
(declare-fun lt!287877 () tuple2!16126)

(declare-fun lt!287885 () (_ BitVec 64))

(assert (=> b!186361 (= e!128965 (= (bitIndex!0 (size!4332 (buf!4795 (_1!8708 lt!287877))) (currentByte!9045 (_1!8708 lt!287877)) (currentBit!9040 (_1!8708 lt!287877))) lt!287885))))

(declare-fun b!186362 () Bool)

(declare-fun e!128962 () Bool)

(assert (=> b!186362 (= e!128962 e!128965)))

(declare-fun res!155156 () Bool)

(assert (=> b!186362 (=> (not res!155156) (not e!128965))))

(assert (=> b!186362 (= res!155156 (and (= (_2!8708 lt!287877) lt!287893) (= (_1!8708 lt!287877) (_2!8707 lt!287872))))))

(declare-fun readBitPure!0 (BitStream!7772) tuple2!16126)

(declare-fun readerFrom!0 (BitStream!7772 (_ BitVec 32) (_ BitVec 32)) BitStream!7772)

(assert (=> b!186362 (= lt!287877 (readBitPure!0 (readerFrom!0 (_2!8707 lt!287872) (currentBit!9040 thiss!1204) (currentByte!9045 thiss!1204))))))

(declare-fun b!186363 () Bool)

(assert (=> b!186363 (= e!128953 e!128962)))

(declare-fun res!155165 () Bool)

(assert (=> b!186363 (=> (not res!155165) (not e!128962))))

(declare-fun lt!287875 () (_ BitVec 64))

(assert (=> b!186363 (= res!155165 (= lt!287885 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!287875)))))

(assert (=> b!186363 (= lt!287885 (bitIndex!0 (size!4332 (buf!4795 (_2!8707 lt!287872))) (currentByte!9045 (_2!8707 lt!287872)) (currentBit!9040 (_2!8707 lt!287872))))))

(assert (=> b!186363 (= lt!287875 (bitIndex!0 (size!4332 (buf!4795 thiss!1204)) (currentByte!9045 thiss!1204) (currentBit!9040 thiss!1204)))))

(declare-fun b!186364 () Bool)

(declare-fun e!128961 () Bool)

(declare-fun lt!287873 () tuple2!16124)

(assert (=> b!186364 (= e!128961 (invariant!0 (currentBit!9040 thiss!1204) (currentByte!9045 thiss!1204) (size!4332 (buf!4795 (_2!8707 lt!287873)))))))

(declare-fun b!186365 () Bool)

(declare-fun e!128956 () Bool)

(declare-fun lt!287867 () tuple2!16126)

(declare-fun lt!287892 () tuple2!16126)

(assert (=> b!186365 (= e!128956 (= (_2!8708 lt!287867) (_2!8708 lt!287892)))))

(declare-fun b!186366 () Bool)

(declare-fun res!155155 () Bool)

(declare-fun e!128955 () Bool)

(assert (=> b!186366 (=> (not res!155155) (not e!128955))))

(declare-datatypes ((tuple2!16128 0))(
  ( (tuple2!16129 (_1!8709 BitStream!7772) (_2!8709 BitStream!7772)) )
))
(declare-fun lt!287883 () tuple2!16128)

(declare-fun lt!287874 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7772 (_ BitVec 64)) BitStream!7772)

(assert (=> b!186366 (= res!155155 (= (_1!8709 lt!287883) (withMovedBitIndex!0 (_2!8709 lt!287883) (bvsub lt!287876 lt!287874))))))

(declare-fun b!186367 () Bool)

(declare-fun res!155151 () Bool)

(assert (=> b!186367 (=> (not res!155151) (not e!128957))))

(assert (=> b!186367 (= res!155151 (not (= i!590 nBits!348)))))

(declare-fun res!155167 () Bool)

(assert (=> start!40548 (=> (not res!155167) (not e!128958))))

(assert (=> start!40548 (= res!155167 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40548 e!128958))

(assert (=> start!40548 true))

(declare-fun e!128963 () Bool)

(declare-fun inv!12 (BitStream!7772) Bool)

(assert (=> start!40548 (and (inv!12 thiss!1204) e!128963)))

(declare-fun b!186368 () Bool)

(declare-fun e!128960 () Bool)

(assert (=> b!186368 (= e!128954 e!128960)))

(declare-fun res!155164 () Bool)

(assert (=> b!186368 (=> res!155164 e!128960)))

(declare-fun lt!287889 () tuple2!16128)

(declare-fun lt!287886 () (_ BitVec 64))

(declare-datatypes ((tuple2!16130 0))(
  ( (tuple2!16131 (_1!8710 BitStream!7772) (_2!8710 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16130)

(assert (=> b!186368 (= res!155164 (not (= (_1!8710 (readNBitsLSBFirstsLoopPure!0 (_1!8709 lt!287889) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287886)) (_2!8709 lt!287889))))))

(declare-fun lt!287891 () (_ BitVec 64))

(assert (=> b!186368 (validate_offset_bits!1 ((_ sign_extend 32) (size!4332 (buf!4795 (_2!8707 lt!287873)))) ((_ sign_extend 32) (currentByte!9045 (_2!8707 lt!287872))) ((_ sign_extend 32) (currentBit!9040 (_2!8707 lt!287872))) lt!287891)))

(declare-fun lt!287868 () Unit!13333)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7772 array!9824 (_ BitVec 64)) Unit!13333)

(assert (=> b!186368 (= lt!287868 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8707 lt!287872) (buf!4795 (_2!8707 lt!287873)) lt!287891))))

(assert (=> b!186368 (= lt!287891 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!287888 () (_ BitVec 64))

(declare-fun lt!287870 () tuple2!16126)

(assert (=> b!186368 (= lt!287886 (bvor lt!287888 (ite (_2!8708 lt!287870) lt!287878 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!287869 () tuple2!16130)

(assert (=> b!186368 (= lt!287869 (readNBitsLSBFirstsLoopPure!0 (_1!8709 lt!287883) nBits!348 i!590 lt!287888))))

(assert (=> b!186368 (validate_offset_bits!1 ((_ sign_extend 32) (size!4332 (buf!4795 (_2!8707 lt!287873)))) ((_ sign_extend 32) (currentByte!9045 thiss!1204)) ((_ sign_extend 32) (currentBit!9040 thiss!1204)) lt!287882)))

(declare-fun lt!287879 () Unit!13333)

(assert (=> b!186368 (= lt!287879 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4795 (_2!8707 lt!287873)) lt!287882))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!186368 (= lt!287888 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!186368 (= (_2!8708 lt!287870) lt!287893)))

(assert (=> b!186368 (= lt!287870 (readBitPure!0 (_1!8709 lt!287883)))))

(declare-fun reader!0 (BitStream!7772 BitStream!7772) tuple2!16128)

(assert (=> b!186368 (= lt!287889 (reader!0 (_2!8707 lt!287872) (_2!8707 lt!287873)))))

(assert (=> b!186368 (= lt!287883 (reader!0 thiss!1204 (_2!8707 lt!287873)))))

(assert (=> b!186368 e!128956))

(declare-fun res!155153 () Bool)

(assert (=> b!186368 (=> (not res!155153) (not e!128956))))

(assert (=> b!186368 (= res!155153 (= (bitIndex!0 (size!4332 (buf!4795 (_1!8708 lt!287867))) (currentByte!9045 (_1!8708 lt!287867)) (currentBit!9040 (_1!8708 lt!287867))) (bitIndex!0 (size!4332 (buf!4795 (_1!8708 lt!287892))) (currentByte!9045 (_1!8708 lt!287892)) (currentBit!9040 (_1!8708 lt!287892)))))))

(declare-fun lt!287890 () Unit!13333)

(declare-fun lt!287884 () BitStream!7772)

(declare-fun readBitPrefixLemma!0 (BitStream!7772 BitStream!7772) Unit!13333)

(assert (=> b!186368 (= lt!287890 (readBitPrefixLemma!0 lt!287884 (_2!8707 lt!287873)))))

(assert (=> b!186368 (= lt!287892 (readBitPure!0 (BitStream!7773 (buf!4795 (_2!8707 lt!287873)) (currentByte!9045 thiss!1204) (currentBit!9040 thiss!1204))))))

(assert (=> b!186368 (= lt!287867 (readBitPure!0 lt!287884))))

(assert (=> b!186368 e!128961))

(declare-fun res!155162 () Bool)

(assert (=> b!186368 (=> (not res!155162) (not e!128961))))

(assert (=> b!186368 (= res!155162 (invariant!0 (currentBit!9040 thiss!1204) (currentByte!9045 thiss!1204) (size!4332 (buf!4795 (_2!8707 lt!287872)))))))

(assert (=> b!186368 (= lt!287884 (BitStream!7773 (buf!4795 (_2!8707 lt!287872)) (currentByte!9045 thiss!1204) (currentBit!9040 thiss!1204)))))

(declare-fun b!186369 () Bool)

(declare-fun array_inv!4073 (array!9824) Bool)

(assert (=> b!186369 (= e!128963 (array_inv!4073 (buf!4795 thiss!1204)))))

(declare-fun b!186370 () Bool)

(declare-fun res!155168 () Bool)

(assert (=> b!186370 (=> res!155168 e!128954)))

(assert (=> b!186370 (= res!155168 (not (isPrefixOf!0 (_2!8707 lt!287872) (_2!8707 lt!287873))))))

(declare-fun b!186371 () Bool)

(assert (=> b!186371 (= e!128960 true)))

(assert (=> b!186371 e!128955))

(declare-fun res!155169 () Bool)

(assert (=> b!186371 (=> (not res!155169) (not e!128955))))

(declare-fun lt!287881 () tuple2!16130)

(assert (=> b!186371 (= res!155169 (and (= (_2!8710 lt!287869) (_2!8710 lt!287881)) (= (_1!8710 lt!287869) (_1!8710 lt!287881))))))

(declare-fun lt!287871 () Unit!13333)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13333)

(assert (=> b!186371 (= lt!287871 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8709 lt!287883) nBits!348 i!590 lt!287888))))

(assert (=> b!186371 (= lt!287881 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8709 lt!287883) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287886))))

(declare-fun b!186372 () Bool)

(assert (=> b!186372 (= e!128955 (= (_1!8709 lt!287889) (withMovedBitIndex!0 (_2!8709 lt!287889) (bvsub lt!287880 lt!287874))))))

(declare-fun b!186373 () Bool)

(declare-fun res!155152 () Bool)

(assert (=> b!186373 (=> res!155152 e!128954)))

(assert (=> b!186373 (= res!155152 (not (invariant!0 (currentBit!9040 (_2!8707 lt!287873)) (currentByte!9045 (_2!8707 lt!287873)) (size!4332 (buf!4795 (_2!8707 lt!287873))))))))

(declare-fun b!186374 () Bool)

(assert (=> b!186374 (= e!128959 e!128954)))

(declare-fun res!155159 () Bool)

(assert (=> b!186374 (=> res!155159 e!128954)))

(assert (=> b!186374 (= res!155159 (not (= lt!287874 (bvsub (bvsub (bvadd lt!287880 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!186374 (= lt!287874 (bitIndex!0 (size!4332 (buf!4795 (_2!8707 lt!287873))) (currentByte!9045 (_2!8707 lt!287873)) (currentBit!9040 (_2!8707 lt!287873))))))

(assert (=> b!186374 (isPrefixOf!0 thiss!1204 (_2!8707 lt!287873))))

(declare-fun lt!287887 () Unit!13333)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7772 BitStream!7772 BitStream!7772) Unit!13333)

(assert (=> b!186374 (= lt!287887 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8707 lt!287872) (_2!8707 lt!287873)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7772 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16124)

(assert (=> b!186374 (= lt!287873 (appendBitsLSBFirstLoopTR!0 (_2!8707 lt!287872) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!186375 () Bool)

(declare-fun res!155154 () Bool)

(assert (=> b!186375 (=> (not res!155154) (not e!128962))))

(assert (=> b!186375 (= res!155154 (isPrefixOf!0 thiss!1204 (_2!8707 lt!287872)))))

(declare-fun b!186376 () Bool)

(declare-fun res!155166 () Bool)

(assert (=> b!186376 (=> res!155166 e!128954)))

(assert (=> b!186376 (= res!155166 (or (not (= (size!4332 (buf!4795 (_2!8707 lt!287873))) (size!4332 (buf!4795 thiss!1204)))) (not (= lt!287874 (bvsub (bvadd lt!287876 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(assert (= (and start!40548 res!155167) b!186360))

(assert (= (and b!186360 res!155161) b!186358))

(assert (= (and b!186358 res!155163) b!186367))

(assert (= (and b!186367 res!155151) b!186357))

(assert (= (and b!186357 res!155157) b!186363))

(assert (= (and b!186363 res!155165) b!186375))

(assert (= (and b!186375 res!155154) b!186362))

(assert (= (and b!186362 res!155156) b!186361))

(assert (= (and b!186357 (not res!155158)) b!186374))

(assert (= (and b!186374 (not res!155159)) b!186373))

(assert (= (and b!186373 (not res!155152)) b!186376))

(assert (= (and b!186376 (not res!155166)) b!186370))

(assert (= (and b!186370 (not res!155168)) b!186359))

(assert (= (and b!186359 (not res!155160)) b!186368))

(assert (= (and b!186368 res!155162) b!186364))

(assert (= (and b!186368 res!155153) b!186365))

(assert (= (and b!186368 (not res!155164)) b!186371))

(assert (= (and b!186371 res!155169) b!186366))

(assert (= (and b!186366 res!155155) b!186372))

(assert (= start!40548 b!186369))

(declare-fun m!289729 () Bool)

(assert (=> b!186359 m!289729))

(declare-fun m!289731 () Bool)

(assert (=> b!186371 m!289731))

(declare-fun m!289733 () Bool)

(assert (=> b!186371 m!289733))

(assert (=> b!186371 m!289733))

(declare-fun m!289735 () Bool)

(assert (=> b!186371 m!289735))

(declare-fun m!289737 () Bool)

(assert (=> b!186368 m!289737))

(declare-fun m!289739 () Bool)

(assert (=> b!186368 m!289739))

(declare-fun m!289741 () Bool)

(assert (=> b!186368 m!289741))

(declare-fun m!289743 () Bool)

(assert (=> b!186368 m!289743))

(declare-fun m!289745 () Bool)

(assert (=> b!186368 m!289745))

(declare-fun m!289747 () Bool)

(assert (=> b!186368 m!289747))

(declare-fun m!289749 () Bool)

(assert (=> b!186368 m!289749))

(declare-fun m!289751 () Bool)

(assert (=> b!186368 m!289751))

(declare-fun m!289753 () Bool)

(assert (=> b!186368 m!289753))

(declare-fun m!289755 () Bool)

(assert (=> b!186368 m!289755))

(declare-fun m!289757 () Bool)

(assert (=> b!186368 m!289757))

(declare-fun m!289759 () Bool)

(assert (=> b!186368 m!289759))

(declare-fun m!289761 () Bool)

(assert (=> b!186368 m!289761))

(declare-fun m!289763 () Bool)

(assert (=> b!186368 m!289763))

(declare-fun m!289765 () Bool)

(assert (=> b!186368 m!289765))

(declare-fun m!289767 () Bool)

(assert (=> b!186368 m!289767))

(declare-fun m!289769 () Bool)

(assert (=> start!40548 m!289769))

(declare-fun m!289771 () Bool)

(assert (=> b!186360 m!289771))

(declare-fun m!289773 () Bool)

(assert (=> b!186357 m!289773))

(declare-fun m!289775 () Bool)

(assert (=> b!186357 m!289775))

(declare-fun m!289777 () Bool)

(assert (=> b!186357 m!289777))

(declare-fun m!289779 () Bool)

(assert (=> b!186364 m!289779))

(assert (=> b!186363 m!289773))

(assert (=> b!186363 m!289775))

(declare-fun m!289781 () Bool)

(assert (=> b!186361 m!289781))

(declare-fun m!289783 () Bool)

(assert (=> b!186366 m!289783))

(declare-fun m!289785 () Bool)

(assert (=> b!186369 m!289785))

(declare-fun m!289787 () Bool)

(assert (=> b!186374 m!289787))

(declare-fun m!289789 () Bool)

(assert (=> b!186374 m!289789))

(declare-fun m!289791 () Bool)

(assert (=> b!186374 m!289791))

(declare-fun m!289793 () Bool)

(assert (=> b!186374 m!289793))

(declare-fun m!289795 () Bool)

(assert (=> b!186372 m!289795))

(declare-fun m!289797 () Bool)

(assert (=> b!186362 m!289797))

(assert (=> b!186362 m!289797))

(declare-fun m!289799 () Bool)

(assert (=> b!186362 m!289799))

(declare-fun m!289801 () Bool)

(assert (=> b!186358 m!289801))

(assert (=> b!186375 m!289729))

(declare-fun m!289803 () Bool)

(assert (=> b!186373 m!289803))

(declare-fun m!289805 () Bool)

(assert (=> b!186370 m!289805))

(push 1)

(assert (not b!186373))

(assert (not start!40548))

(assert (not b!186374))

(assert (not b!186360))

(assert (not b!186366))

(assert (not b!186358))

(assert (not b!186364))

(assert (not b!186372))

(assert (not b!186362))

(assert (not b!186375))

(assert (not b!186363))

(assert (not b!186361))

(assert (not b!186357))

(assert (not b!186370))

(assert (not b!186368))

(assert (not b!186369))

(assert (not b!186359))

(assert (not b!186371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

