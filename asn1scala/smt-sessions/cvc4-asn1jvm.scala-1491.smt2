; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41280 () Bool)

(assert start!41280)

(declare-fun b!192437 () Bool)

(declare-fun res!160721 () Bool)

(declare-fun e!132583 () Bool)

(assert (=> b!192437 (=> (not res!160721) (not e!132583))))

(declare-fun lt!299156 () (_ BitVec 64))

(declare-datatypes ((array!9954 0))(
  ( (array!9955 (arr!5319 (Array (_ BitVec 32) (_ BitVec 8))) (size!4389 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7886 0))(
  ( (BitStream!7887 (buf!4869 array!9954) (currentByte!9153 (_ BitVec 32)) (currentBit!9148 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16644 0))(
  ( (tuple2!16645 (_1!8967 BitStream!7886) (_2!8967 BitStream!7886)) )
))
(declare-fun lt!299150 () tuple2!16644)

(declare-fun lt!299163 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7886 (_ BitVec 64)) BitStream!7886)

(assert (=> b!192437 (= res!160721 (= (_1!8967 lt!299150) (withMovedBitIndex!0 (_2!8967 lt!299150) (bvsub lt!299163 lt!299156))))))

(declare-fun b!192438 () Bool)

(declare-fun e!132584 () Bool)

(declare-fun e!132595 () Bool)

(assert (=> b!192438 (= e!132584 e!132595)))

(declare-fun res!160718 () Bool)

(assert (=> b!192438 (=> (not res!160718) (not e!132595))))

(declare-fun lt!299151 () (_ BitVec 64))

(declare-fun lt!299153 () (_ BitVec 64))

(assert (=> b!192438 (= res!160718 (= lt!299151 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299153)))))

(declare-datatypes ((Unit!13655 0))(
  ( (Unit!13656) )
))
(declare-datatypes ((tuple2!16646 0))(
  ( (tuple2!16647 (_1!8968 Unit!13655) (_2!8968 BitStream!7886)) )
))
(declare-fun lt!299173 () tuple2!16646)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192438 (= lt!299151 (bitIndex!0 (size!4389 (buf!4869 (_2!8968 lt!299173))) (currentByte!9153 (_2!8968 lt!299173)) (currentBit!9148 (_2!8968 lt!299173))))))

(declare-fun thiss!1204 () BitStream!7886)

(assert (=> b!192438 (= lt!299153 (bitIndex!0 (size!4389 (buf!4869 thiss!1204)) (currentByte!9153 thiss!1204) (currentBit!9148 thiss!1204)))))

(declare-fun b!192439 () Bool)

(declare-fun e!132588 () Bool)

(declare-datatypes ((tuple2!16648 0))(
  ( (tuple2!16649 (_1!8969 BitStream!7886) (_2!8969 (_ BitVec 64))) )
))
(declare-fun lt!299152 () tuple2!16648)

(declare-fun lt!299165 () tuple2!16644)

(assert (=> b!192439 (= e!132588 (= (_1!8969 lt!299152) (_2!8967 lt!299165)))))

(declare-fun b!192440 () Bool)

(declare-fun e!132592 () Bool)

(declare-fun e!132582 () Bool)

(assert (=> b!192440 (= e!132592 e!132582)))

(declare-fun res!160711 () Bool)

(assert (=> b!192440 (=> res!160711 e!132582)))

(declare-fun lt!299172 () BitStream!7886)

(assert (=> b!192440 (= res!160711 (not (= (_1!8967 lt!299150) lt!299172)))))

(assert (=> b!192440 e!132583))

(declare-fun res!160719 () Bool)

(assert (=> b!192440 (=> (not res!160719) (not e!132583))))

(declare-fun lt!299157 () tuple2!16648)

(assert (=> b!192440 (= res!160719 (and (= (_2!8969 lt!299152) (_2!8969 lt!299157)) (= (_1!8969 lt!299152) (_1!8969 lt!299157))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!299147 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!299160 () Unit!13655)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13655)

(assert (=> b!192440 (= lt!299160 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8967 lt!299165) nBits!348 i!590 lt!299147))))

(declare-fun lt!299171 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16648)

