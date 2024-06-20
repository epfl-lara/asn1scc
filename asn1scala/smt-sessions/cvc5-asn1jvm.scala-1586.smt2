; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45270 () Bool)

(assert start!45270)

(declare-fun b!218442 () Bool)

(declare-fun e!148433 () Bool)

(declare-fun e!148424 () Bool)

(assert (=> b!218442 (= e!148433 e!148424)))

(declare-fun res!183897 () Bool)

(assert (=> b!218442 (=> (not res!183897) (not e!148424))))

(declare-fun lt!346146 () (_ BitVec 64))

(declare-fun lt!346136 () (_ BitVec 64))

(assert (=> b!218442 (= res!183897 (= lt!346146 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346136)))))

(declare-datatypes ((array!10634 0))(
  ( (array!10635 (arr!5599 (Array (_ BitVec 32) (_ BitVec 8))) (size!4669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8446 0))(
  ( (BitStream!8447 (buf!5216 array!10634) (currentByte!9815 (_ BitVec 32)) (currentBit!9810 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15535 0))(
  ( (Unit!15536) )
))
(declare-datatypes ((tuple2!18614 0))(
  ( (tuple2!18615 (_1!9965 Unit!15535) (_2!9965 BitStream!8446)) )
))
(declare-fun lt!346121 () tuple2!18614)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218442 (= lt!346146 (bitIndex!0 (size!4669 (buf!5216 (_2!9965 lt!346121))) (currentByte!9815 (_2!9965 lt!346121)) (currentBit!9810 (_2!9965 lt!346121))))))

(declare-fun thiss!1204 () BitStream!8446)

(assert (=> b!218442 (= lt!346136 (bitIndex!0 (size!4669 (buf!5216 thiss!1204)) (currentByte!9815 thiss!1204) (currentBit!9810 thiss!1204)))))

(declare-fun b!218443 () Bool)

(declare-fun e!148431 () Bool)

(declare-fun e!148422 () Bool)

(assert (=> b!218443 (= e!148431 e!148422)))

(declare-fun res!183892 () Bool)

(assert (=> b!218443 (=> res!183892 e!148422)))

(declare-fun lt!346147 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!346126 () (_ BitVec 64))

(assert (=> b!218443 (= res!183892 (not (= lt!346126 (bvsub (bvsub (bvadd lt!346147 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!346142 () tuple2!18614)

(assert (=> b!218443 (= lt!346126 (bitIndex!0 (size!4669 (buf!5216 (_2!9965 lt!346142))) (currentByte!9815 (_2!9965 lt!346142)) (currentBit!9810 (_2!9965 lt!346142))))))

(declare-fun isPrefixOf!0 (BitStream!8446 BitStream!8446) Bool)

(assert (=> b!218443 (isPrefixOf!0 thiss!1204 (_2!9965 lt!346142))))

(declare-fun lt!346133 () Unit!15535)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8446 BitStream!8446 BitStream!8446) Unit!15535)

(assert (=> b!218443 (= lt!346133 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9965 lt!346121) (_2!9965 lt!346142)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8446 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18614)

(assert (=> b!218443 (= lt!346142 (appendBitsLSBFirstLoopTR!0 (_2!9965 lt!346121) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!218444 () Bool)

(declare-fun res!183896 () Bool)

(assert (=> b!218444 (=> res!183896 e!148422)))

(declare-fun lt!346128 () (_ BitVec 64))

(assert (=> b!218444 (= res!183896 (or (not (= (size!4669 (buf!5216 (_2!9965 lt!346142))) (size!4669 (buf!5216 thiss!1204)))) (not (= lt!346126 (bvsub (bvadd lt!346128 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!218445 () Bool)

(declare-fun res!183893 () Bool)

(declare-fun e!148426 () Bool)

(assert (=> b!218445 (=> (not res!183893) (not e!148426))))

(declare-datatypes ((tuple2!18616 0))(
  ( (tuple2!18617 (_1!9966 BitStream!8446) (_2!9966 BitStream!8446)) )
))
(declare-fun lt!346134 () tuple2!18616)

(declare-fun withMovedBitIndex!0 (BitStream!8446 (_ BitVec 64)) BitStream!8446)

(assert (=> b!218445 (= res!183893 (= (_1!9966 lt!346134) (withMovedBitIndex!0 (_2!9966 lt!346134) (bvsub lt!346147 lt!346126))))))

(declare-fun b!218446 () Bool)

(declare-fun res!183882 () Bool)

(declare-fun e!148434 () Bool)

(assert (=> b!218446 (=> (not res!183882) (not e!148434))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!218446 (= res!183882 (invariant!0 (currentBit!9810 thiss!1204) (currentByte!9815 thiss!1204) (size!4669 (buf!5216 thiss!1204))))))

(declare-fun b!218447 () Bool)

(declare-fun res!183883 () Bool)

(assert (=> b!218447 (=> res!183883 e!148422)))

(assert (=> b!218447 (= res!183883 (not (isPrefixOf!0 thiss!1204 (_2!9965 lt!346121))))))

(declare-fun b!218448 () Bool)

(declare-fun e!148432 () Bool)

(declare-fun lt!346137 () (_ BitVec 64))

(assert (=> b!218448 (= e!148432 (bvsge lt!346137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148425 () Bool)

(assert (=> b!218448 e!148425))

(declare-fun res!183894 () Bool)

(assert (=> b!218448 (=> (not res!183894) (not e!148425))))

(assert (=> b!218448 (= res!183894 (= (size!4669 (buf!5216 thiss!1204)) (size!4669 (buf!5216 (_2!9965 lt!346142)))))))

(declare-fun b!218449 () Bool)

(declare-fun e!148430 () Bool)

(declare-datatypes ((tuple2!18618 0))(
  ( (tuple2!18619 (_1!9967 BitStream!8446) (_2!9967 Bool)) )
))
(declare-fun lt!346132 () tuple2!18618)

(assert (=> b!218449 (= e!148430 (= (bitIndex!0 (size!4669 (buf!5216 (_1!9967 lt!346132))) (currentByte!9815 (_1!9967 lt!346132)) (currentBit!9810 (_1!9967 lt!346132))) lt!346146))))

(declare-fun b!218450 () Bool)

(assert (=> b!218450 (= e!148424 e!148430)))

(declare-fun res!183879 () Bool)

(assert (=> b!218450 (=> (not res!183879) (not e!148430))))

(declare-fun lt!346125 () Bool)

(assert (=> b!218450 (= res!183879 (and (= (_2!9967 lt!346132) lt!346125) (= (_1!9967 lt!346132) (_2!9965 lt!346121))))))

(declare-fun readBitPure!0 (BitStream!8446) tuple2!18618)

(declare-fun readerFrom!0 (BitStream!8446 (_ BitVec 32) (_ BitVec 32)) BitStream!8446)

(assert (=> b!218450 (= lt!346132 (readBitPure!0 (readerFrom!0 (_2!9965 lt!346121) (currentBit!9810 thiss!1204) (currentByte!9815 thiss!1204))))))

(declare-fun b!218452 () Bool)

(declare-fun lt!346144 () BitStream!8446)

(declare-datatypes ((tuple2!18620 0))(
  ( (tuple2!18621 (_1!9968 BitStream!8446) (_2!9968 (_ BitVec 64))) )
))
(declare-fun lt!346138 () tuple2!18620)

(declare-fun lt!346139 () tuple2!18620)

(assert (=> b!218452 (= e!148426 (and (= lt!346128 (bvsub lt!346147 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9966 lt!346134) lt!346144)) (= (_2!9968 lt!346138) (_2!9968 lt!346139)))))))

(declare-fun b!218453 () Bool)

(assert (=> b!218453 (= e!148434 (not e!148431))))

(declare-fun res!183899 () Bool)

(assert (=> b!218453 (=> res!183899 e!148431)))

(assert (=> b!218453 (= res!183899 (not (= lt!346147 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!346128))))))

(assert (=> b!218453 (= lt!346147 (bitIndex!0 (size!4669 (buf!5216 (_2!9965 lt!346121))) (currentByte!9815 (_2!9965 lt!346121)) (currentBit!9810 (_2!9965 lt!346121))))))

(assert (=> b!218453 (= lt!346128 (bitIndex!0 (size!4669 (buf!5216 thiss!1204)) (currentByte!9815 thiss!1204) (currentBit!9810 thiss!1204)))))

(assert (=> b!218453 e!148433))

(declare-fun res!183895 () Bool)

(assert (=> b!218453 (=> (not res!183895) (not e!148433))))

(assert (=> b!218453 (= res!183895 (= (size!4669 (buf!5216 thiss!1204)) (size!4669 (buf!5216 (_2!9965 lt!346121)))))))

(declare-fun appendBit!0 (BitStream!8446 Bool) tuple2!18614)

(assert (=> b!218453 (= lt!346121 (appendBit!0 thiss!1204 lt!346125))))

(declare-fun lt!346131 () (_ BitVec 64))

(assert (=> b!218453 (= lt!346125 (not (= (bvand v!189 lt!346131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!218453 (= lt!346131 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!218454 () Bool)

(declare-fun e!148429 () Bool)

(declare-fun array_inv!4410 (array!10634) Bool)

(assert (=> b!218454 (= e!148429 (array_inv!4410 (buf!5216 thiss!1204)))))

(declare-fun b!218455 () Bool)

(declare-fun res!183888 () Bool)

(assert (=> b!218455 (=> res!183888 e!148422)))

(assert (=> b!218455 (= res!183888 (not (invariant!0 (currentBit!9810 (_2!9965 lt!346142)) (currentByte!9815 (_2!9965 lt!346142)) (size!4669 (buf!5216 (_2!9965 lt!346142))))))))

(declare-fun b!218456 () Bool)

(declare-fun res!183878 () Bool)

(assert (=> b!218456 (=> (not res!183878) (not e!148424))))

(assert (=> b!218456 (= res!183878 (isPrefixOf!0 thiss!1204 (_2!9965 lt!346121)))))

(declare-fun b!218457 () Bool)

(declare-fun res!183880 () Bool)

(assert (=> b!218457 (=> (not res!183880) (not e!148434))))

(assert (=> b!218457 (= res!183880 (not (= i!590 nBits!348)))))

(declare-fun b!218458 () Bool)

(declare-fun e!148423 () Bool)

(assert (=> b!218458 (= e!148422 e!148423)))

(declare-fun res!183877 () Bool)

(assert (=> b!218458 (=> res!183877 e!148423)))

(assert (=> b!218458 (= res!183877 (not (= (_1!9968 lt!346139) (_2!9966 lt!346134))))))

(declare-fun lt!346135 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18620)

(assert (=> b!218458 (= lt!346139 (readNBitsLSBFirstsLoopPure!0 (_1!9966 lt!346134) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346135))))

(declare-fun lt!346124 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!218458 (validate_offset_bits!1 ((_ sign_extend 32) (size!4669 (buf!5216 (_2!9965 lt!346142)))) ((_ sign_extend 32) (currentByte!9815 (_2!9965 lt!346121))) ((_ sign_extend 32) (currentBit!9810 (_2!9965 lt!346121))) lt!346124)))

(declare-fun lt!346120 () Unit!15535)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8446 array!10634 (_ BitVec 64)) Unit!15535)

(assert (=> b!218458 (= lt!346120 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9965 lt!346121) (buf!5216 (_2!9965 lt!346142)) lt!346124))))

(assert (=> b!218458 (= lt!346124 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!346145 () tuple2!18618)

(declare-fun lt!346141 () (_ BitVec 64))

(assert (=> b!218458 (= lt!346135 (bvor lt!346141 (ite (_2!9967 lt!346145) lt!346131 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!346148 () tuple2!18616)

(assert (=> b!218458 (= lt!346138 (readNBitsLSBFirstsLoopPure!0 (_1!9966 lt!346148) nBits!348 i!590 lt!346141))))

(assert (=> b!218458 (validate_offset_bits!1 ((_ sign_extend 32) (size!4669 (buf!5216 (_2!9965 lt!346142)))) ((_ sign_extend 32) (currentByte!9815 thiss!1204)) ((_ sign_extend 32) (currentBit!9810 thiss!1204)) lt!346137)))

(declare-fun lt!346143 () Unit!15535)

(assert (=> b!218458 (= lt!346143 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5216 (_2!9965 lt!346142)) lt!346137))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!218458 (= lt!346141 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!218458 (= (_2!9967 lt!346145) lt!346125)))

(assert (=> b!218458 (= lt!346145 (readBitPure!0 (_1!9966 lt!346148)))))

(declare-fun reader!0 (BitStream!8446 BitStream!8446) tuple2!18616)

(assert (=> b!218458 (= lt!346134 (reader!0 (_2!9965 lt!346121) (_2!9965 lt!346142)))))

(assert (=> b!218458 (= lt!346148 (reader!0 thiss!1204 (_2!9965 lt!346142)))))

(declare-fun e!148420 () Bool)

(assert (=> b!218458 e!148420))

(declare-fun res!183887 () Bool)

(assert (=> b!218458 (=> (not res!183887) (not e!148420))))

(declare-fun lt!346129 () tuple2!18618)

(declare-fun lt!346130 () tuple2!18618)

(assert (=> b!218458 (= res!183887 (= (bitIndex!0 (size!4669 (buf!5216 (_1!9967 lt!346129))) (currentByte!9815 (_1!9967 lt!346129)) (currentBit!9810 (_1!9967 lt!346129))) (bitIndex!0 (size!4669 (buf!5216 (_1!9967 lt!346130))) (currentByte!9815 (_1!9967 lt!346130)) (currentBit!9810 (_1!9967 lt!346130)))))))

(declare-fun lt!346123 () Unit!15535)

(declare-fun lt!346140 () BitStream!8446)

(declare-fun readBitPrefixLemma!0 (BitStream!8446 BitStream!8446) Unit!15535)

(assert (=> b!218458 (= lt!346123 (readBitPrefixLemma!0 lt!346140 (_2!9965 lt!346142)))))

(assert (=> b!218458 (= lt!346130 (readBitPure!0 (BitStream!8447 (buf!5216 (_2!9965 lt!346142)) (currentByte!9815 thiss!1204) (currentBit!9810 thiss!1204))))))

(assert (=> b!218458 (= lt!346129 (readBitPure!0 lt!346140))))

(declare-fun e!148427 () Bool)

(assert (=> b!218458 e!148427))

(declare-fun res!183891 () Bool)

(assert (=> b!218458 (=> (not res!183891) (not e!148427))))

(assert (=> b!218458 (= res!183891 (invariant!0 (currentBit!9810 thiss!1204) (currentByte!9815 thiss!1204) (size!4669 (buf!5216 (_2!9965 lt!346121)))))))

(assert (=> b!218458 (= lt!346140 (BitStream!8447 (buf!5216 (_2!9965 lt!346121)) (currentByte!9815 thiss!1204) (currentBit!9810 thiss!1204)))))

(declare-fun b!218459 () Bool)

(declare-fun e!148421 () Bool)

(assert (=> b!218459 (= e!148421 e!148434)))

(declare-fun res!183885 () Bool)

(assert (=> b!218459 (=> (not res!183885) (not e!148434))))

(assert (=> b!218459 (= res!183885 (validate_offset_bits!1 ((_ sign_extend 32) (size!4669 (buf!5216 thiss!1204))) ((_ sign_extend 32) (currentByte!9815 thiss!1204)) ((_ sign_extend 32) (currentBit!9810 thiss!1204)) lt!346137))))

(assert (=> b!218459 (= lt!346137 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!218460 () Bool)

(assert (=> b!218460 (= e!148423 e!148432)))

(declare-fun res!183889 () Bool)

(assert (=> b!218460 (=> res!183889 e!148432)))

(assert (=> b!218460 (= res!183889 (not (= (_1!9966 lt!346134) lt!346144)))))

(assert (=> b!218460 e!148426))

(declare-fun res!183881 () Bool)

(assert (=> b!218460 (=> (not res!183881) (not e!148426))))

(declare-fun lt!346122 () tuple2!18620)

(assert (=> b!218460 (= res!183881 (and (= (_2!9968 lt!346138) (_2!9968 lt!346122)) (= (_1!9968 lt!346138) (_1!9968 lt!346122))))))

(declare-fun lt!346127 () Unit!15535)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15535)

(assert (=> b!218460 (= lt!346127 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9966 lt!346148) nBits!348 i!590 lt!346141))))

(assert (=> b!218460 (= lt!346122 (readNBitsLSBFirstsLoopPure!0 lt!346144 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!346135))))

(assert (=> b!218460 (= lt!346144 (withMovedBitIndex!0 (_1!9966 lt!346148) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!218461 () Bool)

(assert (=> b!218461 (= e!148420 (= (_2!9967 lt!346129) (_2!9967 lt!346130)))))

(declare-fun b!218462 () Bool)

(assert (=> b!218462 (= e!148425 (= (_1!9968 lt!346138) (_2!9966 lt!346148)))))

(declare-fun b!218463 () Bool)

(declare-fun res!183890 () Bool)

(assert (=> b!218463 (=> (not res!183890) (not e!148425))))

(assert (=> b!218463 (= res!183890 (= (_2!9968 lt!346138) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!218464 () Bool)

(declare-fun res!183886 () Bool)

(assert (=> b!218464 (=> (not res!183886) (not e!148426))))

(assert (=> b!218464 (= res!183886 (= (_1!9966 lt!346148) (withMovedBitIndex!0 (_2!9966 lt!346148) (bvsub lt!346128 lt!346126))))))

(declare-fun b!218465 () Bool)

(declare-fun res!183898 () Bool)

(assert (=> b!218465 (=> res!183898 e!148422)))

(assert (=> b!218465 (= res!183898 (not (isPrefixOf!0 (_2!9965 lt!346121) (_2!9965 lt!346142))))))

(declare-fun b!218466 () Bool)

(assert (=> b!218466 (= e!148427 (invariant!0 (currentBit!9810 thiss!1204) (currentByte!9815 thiss!1204) (size!4669 (buf!5216 (_2!9965 lt!346142)))))))

(declare-fun res!183884 () Bool)

(assert (=> start!45270 (=> (not res!183884) (not e!148421))))

(assert (=> start!45270 (= res!183884 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45270 e!148421))

(assert (=> start!45270 true))

(declare-fun inv!12 (BitStream!8446) Bool)

(assert (=> start!45270 (and (inv!12 thiss!1204) e!148429)))

(declare-fun b!218451 () Bool)

(declare-fun res!183876 () Bool)

(assert (=> b!218451 (=> res!183876 e!148432)))

(assert (=> b!218451 (= res!183876 (not (= (bitIndex!0 (size!4669 (buf!5216 (_1!9968 lt!346138))) (currentByte!9815 (_1!9968 lt!346138)) (currentBit!9810 (_1!9968 lt!346138))) (bitIndex!0 (size!4669 (buf!5216 (_2!9966 lt!346148))) (currentByte!9815 (_2!9966 lt!346148)) (currentBit!9810 (_2!9966 lt!346148))))))))

(assert (= (and start!45270 res!183884) b!218459))

(assert (= (and b!218459 res!183885) b!218446))

(assert (= (and b!218446 res!183882) b!218457))

(assert (= (and b!218457 res!183880) b!218453))

(assert (= (and b!218453 res!183895) b!218442))

(assert (= (and b!218442 res!183897) b!218456))

(assert (= (and b!218456 res!183878) b!218450))

(assert (= (and b!218450 res!183879) b!218449))

(assert (= (and b!218453 (not res!183899)) b!218443))

(assert (= (and b!218443 (not res!183892)) b!218455))

(assert (= (and b!218455 (not res!183888)) b!218444))

(assert (= (and b!218444 (not res!183896)) b!218465))

(assert (= (and b!218465 (not res!183898)) b!218447))

(assert (= (and b!218447 (not res!183883)) b!218458))

(assert (= (and b!218458 res!183891) b!218466))

(assert (= (and b!218458 res!183887) b!218461))

(assert (= (and b!218458 (not res!183877)) b!218460))

(assert (= (and b!218460 res!183881) b!218464))

(assert (= (and b!218464 res!183886) b!218445))

(assert (= (and b!218445 res!183893) b!218452))

(assert (= (and b!218460 (not res!183889)) b!218451))

(assert (= (and b!218451 (not res!183876)) b!218448))

(assert (= (and b!218448 res!183894) b!218463))

(assert (= (and b!218463 res!183890) b!218462))

(assert (= start!45270 b!218454))

(declare-fun m!336939 () Bool)

(assert (=> b!218460 m!336939))

(declare-fun m!336941 () Bool)

(assert (=> b!218460 m!336941))

(declare-fun m!336943 () Bool)

(assert (=> b!218460 m!336943))

(declare-fun m!336945 () Bool)

(assert (=> b!218459 m!336945))

(declare-fun m!336947 () Bool)

(assert (=> b!218450 m!336947))

(assert (=> b!218450 m!336947))

(declare-fun m!336949 () Bool)

(assert (=> b!218450 m!336949))

(declare-fun m!336951 () Bool)

(assert (=> start!45270 m!336951))

(declare-fun m!336953 () Bool)

(assert (=> b!218464 m!336953))

(declare-fun m!336955 () Bool)

(assert (=> b!218442 m!336955))

(declare-fun m!336957 () Bool)

(assert (=> b!218442 m!336957))

(declare-fun m!336959 () Bool)

(assert (=> b!218445 m!336959))

(declare-fun m!336961 () Bool)

(assert (=> b!218455 m!336961))

(declare-fun m!336963 () Bool)

(assert (=> b!218466 m!336963))

(assert (=> b!218453 m!336955))

(assert (=> b!218453 m!336957))

(declare-fun m!336965 () Bool)

(assert (=> b!218453 m!336965))

(declare-fun m!336967 () Bool)

(assert (=> b!218449 m!336967))

(declare-fun m!336969 () Bool)

(assert (=> b!218458 m!336969))

(declare-fun m!336971 () Bool)

(assert (=> b!218458 m!336971))

(declare-fun m!336973 () Bool)

(assert (=> b!218458 m!336973))

(declare-fun m!336975 () Bool)

(assert (=> b!218458 m!336975))

(declare-fun m!336977 () Bool)

(assert (=> b!218458 m!336977))

(declare-fun m!336979 () Bool)

(assert (=> b!218458 m!336979))

(declare-fun m!336981 () Bool)

(assert (=> b!218458 m!336981))

(declare-fun m!336983 () Bool)

(assert (=> b!218458 m!336983))

(declare-fun m!336985 () Bool)

(assert (=> b!218458 m!336985))

(declare-fun m!336987 () Bool)

(assert (=> b!218458 m!336987))

(declare-fun m!336989 () Bool)

(assert (=> b!218458 m!336989))

(declare-fun m!336991 () Bool)

(assert (=> b!218458 m!336991))

(declare-fun m!336993 () Bool)

(assert (=> b!218458 m!336993))

(declare-fun m!336995 () Bool)

(assert (=> b!218458 m!336995))

(declare-fun m!336997 () Bool)

(assert (=> b!218458 m!336997))

(declare-fun m!336999 () Bool)

(assert (=> b!218458 m!336999))

(declare-fun m!337001 () Bool)

(assert (=> b!218447 m!337001))

(declare-fun m!337003 () Bool)

(assert (=> b!218443 m!337003))

(declare-fun m!337005 () Bool)

(assert (=> b!218443 m!337005))

(declare-fun m!337007 () Bool)

(assert (=> b!218443 m!337007))

(declare-fun m!337009 () Bool)

(assert (=> b!218443 m!337009))

(assert (=> b!218456 m!337001))

(declare-fun m!337011 () Bool)

(assert (=> b!218454 m!337011))

(declare-fun m!337013 () Bool)

(assert (=> b!218463 m!337013))

(declare-fun m!337015 () Bool)

(assert (=> b!218465 m!337015))

(declare-fun m!337017 () Bool)

(assert (=> b!218451 m!337017))

(declare-fun m!337019 () Bool)

(assert (=> b!218451 m!337019))

(declare-fun m!337021 () Bool)

(assert (=> b!218446 m!337021))

(push 1)

(assert (not b!218455))

(assert (not b!218463))

(assert (not b!218446))

(assert (not b!218464))

(assert (not b!218447))

(assert (not b!218445))

(assert (not b!218451))

(assert (not start!45270))

(assert (not b!218443))

(assert (not b!218460))

(assert (not b!218442))

(assert (not b!218454))

(assert (not b!218449))

(assert (not b!218450))

(assert (not b!218465))

(assert (not b!218456))

(assert (not b!218458))

(assert (not b!218453))

(assert (not b!218459))

(assert (not b!218466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

