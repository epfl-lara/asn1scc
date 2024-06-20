; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41012 () Bool)

(assert start!41012)

(declare-fun b!190009 () Bool)

(declare-fun res!158477 () Bool)

(declare-fun e!131149 () Bool)

(assert (=> b!190009 (=> (not res!158477) (not e!131149))))

(declare-datatypes ((array!9902 0))(
  ( (array!9903 (arr!5296 (Array (_ BitVec 32) (_ BitVec 8))) (size!4366 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7840 0))(
  ( (BitStream!7841 (buf!4840 array!9902) (currentByte!9112 (_ BitVec 32)) (currentBit!9107 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7840)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!190009 (= res!158477 (invariant!0 (currentBit!9107 thiss!1204) (currentByte!9112 thiss!1204) (size!4366 (buf!4840 thiss!1204))))))

(declare-fun b!190010 () Bool)

(declare-fun e!131152 () Bool)

(assert (=> b!190010 (= e!131149 (not e!131152))))

(declare-fun res!158482 () Bool)

(assert (=> b!190010 (=> res!158482 e!131152)))

(declare-fun lt!294889 () (_ BitVec 64))

(declare-fun lt!294903 () (_ BitVec 64))

(assert (=> b!190010 (= res!158482 (not (= lt!294889 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294903))))))

(declare-datatypes ((Unit!13531 0))(
  ( (Unit!13532) )
))
(declare-datatypes ((tuple2!16436 0))(
  ( (tuple2!16437 (_1!8863 Unit!13531) (_2!8863 BitStream!7840)) )
))
(declare-fun lt!294878 () tuple2!16436)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190010 (= lt!294889 (bitIndex!0 (size!4366 (buf!4840 (_2!8863 lt!294878))) (currentByte!9112 (_2!8863 lt!294878)) (currentBit!9107 (_2!8863 lt!294878))))))

(assert (=> b!190010 (= lt!294903 (bitIndex!0 (size!4366 (buf!4840 thiss!1204)) (currentByte!9112 thiss!1204) (currentBit!9107 thiss!1204)))))

(declare-fun e!131151 () Bool)

(assert (=> b!190010 e!131151))

(declare-fun res!158483 () Bool)

(assert (=> b!190010 (=> (not res!158483) (not e!131151))))

(assert (=> b!190010 (= res!158483 (= (size!4366 (buf!4840 thiss!1204)) (size!4366 (buf!4840 (_2!8863 lt!294878)))))))

(declare-fun lt!294876 () Bool)

(declare-fun appendBit!0 (BitStream!7840 Bool) tuple2!16436)

(assert (=> b!190010 (= lt!294878 (appendBit!0 thiss!1204 lt!294876))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!294877 () (_ BitVec 64))

(assert (=> b!190010 (= lt!294876 (not (= (bvand v!189 lt!294877) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!190010 (= lt!294877 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun e!131147 () Bool)

(declare-datatypes ((tuple2!16438 0))(
  ( (tuple2!16439 (_1!8864 BitStream!7840) (_2!8864 (_ BitVec 64))) )
))
(declare-fun lt!294898 () tuple2!16438)

(declare-fun b!190011 () Bool)

(declare-fun lt!294891 () BitStream!7840)

(declare-fun lt!294904 () tuple2!16438)

(declare-datatypes ((tuple2!16440 0))(
  ( (tuple2!16441 (_1!8865 BitStream!7840) (_2!8865 BitStream!7840)) )
))
(declare-fun lt!294895 () tuple2!16440)

(assert (=> b!190011 (= e!131147 (and (= lt!294903 (bvsub lt!294889 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8865 lt!294895) lt!294891)) (= (_2!8864 lt!294904) (_2!8864 lt!294898)))))))

(declare-fun b!190012 () Bool)

(declare-fun res!158489 () Bool)

(declare-fun e!131143 () Bool)

(assert (=> b!190012 (=> res!158489 e!131143)))

(declare-fun lt!294887 () tuple2!16440)

(assert (=> b!190012 (= res!158489 (not (= (bitIndex!0 (size!4366 (buf!4840 (_1!8864 lt!294904))) (currentByte!9112 (_1!8864 lt!294904)) (currentBit!9107 (_1!8864 lt!294904))) (bitIndex!0 (size!4366 (buf!4840 (_2!8865 lt!294887))) (currentByte!9112 (_2!8865 lt!294887)) (currentBit!9107 (_2!8865 lt!294887))))))))

(declare-fun b!190013 () Bool)

(declare-fun res!158479 () Bool)

(declare-fun e!131148 () Bool)

(assert (=> b!190013 (=> res!158479 e!131148)))

(declare-fun lt!294890 () tuple2!16436)

(declare-fun isPrefixOf!0 (BitStream!7840 BitStream!7840) Bool)

(assert (=> b!190013 (= res!158479 (not (isPrefixOf!0 (_2!8863 lt!294878) (_2!8863 lt!294890))))))

(declare-fun b!190014 () Bool)

(declare-fun res!158473 () Bool)

(assert (=> b!190014 (=> (not res!158473) (not e!131149))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!190014 (= res!158473 (not (= i!590 nBits!348)))))

(declare-fun b!190015 () Bool)

(declare-fun e!131141 () Bool)

(declare-datatypes ((tuple2!16442 0))(
  ( (tuple2!16443 (_1!8866 BitStream!7840) (_2!8866 Bool)) )
))
(declare-fun lt!294884 () tuple2!16442)

(declare-fun lt!294901 () tuple2!16442)

(assert (=> b!190015 (= e!131141 (= (_2!8866 lt!294884) (_2!8866 lt!294901)))))

(declare-fun b!190016 () Bool)

(declare-fun res!158485 () Bool)

(declare-fun e!131144 () Bool)

(assert (=> b!190016 (=> (not res!158485) (not e!131144))))

(assert (=> b!190016 (= res!158485 (isPrefixOf!0 thiss!1204 (_2!8863 lt!294878)))))

(declare-fun b!190017 () Bool)

(declare-fun e!131145 () Bool)

(assert (=> b!190017 (= e!131145 (invariant!0 (currentBit!9107 thiss!1204) (currentByte!9112 thiss!1204) (size!4366 (buf!4840 (_2!8863 lt!294890)))))))

(declare-fun b!190018 () Bool)

(declare-fun res!158478 () Bool)

(assert (=> b!190018 (=> (not res!158478) (not e!131147))))

(declare-fun lt!294879 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7840 (_ BitVec 64)) BitStream!7840)

(assert (=> b!190018 (= res!158478 (= (_1!8865 lt!294895) (withMovedBitIndex!0 (_2!8865 lt!294895) (bvsub lt!294889 lt!294879))))))

(declare-fun b!190019 () Bool)

(declare-fun e!131140 () Bool)

(declare-fun array_inv!4107 (array!9902) Bool)

(assert (=> b!190019 (= e!131140 (array_inv!4107 (buf!4840 thiss!1204)))))

(declare-fun b!190021 () Bool)

(declare-fun e!131153 () Bool)

(assert (=> b!190021 (= e!131144 e!131153)))

(declare-fun res!158472 () Bool)

(assert (=> b!190021 (=> (not res!158472) (not e!131153))))

(declare-fun lt!294899 () tuple2!16442)

(assert (=> b!190021 (= res!158472 (and (= (_2!8866 lt!294899) lt!294876) (= (_1!8866 lt!294899) (_2!8863 lt!294878))))))

(declare-fun readBitPure!0 (BitStream!7840) tuple2!16442)

(declare-fun readerFrom!0 (BitStream!7840 (_ BitVec 32) (_ BitVec 32)) BitStream!7840)

(assert (=> b!190021 (= lt!294899 (readBitPure!0 (readerFrom!0 (_2!8863 lt!294878) (currentBit!9107 thiss!1204) (currentByte!9112 thiss!1204))))))

(declare-fun b!190022 () Bool)

(declare-fun e!131146 () Bool)

(assert (=> b!190022 (= e!131146 e!131149)))

(declare-fun res!158474 () Bool)

(assert (=> b!190022 (=> (not res!158474) (not e!131149))))

(declare-fun lt!294881 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!190022 (= res!158474 (validate_offset_bits!1 ((_ sign_extend 32) (size!4366 (buf!4840 thiss!1204))) ((_ sign_extend 32) (currentByte!9112 thiss!1204)) ((_ sign_extend 32) (currentBit!9107 thiss!1204)) lt!294881))))

(assert (=> b!190022 (= lt!294881 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!190023 () Bool)

(assert (=> b!190023 (= e!131152 e!131148)))

(declare-fun res!158492 () Bool)

(assert (=> b!190023 (=> res!158492 e!131148)))

(assert (=> b!190023 (= res!158492 (not (= lt!294879 (bvsub (bvsub (bvadd lt!294889 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!190023 (= lt!294879 (bitIndex!0 (size!4366 (buf!4840 (_2!8863 lt!294890))) (currentByte!9112 (_2!8863 lt!294890)) (currentBit!9107 (_2!8863 lt!294890))))))

(assert (=> b!190023 (isPrefixOf!0 thiss!1204 (_2!8863 lt!294890))))

(declare-fun lt!294900 () Unit!13531)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7840 BitStream!7840 BitStream!7840) Unit!13531)

(assert (=> b!190023 (= lt!294900 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8863 lt!294878) (_2!8863 lt!294890)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7840 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16436)

(assert (=> b!190023 (= lt!294890 (appendBitsLSBFirstLoopTR!0 (_2!8863 lt!294878) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!190024 () Bool)

(declare-fun lt!294888 () (_ BitVec 64))

(assert (=> b!190024 (= e!131153 (= (bitIndex!0 (size!4366 (buf!4840 (_1!8866 lt!294899))) (currentByte!9112 (_1!8866 lt!294899)) (currentBit!9107 (_1!8866 lt!294899))) lt!294888))))

(declare-fun b!190025 () Bool)

(declare-fun e!131150 () Bool)

(assert (=> b!190025 (= e!131150 e!131143)))

(declare-fun res!158488 () Bool)

(assert (=> b!190025 (=> res!158488 e!131143)))

(assert (=> b!190025 (= res!158488 (not (= (_1!8865 lt!294895) lt!294891)))))

(assert (=> b!190025 e!131147))

(declare-fun res!158480 () Bool)

(assert (=> b!190025 (=> (not res!158480) (not e!131147))))

(declare-fun lt!294896 () tuple2!16438)

(assert (=> b!190025 (= res!158480 (and (= (_2!8864 lt!294904) (_2!8864 lt!294896)) (= (_1!8864 lt!294904) (_1!8864 lt!294896))))))

(declare-fun lt!294902 () (_ BitVec 64))

(declare-fun lt!294894 () Unit!13531)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13531)

(assert (=> b!190025 (= lt!294894 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8865 lt!294887) nBits!348 i!590 lt!294902))))

(declare-fun lt!294880 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16438)

(assert (=> b!190025 (= lt!294896 (readNBitsLSBFirstsLoopPure!0 lt!294891 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294880))))

(assert (=> b!190025 (= lt!294891 (withMovedBitIndex!0 (_1!8865 lt!294887) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!190026 () Bool)

(declare-fun res!158484 () Bool)

(assert (=> b!190026 (=> res!158484 e!131148)))

(assert (=> b!190026 (= res!158484 (not (invariant!0 (currentBit!9107 (_2!8863 lt!294890)) (currentByte!9112 (_2!8863 lt!294890)) (size!4366 (buf!4840 (_2!8863 lt!294890))))))))

(declare-fun b!190027 () Bool)

(declare-fun res!158476 () Bool)

(assert (=> b!190027 (=> res!158476 e!131148)))

(assert (=> b!190027 (= res!158476 (or (not (= (size!4366 (buf!4840 (_2!8863 lt!294890))) (size!4366 (buf!4840 thiss!1204)))) (not (= lt!294879 (bvsub (bvadd lt!294903 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!190028 () Bool)

(assert (=> b!190028 (= e!131151 e!131144)))

(declare-fun res!158487 () Bool)

(assert (=> b!190028 (=> (not res!158487) (not e!131144))))

(declare-fun lt!294892 () (_ BitVec 64))

(assert (=> b!190028 (= res!158487 (= lt!294888 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294892)))))

(assert (=> b!190028 (= lt!294888 (bitIndex!0 (size!4366 (buf!4840 (_2!8863 lt!294878))) (currentByte!9112 (_2!8863 lt!294878)) (currentBit!9107 (_2!8863 lt!294878))))))

(assert (=> b!190028 (= lt!294892 (bitIndex!0 (size!4366 (buf!4840 thiss!1204)) (currentByte!9112 thiss!1204) (currentBit!9107 thiss!1204)))))

(declare-fun b!190029 () Bool)

(assert (=> b!190029 (= e!131143 true)))

(assert (=> b!190029 (= (size!4366 (buf!4840 thiss!1204)) (size!4366 (buf!4840 (_2!8863 lt!294890))))))

(declare-fun b!190030 () Bool)

(declare-fun res!158481 () Bool)

(assert (=> b!190030 (=> res!158481 e!131148)))

(assert (=> b!190030 (= res!158481 (not (isPrefixOf!0 thiss!1204 (_2!8863 lt!294878))))))

(declare-fun b!190031 () Bool)

(assert (=> b!190031 (= e!131148 e!131150)))

(declare-fun res!158490 () Bool)

(assert (=> b!190031 (=> res!158490 e!131150)))

(assert (=> b!190031 (= res!158490 (not (= (_1!8864 lt!294898) (_2!8865 lt!294895))))))

(assert (=> b!190031 (= lt!294898 (readNBitsLSBFirstsLoopPure!0 (_1!8865 lt!294895) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294880))))

(declare-fun lt!294893 () (_ BitVec 64))

(assert (=> b!190031 (validate_offset_bits!1 ((_ sign_extend 32) (size!4366 (buf!4840 (_2!8863 lt!294890)))) ((_ sign_extend 32) (currentByte!9112 (_2!8863 lt!294878))) ((_ sign_extend 32) (currentBit!9107 (_2!8863 lt!294878))) lt!294893)))

(declare-fun lt!294897 () Unit!13531)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7840 array!9902 (_ BitVec 64)) Unit!13531)

(assert (=> b!190031 (= lt!294897 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8863 lt!294878) (buf!4840 (_2!8863 lt!294890)) lt!294893))))

(assert (=> b!190031 (= lt!294893 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!294886 () tuple2!16442)

(assert (=> b!190031 (= lt!294880 (bvor lt!294902 (ite (_2!8866 lt!294886) lt!294877 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!190031 (= lt!294904 (readNBitsLSBFirstsLoopPure!0 (_1!8865 lt!294887) nBits!348 i!590 lt!294902))))

(assert (=> b!190031 (validate_offset_bits!1 ((_ sign_extend 32) (size!4366 (buf!4840 (_2!8863 lt!294890)))) ((_ sign_extend 32) (currentByte!9112 thiss!1204)) ((_ sign_extend 32) (currentBit!9107 thiss!1204)) lt!294881)))

(declare-fun lt!294882 () Unit!13531)

(assert (=> b!190031 (= lt!294882 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4840 (_2!8863 lt!294890)) lt!294881))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!190031 (= lt!294902 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!190031 (= (_2!8866 lt!294886) lt!294876)))

(assert (=> b!190031 (= lt!294886 (readBitPure!0 (_1!8865 lt!294887)))))

(declare-fun reader!0 (BitStream!7840 BitStream!7840) tuple2!16440)

(assert (=> b!190031 (= lt!294895 (reader!0 (_2!8863 lt!294878) (_2!8863 lt!294890)))))

(assert (=> b!190031 (= lt!294887 (reader!0 thiss!1204 (_2!8863 lt!294890)))))

(assert (=> b!190031 e!131141))

(declare-fun res!158486 () Bool)

(assert (=> b!190031 (=> (not res!158486) (not e!131141))))

(assert (=> b!190031 (= res!158486 (= (bitIndex!0 (size!4366 (buf!4840 (_1!8866 lt!294884))) (currentByte!9112 (_1!8866 lt!294884)) (currentBit!9107 (_1!8866 lt!294884))) (bitIndex!0 (size!4366 (buf!4840 (_1!8866 lt!294901))) (currentByte!9112 (_1!8866 lt!294901)) (currentBit!9107 (_1!8866 lt!294901)))))))

(declare-fun lt!294885 () Unit!13531)

(declare-fun lt!294883 () BitStream!7840)

(declare-fun readBitPrefixLemma!0 (BitStream!7840 BitStream!7840) Unit!13531)

(assert (=> b!190031 (= lt!294885 (readBitPrefixLemma!0 lt!294883 (_2!8863 lt!294890)))))

(assert (=> b!190031 (= lt!294901 (readBitPure!0 (BitStream!7841 (buf!4840 (_2!8863 lt!294890)) (currentByte!9112 thiss!1204) (currentBit!9107 thiss!1204))))))

(assert (=> b!190031 (= lt!294884 (readBitPure!0 lt!294883))))

(assert (=> b!190031 e!131145))

(declare-fun res!158491 () Bool)

(assert (=> b!190031 (=> (not res!158491) (not e!131145))))

(assert (=> b!190031 (= res!158491 (invariant!0 (currentBit!9107 thiss!1204) (currentByte!9112 thiss!1204) (size!4366 (buf!4840 (_2!8863 lt!294878)))))))

(assert (=> b!190031 (= lt!294883 (BitStream!7841 (buf!4840 (_2!8863 lt!294878)) (currentByte!9112 thiss!1204) (currentBit!9107 thiss!1204)))))

(declare-fun res!158475 () Bool)

(assert (=> start!41012 (=> (not res!158475) (not e!131146))))

(assert (=> start!41012 (= res!158475 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41012 e!131146))

(assert (=> start!41012 true))

(declare-fun inv!12 (BitStream!7840) Bool)

(assert (=> start!41012 (and (inv!12 thiss!1204) e!131140)))

(declare-fun b!190020 () Bool)

(declare-fun res!158493 () Bool)

(assert (=> b!190020 (=> (not res!158493) (not e!131147))))

(assert (=> b!190020 (= res!158493 (= (_1!8865 lt!294887) (withMovedBitIndex!0 (_2!8865 lt!294887) (bvsub lt!294903 lt!294879))))))

(assert (= (and start!41012 res!158475) b!190022))

(assert (= (and b!190022 res!158474) b!190009))

(assert (= (and b!190009 res!158477) b!190014))

(assert (= (and b!190014 res!158473) b!190010))

(assert (= (and b!190010 res!158483) b!190028))

(assert (= (and b!190028 res!158487) b!190016))

(assert (= (and b!190016 res!158485) b!190021))

(assert (= (and b!190021 res!158472) b!190024))

(assert (= (and b!190010 (not res!158482)) b!190023))

(assert (= (and b!190023 (not res!158492)) b!190026))

(assert (= (and b!190026 (not res!158484)) b!190027))

(assert (= (and b!190027 (not res!158476)) b!190013))

(assert (= (and b!190013 (not res!158479)) b!190030))

(assert (= (and b!190030 (not res!158481)) b!190031))

(assert (= (and b!190031 res!158491) b!190017))

(assert (= (and b!190031 res!158486) b!190015))

(assert (= (and b!190031 (not res!158490)) b!190025))

(assert (= (and b!190025 res!158480) b!190020))

(assert (= (and b!190020 res!158493) b!190018))

(assert (= (and b!190018 res!158478) b!190011))

(assert (= (and b!190025 (not res!158488)) b!190012))

(assert (= (and b!190012 (not res!158489)) b!190029))

(assert (= start!41012 b!190019))

(declare-fun m!295127 () Bool)

(assert (=> b!190010 m!295127))

(declare-fun m!295129 () Bool)

(assert (=> b!190010 m!295129))

(declare-fun m!295131 () Bool)

(assert (=> b!190010 m!295131))

(declare-fun m!295133 () Bool)

(assert (=> b!190025 m!295133))

(declare-fun m!295135 () Bool)

(assert (=> b!190025 m!295135))

(declare-fun m!295137 () Bool)

(assert (=> b!190025 m!295137))

(declare-fun m!295139 () Bool)

(assert (=> b!190013 m!295139))

(declare-fun m!295141 () Bool)

(assert (=> b!190009 m!295141))

(declare-fun m!295143 () Bool)

(assert (=> b!190017 m!295143))

(declare-fun m!295145 () Bool)

(assert (=> b!190031 m!295145))

(declare-fun m!295147 () Bool)

(assert (=> b!190031 m!295147))

(declare-fun m!295149 () Bool)

(assert (=> b!190031 m!295149))

(declare-fun m!295151 () Bool)

(assert (=> b!190031 m!295151))

(declare-fun m!295153 () Bool)

(assert (=> b!190031 m!295153))

(declare-fun m!295155 () Bool)

(assert (=> b!190031 m!295155))

(declare-fun m!295157 () Bool)

(assert (=> b!190031 m!295157))

(declare-fun m!295159 () Bool)

(assert (=> b!190031 m!295159))

(declare-fun m!295161 () Bool)

(assert (=> b!190031 m!295161))

(declare-fun m!295163 () Bool)

(assert (=> b!190031 m!295163))

(declare-fun m!295165 () Bool)

(assert (=> b!190031 m!295165))

(declare-fun m!295167 () Bool)

(assert (=> b!190031 m!295167))

(declare-fun m!295169 () Bool)

(assert (=> b!190031 m!295169))

(declare-fun m!295171 () Bool)

(assert (=> b!190031 m!295171))

(declare-fun m!295173 () Bool)

(assert (=> b!190031 m!295173))

(declare-fun m!295175 () Bool)

(assert (=> b!190031 m!295175))

(declare-fun m!295177 () Bool)

(assert (=> b!190016 m!295177))

(declare-fun m!295179 () Bool)

(assert (=> b!190021 m!295179))

(assert (=> b!190021 m!295179))

(declare-fun m!295181 () Bool)

(assert (=> b!190021 m!295181))

(declare-fun m!295183 () Bool)

(assert (=> b!190024 m!295183))

(declare-fun m!295185 () Bool)

(assert (=> start!41012 m!295185))

(assert (=> b!190028 m!295127))

(assert (=> b!190028 m!295129))

(declare-fun m!295187 () Bool)

(assert (=> b!190026 m!295187))

(declare-fun m!295189 () Bool)

(assert (=> b!190012 m!295189))

(declare-fun m!295191 () Bool)

(assert (=> b!190012 m!295191))

(declare-fun m!295193 () Bool)

(assert (=> b!190020 m!295193))

(declare-fun m!295195 () Bool)

(assert (=> b!190023 m!295195))

(declare-fun m!295197 () Bool)

(assert (=> b!190023 m!295197))

(declare-fun m!295199 () Bool)

(assert (=> b!190023 m!295199))

(declare-fun m!295201 () Bool)

(assert (=> b!190023 m!295201))

(assert (=> b!190030 m!295177))

(declare-fun m!295203 () Bool)

(assert (=> b!190018 m!295203))

(declare-fun m!295205 () Bool)

(assert (=> b!190019 m!295205))

(declare-fun m!295207 () Bool)

(assert (=> b!190022 m!295207))

(push 1)

(assert (not b!190030))

(assert (not b!190012))

(assert (not b!190028))

(assert (not b!190023))

(assert (not b!190022))

(assert (not b!190018))

(assert (not b!190009))

(assert (not b!190013))

(assert (not b!190016))

(assert (not b!190031))

(assert (not b!190020))

(assert (not b!190010))

(assert (not b!190021))

(assert (not start!41012))

(assert (not b!190025))

(assert (not b!190026))

(assert (not b!190017))

(assert (not b!190019))

(assert (not b!190024))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