(assert (=> b!192440 (= lt!299157 (readNBitsLSBFirstsLoopPure!0 lt!299172 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299171))))

(assert (=> b!192440 (= lt!299172 (withMovedBitIndex!0 (_1!8967 lt!299165) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!192441 () Bool)

(declare-fun e!132589 () Bool)

(declare-datatypes ((tuple2!16650 0))(
  ( (tuple2!16651 (_1!8970 BitStream!7886) (_2!8970 Bool)) )
))
(declare-fun lt!299167 () tuple2!16650)

(assert (=> b!192441 (= e!132589 (= (bitIndex!0 (size!4389 (buf!4869 (_1!8970 lt!299167))) (currentByte!9153 (_1!8970 lt!299167)) (currentBit!9148 (_1!8970 lt!299167))) lt!299151))))

(declare-fun b!192442 () Bool)

(declare-fun e!132590 () Bool)

(declare-fun lt!299148 () tuple2!16650)

(declare-fun lt!299169 () tuple2!16650)

(assert (=> b!192442 (= e!132590 (= (_2!8970 lt!299148) (_2!8970 lt!299169)))))

(declare-fun b!192443 () Bool)

(declare-fun res!160733 () Bool)

(assert (=> b!192443 (=> (not res!160733) (not e!132595))))

(declare-fun isPrefixOf!0 (BitStream!7886 BitStream!7886) Bool)

(assert (=> b!192443 (= res!160733 (isPrefixOf!0 thiss!1204 (_2!8968 lt!299173)))))

(declare-fun b!192444 () Bool)

(declare-fun res!160728 () Bool)

(assert (=> b!192444 (=> (not res!160728) (not e!132583))))

(declare-fun lt!299155 () (_ BitVec 64))

(assert (=> b!192444 (= res!160728 (= (_1!8967 lt!299165) (withMovedBitIndex!0 (_2!8967 lt!299165) (bvsub lt!299155 lt!299156))))))

(declare-fun b!192445 () Bool)

(declare-fun res!160727 () Bool)

(declare-fun e!132593 () Bool)

(assert (=> b!192445 (=> (not res!160727) (not e!132593))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192445 (= res!160727 (invariant!0 (currentBit!9148 thiss!1204) (currentByte!9153 thiss!1204) (size!4389 (buf!4869 thiss!1204))))))

(declare-fun b!192446 () Bool)

(declare-fun res!160715 () Bool)

(declare-fun e!132594 () Bool)

(assert (=> b!192446 (=> res!160715 e!132594)))

(declare-fun lt!299161 () tuple2!16646)

(assert (=> b!192446 (= res!160715 (not (isPrefixOf!0 (_2!8968 lt!299173) (_2!8968 lt!299161))))))

(declare-fun b!192447 () Bool)

(declare-fun res!160714 () Bool)

(assert (=> b!192447 (=> res!160714 e!132594)))

(assert (=> b!192447 (= res!160714 (or (not (= (size!4389 (buf!4869 (_2!8968 lt!299161))) (size!4389 (buf!4869 thiss!1204)))) (not (= lt!299156 (bvsub (bvadd lt!299155 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!192448 () Bool)

(declare-fun res!160731 () Bool)

(assert (=> b!192448 (=> (not res!160731) (not e!132588))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192448 (= res!160731 (= (_2!8969 lt!299152) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!192449 () Bool)

(assert (=> b!192449 (= e!132595 e!132589)))

(declare-fun res!160713 () Bool)

(assert (=> b!192449 (=> (not res!160713) (not e!132589))))

(declare-fun lt!299158 () Bool)

(assert (=> b!192449 (= res!160713 (and (= (_2!8970 lt!299167) lt!299158) (= (_1!8970 lt!299167) (_2!8968 lt!299173))))))

(declare-fun readBitPure!0 (BitStream!7886) tuple2!16650)

(declare-fun readerFrom!0 (BitStream!7886 (_ BitVec 32) (_ BitVec 32)) BitStream!7886)

(assert (=> b!192449 (= lt!299167 (readBitPure!0 (readerFrom!0 (_2!8968 lt!299173) (currentBit!9148 thiss!1204) (currentByte!9153 thiss!1204))))))

(declare-fun b!192450 () Bool)

(declare-fun res!160717 () Bool)

(assert (=> b!192450 (=> res!160717 e!132582)))

(assert (=> b!192450 (= res!160717 (not (= (bitIndex!0 (size!4389 (buf!4869 (_1!8969 lt!299152))) (currentByte!9153 (_1!8969 lt!299152)) (currentBit!9148 (_1!8969 lt!299152))) (bitIndex!0 (size!4389 (buf!4869 (_2!8967 lt!299165))) (currentByte!9153 (_2!8967 lt!299165)) (currentBit!9148 (_2!8967 lt!299165))))))))

(declare-fun b!192451 () Bool)

(declare-fun res!160720 () Bool)

(assert (=> b!192451 (=> res!160720 e!132594)))

(assert (=> b!192451 (= res!160720 (not (invariant!0 (currentBit!9148 (_2!8968 lt!299161)) (currentByte!9153 (_2!8968 lt!299161)) (size!4389 (buf!4869 (_2!8968 lt!299161))))))))

(declare-fun b!192452 () Bool)

(assert (=> b!192452 (= e!132582 true)))

(assert (=> b!192452 e!132588))

(declare-fun res!160716 () Bool)

(assert (=> b!192452 (=> (not res!160716) (not e!132588))))

(assert (=> b!192452 (= res!160716 (= (size!4389 (buf!4869 thiss!1204)) (size!4389 (buf!4869 (_2!8968 lt!299161)))))))

(declare-fun res!160722 () Bool)

(declare-fun e!132585 () Bool)

(assert (=> start!41280 (=> (not res!160722) (not e!132585))))

(assert (=> start!41280 (= res!160722 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41280 e!132585))

(assert (=> start!41280 true))

(declare-fun e!132591 () Bool)

(declare-fun inv!12 (BitStream!7886) Bool)

(assert (=> start!41280 (and (inv!12 thiss!1204) e!132591)))

(declare-fun b!192453 () Bool)

(declare-fun e!132586 () Bool)

(assert (=> b!192453 (= e!132586 e!132594)))

(declare-fun res!160723 () Bool)

(assert (=> b!192453 (=> res!160723 e!132594)))

(assert (=> b!192453 (= res!160723 (not (= lt!299156 (bvsub (bvsub (bvadd lt!299163 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!192453 (= lt!299156 (bitIndex!0 (size!4389 (buf!4869 (_2!8968 lt!299161))) (currentByte!9153 (_2!8968 lt!299161)) (currentBit!9148 (_2!8968 lt!299161))))))

(assert (=> b!192453 (isPrefixOf!0 thiss!1204 (_2!8968 lt!299161))))

(declare-fun lt!299166 () Unit!13655)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7886 BitStream!7886 BitStream!7886) Unit!13655)

(assert (=> b!192453 (= lt!299166 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8968 lt!299173) (_2!8968 lt!299161)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7886 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16646)

(assert (=> b!192453 (= lt!299161 (appendBitsLSBFirstLoopTR!0 (_2!8968 lt!299173) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!192454 () Bool)

(declare-fun e!132596 () Bool)

(assert (=> b!192454 (= e!132596 (invariant!0 (currentBit!9148 thiss!1204) (currentByte!9153 thiss!1204) (size!4389 (buf!4869 (_2!8968 lt!299161)))))))

(declare-fun b!192455 () Bool)

(assert (=> b!192455 (= e!132585 e!132593)))

(declare-fun res!160732 () Bool)

(assert (=> b!192455 (=> (not res!160732) (not e!132593))))

(declare-fun lt!299164 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!192455 (= res!160732 (validate_offset_bits!1 ((_ sign_extend 32) (size!4389 (buf!4869 thiss!1204))) ((_ sign_extend 32) (currentByte!9153 thiss!1204)) ((_ sign_extend 32) (currentBit!9148 thiss!1204)) lt!299164))))

(assert (=> b!192455 (= lt!299164 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!192456 () Bool)

(declare-fun res!160729 () Bool)

(assert (=> b!192456 (=> res!160729 e!132594)))

(assert (=> b!192456 (= res!160729 (not (isPrefixOf!0 thiss!1204 (_2!8968 lt!299173))))))

(declare-fun b!192457 () Bool)

(declare-fun res!160725 () Bool)

(assert (=> b!192457 (=> (not res!160725) (not e!132593))))

(assert (=> b!192457 (= res!160725 (not (= i!590 nBits!348)))))

(declare-fun b!192458 () Bool)

(declare-fun array_inv!4130 (array!9954) Bool)

(assert (=> b!192458 (= e!132591 (array_inv!4130 (buf!4869 thiss!1204)))))

(declare-fun b!192459 () Bool)

(assert (=> b!192459 (= e!132593 (not e!132586))))

(declare-fun res!160726 () Bool)

(assert (=> b!192459 (=> res!160726 e!132586)))

(assert (=> b!192459 (= res!160726 (not (= lt!299163 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299155))))))

(assert (=> b!192459 (= lt!299163 (bitIndex!0 (size!4389 (buf!4869 (_2!8968 lt!299173))) (currentByte!9153 (_2!8968 lt!299173)) (currentBit!9148 (_2!8968 lt!299173))))))

(assert (=> b!192459 (= lt!299155 (bitIndex!0 (size!4389 (buf!4869 thiss!1204)) (currentByte!9153 thiss!1204) (currentBit!9148 thiss!1204)))))

(assert (=> b!192459 e!132584))

(declare-fun res!160730 () Bool)

(assert (=> b!192459 (=> (not res!160730) (not e!132584))))

(assert (=> b!192459 (= res!160730 (= (size!4389 (buf!4869 thiss!1204)) (size!4389 (buf!4869 (_2!8968 lt!299173)))))))

(declare-fun appendBit!0 (BitStream!7886 Bool) tuple2!16646)

(assert (=> b!192459 (= lt!299173 (appendBit!0 thiss!1204 lt!299158))))

(declare-fun lt!299149 () (_ BitVec 64))

(assert (=> b!192459 (= lt!299158 (not (= (bvand v!189 lt!299149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192459 (= lt!299149 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!192460 () Bool)

(assert (=> b!192460 (= e!132594 e!132592)))

(declare-fun res!160734 () Bool)

(assert (=> b!192460 (=> res!160734 e!132592)))

(declare-fun lt!299162 () tuple2!16648)

(assert (=> b!192460 (= res!160734 (not (= (_1!8969 lt!299162) (_2!8967 lt!299150))))))

(assert (=> b!192460 (= lt!299162 (readNBitsLSBFirstsLoopPure!0 (_1!8967 lt!299150) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299171))))

(declare-fun lt!299145 () (_ BitVec 64))

(assert (=> b!192460 (validate_offset_bits!1 ((_ sign_extend 32) (size!4389 (buf!4869 (_2!8968 lt!299161)))) ((_ sign_extend 32) (currentByte!9153 (_2!8968 lt!299173))) ((_ sign_extend 32) (currentBit!9148 (_2!8968 lt!299173))) lt!299145)))

(declare-fun lt!299168 () Unit!13655)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7886 array!9954 (_ BitVec 64)) Unit!13655)

(assert (=> b!192460 (= lt!299168 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8968 lt!299173) (buf!4869 (_2!8968 lt!299161)) lt!299145))))

(assert (=> b!192460 (= lt!299145 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!299159 () tuple2!16650)

(assert (=> b!192460 (= lt!299171 (bvor lt!299147 (ite (_2!8970 lt!299159) lt!299149 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192460 (= lt!299152 (readNBitsLSBFirstsLoopPure!0 (_1!8967 lt!299165) nBits!348 i!590 lt!299147))))

(assert (=> b!192460 (validate_offset_bits!1 ((_ sign_extend 32) (size!4389 (buf!4869 (_2!8968 lt!299161)))) ((_ sign_extend 32) (currentByte!9153 thiss!1204)) ((_ sign_extend 32) (currentBit!9148 thiss!1204)) lt!299164)))

(declare-fun lt!299170 () Unit!13655)

(assert (=> b!192460 (= lt!299170 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4869 (_2!8968 lt!299161)) lt!299164))))

(assert (=> b!192460 (= lt!299147 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!192460 (= (_2!8970 lt!299159) lt!299158)))

(assert (=> b!192460 (= lt!299159 (readBitPure!0 (_1!8967 lt!299165)))))

(declare-fun reader!0 (BitStream!7886 BitStream!7886) tuple2!16644)

(assert (=> b!192460 (= lt!299150 (reader!0 (_2!8968 lt!299173) (_2!8968 lt!299161)))))

(assert (=> b!192460 (= lt!299165 (reader!0 thiss!1204 (_2!8968 lt!299161)))))

(assert (=> b!192460 e!132590))

(declare-fun res!160724 () Bool)

(assert (=> b!192460 (=> (not res!160724) (not e!132590))))

(assert (=> b!192460 (= res!160724 (= (bitIndex!0 (size!4389 (buf!4869 (_1!8970 lt!299148))) (currentByte!9153 (_1!8970 lt!299148)) (currentBit!9148 (_1!8970 lt!299148))) (bitIndex!0 (size!4389 (buf!4869 (_1!8970 lt!299169))) (currentByte!9153 (_1!8970 lt!299169)) (currentBit!9148 (_1!8970 lt!299169)))))))

(declare-fun lt!299154 () Unit!13655)

(declare-fun lt!299146 () BitStream!7886)

(declare-fun readBitPrefixLemma!0 (BitStream!7886 BitStream!7886) Unit!13655)

(assert (=> b!192460 (= lt!299154 (readBitPrefixLemma!0 lt!299146 (_2!8968 lt!299161)))))

(assert (=> b!192460 (= lt!299169 (readBitPure!0 (BitStream!7887 (buf!4869 (_2!8968 lt!299161)) (currentByte!9153 thiss!1204) (currentBit!9148 thiss!1204))))))

(assert (=> b!192460 (= lt!299148 (readBitPure!0 lt!299146))))

(assert (=> b!192460 e!132596))

(declare-fun res!160712 () Bool)

(assert (=> b!192460 (=> (not res!160712) (not e!132596))))

(assert (=> b!192460 (= res!160712 (invariant!0 (currentBit!9148 thiss!1204) (currentByte!9153 thiss!1204) (size!4389 (buf!4869 (_2!8968 lt!299173)))))))

(assert (=> b!192460 (= lt!299146 (BitStream!7887 (buf!4869 (_2!8968 lt!299173)) (currentByte!9153 thiss!1204) (currentBit!9148 thiss!1204)))))

(declare-fun b!192461 () Bool)

(assert (=> b!192461 (= e!132583 (and (= lt!299155 (bvsub lt!299163 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8967 lt!299150) lt!299172)) (= (_2!8969 lt!299152) (_2!8969 lt!299162)))))))

(assert (= (and start!41280 res!160722) b!192455))

(assert (= (and b!192455 res!160732) b!192445))

(assert (= (and b!192445 res!160727) b!192457))

(assert (= (and b!192457 res!160725) b!192459))

(assert (= (and b!192459 res!160730) b!192438))

(assert (= (and b!192438 res!160718) b!192443))

(assert (= (and b!192443 res!160733) b!192449))

(assert (= (and b!192449 res!160713) b!192441))

(assert (= (and b!192459 (not res!160726)) b!192453))

(assert (= (and b!192453 (not res!160723)) b!192451))

(assert (= (and b!192451 (not res!160720)) b!192447))

(assert (= (and b!192447 (not res!160714)) b!192446))

(assert (= (and b!192446 (not res!160715)) b!192456))

(assert (= (and b!192456 (not res!160729)) b!192460))

(assert (= (and b!192460 res!160712) b!192454))

(assert (= (and b!192460 res!160724) b!192442))

(assert (= (and b!192460 (not res!160734)) b!192440))

(assert (= (and b!192440 res!160719) b!192444))

(assert (= (and b!192444 res!160728) b!192437))

(assert (= (and b!192437 res!160721) b!192461))

(assert (= (and b!192440 (not res!160711)) b!192450))

(assert (= (and b!192450 (not res!160717)) b!192452))

(assert (= (and b!192452 res!160716) b!192448))

(assert (= (and b!192448 res!160731) b!192439))

(assert (= start!41280 b!192458))

(declare-fun m!298607 () Bool)

(assert (=> b!192437 m!298607))

(declare-fun m!298609 () Bool)

(assert (=> b!192446 m!298609))

(declare-fun m!298611 () Bool)

(assert (=> b!192450 m!298611))

(declare-fun m!298613 () Bool)

(assert (=> b!192450 m!298613))

(declare-fun m!298615 () Bool)

(assert (=> b!192448 m!298615))

(declare-fun m!298617 () Bool)

(assert (=> b!192441 m!298617))

(declare-fun m!298619 () Bool)

(assert (=> b!192458 m!298619))

(declare-fun m!298621 () Bool)

(assert (=> b!192459 m!298621))

(declare-fun m!298623 () Bool)

(assert (=> b!192459 m!298623))

(declare-fun m!298625 () Bool)

(assert (=> b!192459 m!298625))

(declare-fun m!298627 () Bool)

(assert (=> b!192440 m!298627))

(declare-fun m!298629 () Bool)

(assert (=> b!192440 m!298629))

(declare-fun m!298631 () Bool)

(assert (=> b!192440 m!298631))

(declare-fun m!298633 () Bool)

(assert (=> b!192451 m!298633))

(declare-fun m!298635 () Bool)

(assert (=> start!41280 m!298635))

(declare-fun m!298637 () Bool)

(assert (=> b!192453 m!298637))

(declare-fun m!298639 () Bool)

(assert (=> b!192453 m!298639))

(declare-fun m!298641 () Bool)

(assert (=> b!192453 m!298641))

(declare-fun m!298643 () Bool)

(assert (=> b!192453 m!298643))

(assert (=> b!192438 m!298621))

(assert (=> b!192438 m!298623))

(declare-fun m!298645 () Bool)

(assert (=> b!192460 m!298645))

(declare-fun m!298647 () Bool)

(assert (=> b!192460 m!298647))

(declare-fun m!298649 () Bool)

(assert (=> b!192460 m!298649))

(declare-fun m!298651 () Bool)

(assert (=> b!192460 m!298651))

(declare-fun m!298653 () Bool)

(assert (=> b!192460 m!298653))

(declare-fun m!298655 () Bool)

(assert (=> b!192460 m!298655))

(declare-fun m!298657 () Bool)

(assert (=> b!192460 m!298657))

(declare-fun m!298659 () Bool)

(assert (=> b!192460 m!298659))

(declare-fun m!298661 () Bool)

(assert (=> b!192460 m!298661))

(declare-fun m!298663 () Bool)

(assert (=> b!192460 m!298663))

(declare-fun m!298665 () Bool)

(assert (=> b!192460 m!298665))

(declare-fun m!298667 () Bool)

(assert (=> b!192460 m!298667))

(declare-fun m!298669 () Bool)

(assert (=> b!192460 m!298669))

(declare-fun m!298671 () Bool)

(assert (=> b!192460 m!298671))

(declare-fun m!298673 () Bool)

(assert (=> b!192460 m!298673))

(declare-fun m!298675 () Bool)

(assert (=> b!192460 m!298675))

(declare-fun m!298677 () Bool)

(assert (=> b!192454 m!298677))

(declare-fun m!298679 () Bool)

(assert (=> b!192456 m!298679))

(declare-fun m!298681 () Bool)

(assert (=> b!192444 m!298681))

(declare-fun m!298683 () Bool)

(assert (=> b!192449 m!298683))

(assert (=> b!192449 m!298683))

(declare-fun m!298685 () Bool)

(assert (=> b!192449 m!298685))

(declare-fun m!298687 () Bool)

(assert (=> b!192445 m!298687))

(declare-fun m!298689 () Bool)

(assert (=> b!192455 m!298689))

(assert (=> b!192443 m!298679))

(push 1)

(assert (not b!192438))

(assert (not b!192446))

(assert (not b!192450))

(assert (not b!192454))

(assert (not b!192451))

(assert (not b!192455))

(assert (not b!192444))

(assert (not b!192449))

(assert (not b!192459))

(assert (not b!192458))

(assert (not start!41280))

(assert (not b!192445))

(assert (not b!192453))

(assert (not b!192441))

(assert (not b!192443))

(assert (not b!192448))

(assert (not b!192440))

(assert (not b!192460))

(assert (not b!192437))

(assert (not b!192456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

