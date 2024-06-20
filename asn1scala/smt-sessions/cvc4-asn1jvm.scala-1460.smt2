; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40074 () Bool)

(assert start!40074)

(declare-fun e!126862 () Bool)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!281084 () (_ BitVec 64))

(declare-fun lt!281080 () (_ BitVec 64))

(declare-fun b!182856 () Bool)

(declare-datatypes ((array!9741 0))(
  ( (array!9742 (arr!5226 (Array (_ BitVec 32) (_ BitVec 8))) (size!4296 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7700 0))(
  ( (BitStream!7701 (buf!4748 array!9741) (currentByte!8976 (_ BitVec 32)) (currentBit!8971 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15792 0))(
  ( (tuple2!15793 (_1!8541 BitStream!7700) (_2!8541 Bool)) )
))
(declare-fun lt!281099 () tuple2!15792)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182856 (= e!126862 (= (bvand (bvor lt!281084 (ite (_2!8541 lt!281099) lt!281080 #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182857 () Bool)

(declare-fun e!126866 () Bool)

(declare-fun e!126865 () Bool)

(assert (=> b!182857 (= e!126866 (not e!126865))))

(declare-fun res!151988 () Bool)

(assert (=> b!182857 (=> res!151988 e!126865)))

(declare-fun lt!281079 () (_ BitVec 64))

(declare-fun lt!281076 () (_ BitVec 64))

(assert (=> b!182857 (= res!151988 (not (= lt!281079 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!281076))))))

(declare-datatypes ((Unit!13128 0))(
  ( (Unit!13129) )
))
(declare-datatypes ((tuple2!15794 0))(
  ( (tuple2!15795 (_1!8542 Unit!13128) (_2!8542 BitStream!7700)) )
))
(declare-fun lt!281087 () tuple2!15794)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182857 (= lt!281079 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))))))

(declare-fun thiss!1204 () BitStream!7700)

(assert (=> b!182857 (= lt!281076 (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(declare-fun e!126869 () Bool)

(assert (=> b!182857 e!126869))

(declare-fun res!151984 () Bool)

(assert (=> b!182857 (=> (not res!151984) (not e!126869))))

(assert (=> b!182857 (= res!151984 (= (size!4296 (buf!4748 thiss!1204)) (size!4296 (buf!4748 (_2!8542 lt!281087)))))))

(declare-fun lt!281078 () Bool)

(declare-fun appendBit!0 (BitStream!7700 Bool) tuple2!15794)

(assert (=> b!182857 (= lt!281087 (appendBit!0 thiss!1204 lt!281078))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!182857 (= lt!281078 (not (= (bvand v!189 lt!281080) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!182857 (= lt!281080 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!182858 () Bool)

(declare-fun res!151993 () Bool)

(assert (=> b!182858 (=> res!151993 e!126862)))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!15796 0))(
  ( (tuple2!15797 (_1!8543 BitStream!7700) (_2!8543 BitStream!7700)) )
))
(declare-fun lt!281088 () tuple2!15796)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182858 (= res!151993 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8543 lt!281088)))) ((_ sign_extend 32) (currentByte!8976 (_1!8543 lt!281088))) ((_ sign_extend 32) (currentBit!8971 (_1!8543 lt!281088))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))))

(declare-fun b!182859 () Bool)

(declare-fun e!126871 () Bool)

(declare-fun lt!281086 () tuple2!15794)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182859 (= e!126871 (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281086)))))))

(declare-fun b!182861 () Bool)

(declare-fun e!126864 () Bool)

(declare-fun lt!281093 () tuple2!15792)

(declare-fun lt!281095 () tuple2!15792)

(assert (=> b!182861 (= e!126864 (= (_2!8541 lt!281093) (_2!8541 lt!281095)))))

(declare-fun b!182862 () Bool)

(declare-fun res!151990 () Bool)

(declare-fun e!126860 () Bool)

(assert (=> b!182862 (=> res!151990 e!126860)))

(declare-fun isPrefixOf!0 (BitStream!7700 BitStream!7700) Bool)

(assert (=> b!182862 (= res!151990 (not (isPrefixOf!0 (_2!8542 lt!281087) (_2!8542 lt!281086))))))

(declare-fun b!182863 () Bool)

(declare-fun res!152000 () Bool)

(assert (=> b!182863 (=> res!152000 e!126860)))

(assert (=> b!182863 (= res!152000 (not (isPrefixOf!0 thiss!1204 (_2!8542 lt!281087))))))

(declare-fun b!182864 () Bool)

(assert (=> b!182864 (= e!126860 e!126862)))

(declare-fun res!151997 () Bool)

(assert (=> b!182864 (=> res!151997 e!126862)))

(assert (=> b!182864 (= res!151997 (or (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsgt (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!281077 () (_ BitVec 64))

(assert (=> b!182864 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087))) lt!281077)))

(declare-fun lt!281089 () Unit!13128)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7700 array!9741 (_ BitVec 64)) Unit!13128)

(assert (=> b!182864 (= lt!281089 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8542 lt!281087) (buf!4748 (_2!8542 lt!281086)) lt!281077))))

(assert (=> b!182864 (= lt!281077 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!281090 () tuple2!15796)

(declare-datatypes ((tuple2!15798 0))(
  ( (tuple2!15799 (_1!8544 BitStream!7700) (_2!8544 (_ BitVec 64))) )
))
(declare-fun lt!281083 () tuple2!15798)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15798)

(assert (=> b!182864 (= lt!281083 (readNBitsLSBFirstsLoopPure!0 (_1!8543 lt!281090) nBits!348 i!590 lt!281084))))

(declare-fun lt!281085 () (_ BitVec 64))

(assert (=> b!182864 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204)) lt!281085)))

(declare-fun lt!281091 () Unit!13128)

(assert (=> b!182864 (= lt!281091 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4748 (_2!8542 lt!281086)) lt!281085))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182864 (= lt!281084 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!182864 (= (_2!8541 lt!281099) lt!281078)))

(declare-fun readBitPure!0 (BitStream!7700) tuple2!15792)

(assert (=> b!182864 (= lt!281099 (readBitPure!0 (_1!8543 lt!281090)))))

(declare-fun reader!0 (BitStream!7700 BitStream!7700) tuple2!15796)

(assert (=> b!182864 (= lt!281088 (reader!0 (_2!8542 lt!281087) (_2!8542 lt!281086)))))

(assert (=> b!182864 (= lt!281090 (reader!0 thiss!1204 (_2!8542 lt!281086)))))

(assert (=> b!182864 e!126864))

(declare-fun res!152001 () Bool)

(assert (=> b!182864 (=> (not res!152001) (not e!126864))))

(assert (=> b!182864 (= res!152001 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281093))) (currentByte!8976 (_1!8541 lt!281093)) (currentBit!8971 (_1!8541 lt!281093))) (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281095))) (currentByte!8976 (_1!8541 lt!281095)) (currentBit!8971 (_1!8541 lt!281095)))))))

(declare-fun lt!281096 () Unit!13128)

(declare-fun lt!281082 () BitStream!7700)

(declare-fun readBitPrefixLemma!0 (BitStream!7700 BitStream!7700) Unit!13128)

(assert (=> b!182864 (= lt!281096 (readBitPrefixLemma!0 lt!281082 (_2!8542 lt!281086)))))

(assert (=> b!182864 (= lt!281095 (readBitPure!0 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204))))))

(assert (=> b!182864 (= lt!281093 (readBitPure!0 lt!281082))))

(assert (=> b!182864 e!126871))

(declare-fun res!151995 () Bool)

(assert (=> b!182864 (=> (not res!151995) (not e!126871))))

(assert (=> b!182864 (= res!151995 (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281087)))))))

(assert (=> b!182864 (= lt!281082 (BitStream!7701 (buf!4748 (_2!8542 lt!281087)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(declare-fun b!182865 () Bool)

(declare-fun res!151994 () Bool)

(assert (=> b!182865 (=> res!151994 e!126860)))

(assert (=> b!182865 (= res!151994 (not (invariant!0 (currentBit!8971 (_2!8542 lt!281086)) (currentByte!8976 (_2!8542 lt!281086)) (size!4296 (buf!4748 (_2!8542 lt!281086))))))))

(declare-fun b!182866 () Bool)

(declare-fun e!126861 () Bool)

(declare-fun array_inv!4037 (array!9741) Bool)

(assert (=> b!182866 (= e!126861 (array_inv!4037 (buf!4748 thiss!1204)))))

(declare-fun b!182867 () Bool)

(declare-fun e!126863 () Bool)

(assert (=> b!182867 (= e!126863 e!126866)))

(declare-fun res!151986 () Bool)

(assert (=> b!182867 (=> (not res!151986) (not e!126866))))

(assert (=> b!182867 (= res!151986 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 thiss!1204))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204)) lt!281085))))

(assert (=> b!182867 (= lt!281085 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!182868 () Bool)

(declare-fun res!151985 () Bool)

(assert (=> b!182868 (=> res!151985 e!126860)))

(declare-fun lt!281097 () (_ BitVec 64))

(assert (=> b!182868 (= res!151985 (or (not (= (size!4296 (buf!4748 (_2!8542 lt!281086))) (size!4296 (buf!4748 thiss!1204)))) (not (= lt!281097 (bvsub (bvadd lt!281076 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182869 () Bool)

(declare-fun res!151996 () Bool)

(assert (=> b!182869 (=> (not res!151996) (not e!126866))))

(assert (=> b!182869 (= res!151996 (not (= i!590 nBits!348)))))

(declare-fun b!182870 () Bool)

(declare-fun e!126867 () Bool)

(declare-fun e!126870 () Bool)

(assert (=> b!182870 (= e!126867 e!126870)))

(declare-fun res!151989 () Bool)

(assert (=> b!182870 (=> (not res!151989) (not e!126870))))

(declare-fun lt!281092 () tuple2!15792)

(assert (=> b!182870 (= res!151989 (and (= (_2!8541 lt!281092) lt!281078) (= (_1!8541 lt!281092) (_2!8542 lt!281087))))))

(declare-fun readerFrom!0 (BitStream!7700 (_ BitVec 32) (_ BitVec 32)) BitStream!7700)

(assert (=> b!182870 (= lt!281092 (readBitPure!0 (readerFrom!0 (_2!8542 lt!281087) (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204))))))

(declare-fun b!182860 () Bool)

(assert (=> b!182860 (= e!126865 e!126860)))

(declare-fun res!151999 () Bool)

(assert (=> b!182860 (=> res!151999 e!126860)))

(assert (=> b!182860 (= res!151999 (not (= lt!281097 (bvsub (bvsub (bvadd lt!281079 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!182860 (= lt!281097 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281086))) (currentByte!8976 (_2!8542 lt!281086)) (currentBit!8971 (_2!8542 lt!281086))))))

(assert (=> b!182860 (isPrefixOf!0 thiss!1204 (_2!8542 lt!281086))))

(declare-fun lt!281098 () Unit!13128)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7700 BitStream!7700 BitStream!7700) Unit!13128)

(assert (=> b!182860 (= lt!281098 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8542 lt!281087) (_2!8542 lt!281086)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7700 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15794)

(assert (=> b!182860 (= lt!281086 (appendBitsLSBFirstLoopTR!0 (_2!8542 lt!281087) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!151991 () Bool)

(assert (=> start!40074 (=> (not res!151991) (not e!126863))))

(assert (=> start!40074 (= res!151991 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40074 e!126863))

(assert (=> start!40074 true))

(declare-fun inv!12 (BitStream!7700) Bool)

(assert (=> start!40074 (and (inv!12 thiss!1204) e!126861)))

(declare-fun b!182871 () Bool)

(declare-fun res!151992 () Bool)

(assert (=> b!182871 (=> (not res!151992) (not e!126867))))

(assert (=> b!182871 (= res!151992 (isPrefixOf!0 thiss!1204 (_2!8542 lt!281087)))))

(declare-fun b!182872 () Bool)

(assert (=> b!182872 (= e!126869 e!126867)))

(declare-fun res!151987 () Bool)

(assert (=> b!182872 (=> (not res!151987) (not e!126867))))

(declare-fun lt!281081 () (_ BitVec 64))

(declare-fun lt!281094 () (_ BitVec 64))

(assert (=> b!182872 (= res!151987 (= lt!281081 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!281094)))))

(assert (=> b!182872 (= lt!281081 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))))))

(assert (=> b!182872 (= lt!281094 (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(declare-fun b!182873 () Bool)

(assert (=> b!182873 (= e!126870 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281092))) (currentByte!8976 (_1!8541 lt!281092)) (currentBit!8971 (_1!8541 lt!281092))) lt!281081))))

(declare-fun b!182874 () Bool)

(declare-fun res!151998 () Bool)

(assert (=> b!182874 (=> (not res!151998) (not e!126866))))

(assert (=> b!182874 (= res!151998 (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 thiss!1204))))))

(assert (= (and start!40074 res!151991) b!182867))

(assert (= (and b!182867 res!151986) b!182874))

(assert (= (and b!182874 res!151998) b!182869))

(assert (= (and b!182869 res!151996) b!182857))

(assert (= (and b!182857 res!151984) b!182872))

(assert (= (and b!182872 res!151987) b!182871))

(assert (= (and b!182871 res!151992) b!182870))

(assert (= (and b!182870 res!151989) b!182873))

(assert (= (and b!182857 (not res!151988)) b!182860))

(assert (= (and b!182860 (not res!151999)) b!182865))

(assert (= (and b!182865 (not res!151994)) b!182868))

(assert (= (and b!182868 (not res!151985)) b!182862))

(assert (= (and b!182862 (not res!151990)) b!182863))

(assert (= (and b!182863 (not res!152000)) b!182864))

(assert (= (and b!182864 res!151995) b!182859))

(assert (= (and b!182864 res!152001) b!182861))

(assert (= (and b!182864 (not res!151997)) b!182858))

(assert (= (and b!182858 (not res!151993)) b!182856))

(assert (= start!40074 b!182866))

(declare-fun m!284433 () Bool)

(assert (=> b!182873 m!284433))

(declare-fun m!284435 () Bool)

(assert (=> b!182865 m!284435))

(declare-fun m!284437 () Bool)

(assert (=> b!182857 m!284437))

(declare-fun m!284439 () Bool)

(assert (=> b!182857 m!284439))

(declare-fun m!284441 () Bool)

(assert (=> b!182857 m!284441))

(declare-fun m!284443 () Bool)

(assert (=> b!182859 m!284443))

(declare-fun m!284445 () Bool)

(assert (=> b!182867 m!284445))

(declare-fun m!284447 () Bool)

(assert (=> b!182871 m!284447))

(declare-fun m!284449 () Bool)

(assert (=> b!182860 m!284449))

(declare-fun m!284451 () Bool)

(assert (=> b!182860 m!284451))

(declare-fun m!284453 () Bool)

(assert (=> b!182860 m!284453))

(declare-fun m!284455 () Bool)

(assert (=> b!182860 m!284455))

(assert (=> b!182863 m!284447))

(declare-fun m!284457 () Bool)

(assert (=> b!182866 m!284457))

(declare-fun m!284459 () Bool)

(assert (=> b!182874 m!284459))

(declare-fun m!284461 () Bool)

(assert (=> b!182862 m!284461))

(assert (=> b!182872 m!284437))

(assert (=> b!182872 m!284439))

(declare-fun m!284463 () Bool)

(assert (=> start!40074 m!284463))

(declare-fun m!284465 () Bool)

(assert (=> b!182870 m!284465))

(assert (=> b!182870 m!284465))

(declare-fun m!284467 () Bool)

(assert (=> b!182870 m!284467))

(declare-fun m!284469 () Bool)

(assert (=> b!182864 m!284469))

(declare-fun m!284471 () Bool)

(assert (=> b!182864 m!284471))

(declare-fun m!284473 () Bool)

(assert (=> b!182864 m!284473))

(declare-fun m!284475 () Bool)

(assert (=> b!182864 m!284475))

(declare-fun m!284477 () Bool)

(assert (=> b!182864 m!284477))

(declare-fun m!284479 () Bool)

(assert (=> b!182864 m!284479))

(declare-fun m!284481 () Bool)

(assert (=> b!182864 m!284481))

(declare-fun m!284483 () Bool)

(assert (=> b!182864 m!284483))

(declare-fun m!284485 () Bool)

(assert (=> b!182864 m!284485))

(declare-fun m!284487 () Bool)

(assert (=> b!182864 m!284487))

(declare-fun m!284489 () Bool)

(assert (=> b!182864 m!284489))

(declare-fun m!284491 () Bool)

(assert (=> b!182864 m!284491))

(declare-fun m!284493 () Bool)

(assert (=> b!182864 m!284493))

(declare-fun m!284495 () Bool)

(assert (=> b!182864 m!284495))

(declare-fun m!284497 () Bool)

(assert (=> b!182864 m!284497))

(declare-fun m!284499 () Bool)

(assert (=> b!182858 m!284499))

(declare-fun m!284501 () Bool)

(assert (=> b!182856 m!284501))

(push 1)

(assert (not b!182859))

(assert (not b!182860))

(assert (not b!182858))

(assert (not b!182872))

(assert (not start!40074))

(assert (not b!182874))

(assert (not b!182871))

(assert (not b!182873))

(assert (not b!182870))

(assert (not b!182866))

(assert (not b!182867))

(assert (not b!182863))

(assert (not b!182857))

(assert (not b!182856))

(assert (not b!182862))

(assert (not b!182865))

(assert (not b!182864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!63437 () Bool)

(assert (=> d!63437 (= (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281086)))) (and (bvsge (currentBit!8971 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8971 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8976 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281086)))) (and (= (currentBit!8971 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281086))))))))))

(assert (=> b!182859 d!63437))

(declare-fun d!63439 () Bool)

(declare-datatypes ((tuple2!15804 0))(
  ( (tuple2!15805 (_1!8547 Bool) (_2!8547 BitStream!7700)) )
))
(declare-fun lt!281144 () tuple2!15804)

(declare-fun readBit!0 (BitStream!7700) tuple2!15804)

(assert (=> d!63439 (= lt!281144 (readBit!0 (readerFrom!0 (_2!8542 lt!281087) (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204))))))

(assert (=> d!63439 (= (readBitPure!0 (readerFrom!0 (_2!8542 lt!281087) (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204))) (tuple2!15793 (_2!8547 lt!281144) (_1!8547 lt!281144)))))

(declare-fun bs!15795 () Bool)

(assert (= bs!15795 d!63439))

(assert (=> bs!15795 m!284465))

(declare-fun m!284517 () Bool)

(assert (=> bs!15795 m!284517))

(assert (=> b!182870 d!63439))

(declare-fun d!63441 () Bool)

(declare-fun e!126892 () Bool)

(assert (=> d!63441 e!126892))

(declare-fun res!152035 () Bool)

(assert (=> d!63441 (=> (not res!152035) (not e!126892))))

(assert (=> d!63441 (= res!152035 (invariant!0 (currentBit!8971 (_2!8542 lt!281087)) (currentByte!8976 (_2!8542 lt!281087)) (size!4296 (buf!4748 (_2!8542 lt!281087)))))))

(assert (=> d!63441 (= (readerFrom!0 (_2!8542 lt!281087) (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204)) (BitStream!7701 (buf!4748 (_2!8542 lt!281087)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(declare-fun b!182907 () Bool)

(assert (=> b!182907 (= e!126892 (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281087)))))))

(assert (= (and d!63441 res!152035) b!182907))

(declare-fun m!284519 () Bool)

(assert (=> d!63441 m!284519))

(assert (=> b!182907 m!284491))

(assert (=> b!182870 d!63441))

(declare-fun d!63443 () Bool)

(declare-fun e!126895 () Bool)

(assert (=> d!63443 e!126895))

(declare-fun res!152040 () Bool)

(assert (=> d!63443 (=> (not res!152040) (not e!126895))))

(declare-fun lt!281162 () (_ BitVec 64))

(declare-fun lt!281161 () (_ BitVec 64))

(declare-fun lt!281157 () (_ BitVec 64))

(assert (=> d!63443 (= res!152040 (= lt!281161 (bvsub lt!281157 lt!281162)))))

(assert (=> d!63443 (or (= (bvand lt!281157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281157 lt!281162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63443 (= lt!281162 (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281086))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281086)))))))

(declare-fun lt!281160 () (_ BitVec 64))

(declare-fun lt!281159 () (_ BitVec 64))

(assert (=> d!63443 (= lt!281157 (bvmul lt!281160 lt!281159))))

(assert (=> d!63443 (or (= lt!281160 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281159 (bvsdiv (bvmul lt!281160 lt!281159) lt!281160)))))

(assert (=> d!63443 (= lt!281159 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63443 (= lt!281160 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))))))

(assert (=> d!63443 (= lt!281161 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281086))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281086)))))))

(assert (=> d!63443 (invariant!0 (currentBit!8971 (_2!8542 lt!281086)) (currentByte!8976 (_2!8542 lt!281086)) (size!4296 (buf!4748 (_2!8542 lt!281086))))))

(assert (=> d!63443 (= (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281086))) (currentByte!8976 (_2!8542 lt!281086)) (currentBit!8971 (_2!8542 lt!281086))) lt!281161)))

(declare-fun b!182912 () Bool)

(declare-fun res!152041 () Bool)

(assert (=> b!182912 (=> (not res!152041) (not e!126895))))

(assert (=> b!182912 (= res!152041 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281161))))

(declare-fun b!182913 () Bool)

(declare-fun lt!281158 () (_ BitVec 64))

(assert (=> b!182913 (= e!126895 (bvsle lt!281161 (bvmul lt!281158 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!182913 (or (= lt!281158 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281158 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281158)))))

(assert (=> b!182913 (= lt!281158 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))))))

(assert (= (and d!63443 res!152040) b!182912))

(assert (= (and b!182912 res!152041) b!182913))

(declare-fun m!284521 () Bool)

(assert (=> d!63443 m!284521))

(assert (=> d!63443 m!284435))

(assert (=> b!182860 d!63443))

(declare-fun d!63445 () Bool)

(declare-fun res!152049 () Bool)

(declare-fun e!126901 () Bool)

(assert (=> d!63445 (=> (not res!152049) (not e!126901))))

(assert (=> d!63445 (= res!152049 (= (size!4296 (buf!4748 thiss!1204)) (size!4296 (buf!4748 (_2!8542 lt!281086)))))))

(assert (=> d!63445 (= (isPrefixOf!0 thiss!1204 (_2!8542 lt!281086)) e!126901)))

(declare-fun b!182920 () Bool)

(declare-fun res!152048 () Bool)

(assert (=> b!182920 (=> (not res!152048) (not e!126901))))

(assert (=> b!182920 (= res!152048 (bvsle (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)) (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281086))) (currentByte!8976 (_2!8542 lt!281086)) (currentBit!8971 (_2!8542 lt!281086)))))))

(declare-fun b!182921 () Bool)

(declare-fun e!126900 () Bool)

(assert (=> b!182921 (= e!126901 e!126900)))

(declare-fun res!152050 () Bool)

(assert (=> b!182921 (=> res!152050 e!126900)))

(assert (=> b!182921 (= res!152050 (= (size!4296 (buf!4748 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!182922 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9741 array!9741 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182922 (= e!126900 (arrayBitRangesEq!0 (buf!4748 thiss!1204) (buf!4748 (_2!8542 lt!281086)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204))))))

(assert (= (and d!63445 res!152049) b!182920))

(assert (= (and b!182920 res!152048) b!182921))

(assert (= (and b!182921 (not res!152050)) b!182922))

(assert (=> b!182920 m!284439))

(assert (=> b!182920 m!284449))

(assert (=> b!182922 m!284439))

(assert (=> b!182922 m!284439))

(declare-fun m!284523 () Bool)

(assert (=> b!182922 m!284523))

(assert (=> b!182860 d!63445))

(declare-fun d!63447 () Bool)

(assert (=> d!63447 (isPrefixOf!0 thiss!1204 (_2!8542 lt!281086))))

(declare-fun lt!281165 () Unit!13128)

(declare-fun choose!30 (BitStream!7700 BitStream!7700 BitStream!7700) Unit!13128)

(assert (=> d!63447 (= lt!281165 (choose!30 thiss!1204 (_2!8542 lt!281087) (_2!8542 lt!281086)))))

(assert (=> d!63447 (isPrefixOf!0 thiss!1204 (_2!8542 lt!281087))))

(assert (=> d!63447 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8542 lt!281087) (_2!8542 lt!281086)) lt!281165)))

(declare-fun bs!15796 () Bool)

(assert (= bs!15796 d!63447))

(assert (=> bs!15796 m!284451))

(declare-fun m!284525 () Bool)

(assert (=> bs!15796 m!284525))

(assert (=> bs!15796 m!284447))

(assert (=> b!182860 d!63447))

(declare-fun b!183138 () Bool)

(declare-fun res!152219 () Bool)

(declare-fun e!127022 () Bool)

(assert (=> b!183138 (=> (not res!152219) (not e!127022))))

(declare-fun lt!281912 () tuple2!15794)

(declare-fun lt!281890 () (_ BitVec 64))

(declare-fun lt!281918 () (_ BitVec 64))

(assert (=> b!183138 (= res!152219 (= (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281912))) (currentByte!8976 (_2!8542 lt!281912)) (currentBit!8971 (_2!8542 lt!281912))) (bvsub lt!281918 lt!281890)))))

(assert (=> b!183138 (or (= (bvand lt!281918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281890 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281918 lt!281890) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183138 (= lt!281890 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!281879 () (_ BitVec 64))

(declare-fun lt!281906 () (_ BitVec 64))

(assert (=> b!183138 (= lt!281918 (bvadd lt!281879 lt!281906))))

(assert (=> b!183138 (or (not (= (bvand lt!281879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281906 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!281879 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!281879 lt!281906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183138 (= lt!281906 ((_ sign_extend 32) nBits!348))))

(assert (=> b!183138 (= lt!281879 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))))))

(declare-fun b!183139 () Bool)

(declare-fun res!152224 () Bool)

(declare-fun lt!281902 () tuple2!15794)

(assert (=> b!183139 (= res!152224 (= (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281902))) (currentByte!8976 (_2!8542 lt!281902)) (currentBit!8971 (_2!8542 lt!281902))) (bvadd (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!127020 () Bool)

(assert (=> b!183139 (=> (not res!152224) (not e!127020))))

(declare-fun b!183140 () Bool)

(declare-fun e!127028 () Bool)

(declare-fun lt!281903 () tuple2!15792)

(assert (=> b!183140 (= e!127028 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281903))) (currentByte!8976 (_1!8541 lt!281903)) (currentBit!8971 (_1!8541 lt!281903))) (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281902))) (currentByte!8976 (_2!8542 lt!281902)) (currentBit!8971 (_2!8542 lt!281902)))))))

(declare-fun b!183141 () Bool)

(declare-fun e!127025 () tuple2!15794)

(declare-fun Unit!13155 () Unit!13128)

(assert (=> b!183141 (= e!127025 (tuple2!15795 Unit!13155 (_2!8542 lt!281087)))))

(declare-fun lt!281915 () Unit!13128)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7700) Unit!13128)

(assert (=> b!183141 (= lt!281915 (lemmaIsPrefixRefl!0 (_2!8542 lt!281087)))))

(declare-fun call!2972 () Bool)

(assert (=> b!183141 call!2972))

(declare-fun lt!281893 () Unit!13128)

(assert (=> b!183141 (= lt!281893 lt!281915)))

(declare-fun b!183142 () Bool)

(declare-fun lt!281916 () tuple2!15794)

(assert (=> b!183142 (= e!127025 (tuple2!15795 (_1!8542 lt!281916) (_2!8542 lt!281916)))))

(declare-fun lt!281929 () Bool)

(assert (=> b!183142 (= lt!281929 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183142 (= lt!281902 (appendBit!0 (_2!8542 lt!281087) lt!281929))))

(declare-fun res!152225 () Bool)

(assert (=> b!183142 (= res!152225 (= (size!4296 (buf!4748 (_2!8542 lt!281087))) (size!4296 (buf!4748 (_2!8542 lt!281902)))))))

(assert (=> b!183142 (=> (not res!152225) (not e!127020))))

(assert (=> b!183142 e!127020))

(declare-fun lt!281923 () tuple2!15794)

(assert (=> b!183142 (= lt!281923 lt!281902)))

(assert (=> b!183142 (= lt!281916 (appendBitsLSBFirstLoopTR!0 (_2!8542 lt!281923) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!281888 () Unit!13128)

(assert (=> b!183142 (= lt!281888 (lemmaIsPrefixTransitive!0 (_2!8542 lt!281087) (_2!8542 lt!281923) (_2!8542 lt!281916)))))

(assert (=> b!183142 call!2972))

(declare-fun lt!281921 () Unit!13128)

(assert (=> b!183142 (= lt!281921 lt!281888)))

(assert (=> b!183142 (invariant!0 (currentBit!8971 (_2!8542 lt!281087)) (currentByte!8976 (_2!8542 lt!281087)) (size!4296 (buf!4748 (_2!8542 lt!281923))))))

(declare-fun lt!281931 () BitStream!7700)

(assert (=> b!183142 (= lt!281931 (BitStream!7701 (buf!4748 (_2!8542 lt!281923)) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))))))

(assert (=> b!183142 (invariant!0 (currentBit!8971 lt!281931) (currentByte!8976 lt!281931) (size!4296 (buf!4748 (_2!8542 lt!281916))))))

(declare-fun lt!281900 () BitStream!7700)

(assert (=> b!183142 (= lt!281900 (BitStream!7701 (buf!4748 (_2!8542 lt!281916)) (currentByte!8976 lt!281931) (currentBit!8971 lt!281931)))))

(declare-fun lt!281910 () tuple2!15792)

(assert (=> b!183142 (= lt!281910 (readBitPure!0 lt!281931))))

(declare-fun lt!281882 () tuple2!15792)

(assert (=> b!183142 (= lt!281882 (readBitPure!0 lt!281900))))

(declare-fun lt!281881 () Unit!13128)

(assert (=> b!183142 (= lt!281881 (readBitPrefixLemma!0 lt!281931 (_2!8542 lt!281916)))))

(declare-fun res!152228 () Bool)

(assert (=> b!183142 (= res!152228 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281910))) (currentByte!8976 (_1!8541 lt!281910)) (currentBit!8971 (_1!8541 lt!281910))) (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281882))) (currentByte!8976 (_1!8541 lt!281882)) (currentBit!8971 (_1!8541 lt!281882)))))))

(declare-fun e!127026 () Bool)

(assert (=> b!183142 (=> (not res!152228) (not e!127026))))

(assert (=> b!183142 e!127026))

(declare-fun lt!281901 () Unit!13128)

(assert (=> b!183142 (= lt!281901 lt!281881)))

(declare-fun lt!281907 () tuple2!15796)

(assert (=> b!183142 (= lt!281907 (reader!0 (_2!8542 lt!281087) (_2!8542 lt!281916)))))

(declare-fun lt!281898 () tuple2!15796)

(assert (=> b!183142 (= lt!281898 (reader!0 (_2!8542 lt!281923) (_2!8542 lt!281916)))))

(declare-fun lt!281917 () tuple2!15792)

(assert (=> b!183142 (= lt!281917 (readBitPure!0 (_1!8543 lt!281907)))))

(assert (=> b!183142 (= (_2!8541 lt!281917) lt!281929)))

(declare-fun lt!281891 () Unit!13128)

(declare-fun Unit!13157 () Unit!13128)

(assert (=> b!183142 (= lt!281891 Unit!13157)))

(declare-fun lt!281878 () (_ BitVec 64))

(assert (=> b!183142 (= lt!281878 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281920 () (_ BitVec 64))

(assert (=> b!183142 (= lt!281920 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281908 () Unit!13128)

(assert (=> b!183142 (= lt!281908 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8542 lt!281087) (buf!4748 (_2!8542 lt!281916)) lt!281920))))

(assert (=> b!183142 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281916)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087))) lt!281920)))

(declare-fun lt!281932 () Unit!13128)

(assert (=> b!183142 (= lt!281932 lt!281908)))

(declare-fun lt!281886 () tuple2!15798)

(assert (=> b!183142 (= lt!281886 (readNBitsLSBFirstsLoopPure!0 (_1!8543 lt!281907) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281878))))

(declare-fun lt!281892 () (_ BitVec 64))

(assert (=> b!183142 (= lt!281892 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!281924 () Unit!13128)

(assert (=> b!183142 (= lt!281924 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8542 lt!281923) (buf!4748 (_2!8542 lt!281916)) lt!281892))))

(assert (=> b!183142 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281916)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281923))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281923))) lt!281892)))

(declare-fun lt!281927 () Unit!13128)

(assert (=> b!183142 (= lt!281927 lt!281924)))

(declare-fun lt!281887 () tuple2!15798)

(assert (=> b!183142 (= lt!281887 (readNBitsLSBFirstsLoopPure!0 (_1!8543 lt!281898) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!281878 (ite (_2!8541 lt!281917) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!281885 () tuple2!15798)

(assert (=> b!183142 (= lt!281885 (readNBitsLSBFirstsLoopPure!0 (_1!8543 lt!281907) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281878))))

(declare-fun c!9422 () Bool)

(assert (=> b!183142 (= c!9422 (_2!8541 (readBitPure!0 (_1!8543 lt!281907))))))

(declare-fun e!127023 () (_ BitVec 64))

(declare-fun lt!281914 () tuple2!15798)

(declare-fun withMovedBitIndex!0 (BitStream!7700 (_ BitVec 64)) BitStream!7700)

(assert (=> b!183142 (= lt!281914 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8543 lt!281907) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!281878 e!127023)))))

(declare-fun lt!281905 () Unit!13128)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13128)

(assert (=> b!183142 (= lt!281905 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8543 lt!281907) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!281878))))

(assert (=> b!183142 (and (= (_2!8544 lt!281885) (_2!8544 lt!281914)) (= (_1!8544 lt!281885) (_1!8544 lt!281914)))))

(declare-fun lt!281880 () Unit!13128)

(assert (=> b!183142 (= lt!281880 lt!281905)))

(assert (=> b!183142 (= (_1!8543 lt!281907) (withMovedBitIndex!0 (_2!8543 lt!281907) (bvsub (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))) (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281916))) (currentByte!8976 (_2!8542 lt!281916)) (currentBit!8971 (_2!8542 lt!281916))))))))

(declare-fun lt!281904 () Unit!13128)

(declare-fun Unit!13158 () Unit!13128)

(assert (=> b!183142 (= lt!281904 Unit!13158)))

(assert (=> b!183142 (= (_1!8543 lt!281898) (withMovedBitIndex!0 (_2!8543 lt!281898) (bvsub (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281923))) (currentByte!8976 (_2!8542 lt!281923)) (currentBit!8971 (_2!8542 lt!281923))) (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281916))) (currentByte!8976 (_2!8542 lt!281916)) (currentBit!8971 (_2!8542 lt!281916))))))))

(declare-fun lt!281894 () Unit!13128)

(declare-fun Unit!13159 () Unit!13128)

(assert (=> b!183142 (= lt!281894 Unit!13159)))

(assert (=> b!183142 (= (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))) (bvsub (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281923))) (currentByte!8976 (_2!8542 lt!281923)) (currentBit!8971 (_2!8542 lt!281923))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!281889 () Unit!13128)

(declare-fun Unit!13160 () Unit!13128)

(assert (=> b!183142 (= lt!281889 Unit!13160)))

(assert (=> b!183142 (= (_2!8544 lt!281886) (_2!8544 lt!281887))))

(declare-fun lt!281925 () Unit!13128)

(declare-fun Unit!13161 () Unit!13128)

(assert (=> b!183142 (= lt!281925 Unit!13161)))

(assert (=> b!183142 (invariant!0 (currentBit!8971 (_2!8542 lt!281916)) (currentByte!8976 (_2!8542 lt!281916)) (size!4296 (buf!4748 (_2!8542 lt!281916))))))

(declare-fun lt!281897 () Unit!13128)

(declare-fun Unit!13162 () Unit!13128)

(assert (=> b!183142 (= lt!281897 Unit!13162)))

(assert (=> b!183142 (= (size!4296 (buf!4748 (_2!8542 lt!281087))) (size!4296 (buf!4748 (_2!8542 lt!281916))))))

(declare-fun lt!281930 () Unit!13128)

(declare-fun Unit!13163 () Unit!13128)

(assert (=> b!183142 (= lt!281930 Unit!13163)))

(assert (=> b!183142 (= (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281916))) (currentByte!8976 (_2!8542 lt!281916)) (currentBit!8971 (_2!8542 lt!281916))) (bvsub (bvadd (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281909 () Unit!13128)

(declare-fun Unit!13164 () Unit!13128)

(assert (=> b!183142 (= lt!281909 Unit!13164)))

(declare-fun lt!281913 () Unit!13128)

(declare-fun Unit!13165 () Unit!13128)

(assert (=> b!183142 (= lt!281913 Unit!13165)))

(declare-fun lt!281883 () tuple2!15796)

(assert (=> b!183142 (= lt!281883 (reader!0 (_2!8542 lt!281087) (_2!8542 lt!281916)))))

(declare-fun lt!281919 () (_ BitVec 64))

(assert (=> b!183142 (= lt!281919 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!281884 () Unit!13128)

(assert (=> b!183142 (= lt!281884 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8542 lt!281087) (buf!4748 (_2!8542 lt!281916)) lt!281919))))

(assert (=> b!183142 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281916)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087))) lt!281919)))

(declare-fun lt!281933 () Unit!13128)

(assert (=> b!183142 (= lt!281933 lt!281884)))

(declare-fun lt!281926 () tuple2!15798)

(assert (=> b!183142 (= lt!281926 (readNBitsLSBFirstsLoopPure!0 (_1!8543 lt!281883) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!152227 () Bool)

(assert (=> b!183142 (= res!152227 (= (_2!8544 lt!281926) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!127024 () Bool)

(assert (=> b!183142 (=> (not res!152227) (not e!127024))))

(assert (=> b!183142 e!127024))

(declare-fun lt!281922 () Unit!13128)

(declare-fun Unit!13166 () Unit!13128)

(assert (=> b!183142 (= lt!281922 Unit!13166)))

(declare-fun d!63449 () Bool)

(assert (=> d!63449 e!127022))

(declare-fun res!152221 () Bool)

(assert (=> d!63449 (=> (not res!152221) (not e!127022))))

(assert (=> d!63449 (= res!152221 (invariant!0 (currentBit!8971 (_2!8542 lt!281912)) (currentByte!8976 (_2!8542 lt!281912)) (size!4296 (buf!4748 (_2!8542 lt!281912)))))))

(assert (=> d!63449 (= lt!281912 e!127025)))

(declare-fun c!9421 () Bool)

(assert (=> d!63449 (= c!9421 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63449 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63449 (= (appendBitsLSBFirstLoopTR!0 (_2!8542 lt!281087) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!281912)))

(declare-fun b!183143 () Bool)

(declare-fun e!127027 () Bool)

(declare-fun lt!281928 () tuple2!15798)

(declare-fun lt!281895 () tuple2!15796)

(assert (=> b!183143 (= e!127027 (= (_1!8544 lt!281928) (_2!8543 lt!281895)))))

(declare-fun b!183144 () Bool)

(assert (=> b!183144 (= e!127023 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!183145 () Bool)

(assert (=> b!183145 (= e!127023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!183146 () Bool)

(declare-fun res!152223 () Bool)

(assert (=> b!183146 (=> (not res!152223) (not e!127022))))

(assert (=> b!183146 (= res!152223 (isPrefixOf!0 (_2!8542 lt!281087) (_2!8542 lt!281912)))))

(declare-fun bm!2969 () Bool)

(assert (=> bm!2969 (= call!2972 (isPrefixOf!0 (_2!8542 lt!281087) (ite c!9421 (_2!8542 lt!281087) (_2!8542 lt!281916))))))

(declare-fun b!183147 () Bool)

(assert (=> b!183147 (= e!127024 (= (_1!8544 lt!281926) (_2!8543 lt!281883)))))

(declare-fun b!183148 () Bool)

(assert (=> b!183148 (= lt!281903 (readBitPure!0 (readerFrom!0 (_2!8542 lt!281902) (currentBit!8971 (_2!8542 lt!281087)) (currentByte!8976 (_2!8542 lt!281087)))))))

(declare-fun res!152230 () Bool)

(assert (=> b!183148 (= res!152230 (and (= (_2!8541 lt!281903) lt!281929) (= (_1!8541 lt!281903) (_2!8542 lt!281902))))))

(assert (=> b!183148 (=> (not res!152230) (not e!127028))))

(assert (=> b!183148 (= e!127020 e!127028)))

(declare-fun b!183149 () Bool)

(declare-fun res!152220 () Bool)

(assert (=> b!183149 (= res!152220 (isPrefixOf!0 (_2!8542 lt!281087) (_2!8542 lt!281902)))))

(assert (=> b!183149 (=> (not res!152220) (not e!127020))))

(declare-fun b!183150 () Bool)

(assert (=> b!183150 (= e!127026 (= (_2!8541 lt!281910) (_2!8541 lt!281882)))))

(declare-fun b!183151 () Bool)

(declare-fun e!127021 () Bool)

(declare-fun lt!281896 () (_ BitVec 64))

(assert (=> b!183151 (= e!127021 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281087)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087))) lt!281896))))

(declare-fun b!183152 () Bool)

(assert (=> b!183152 (= e!127022 e!127027)))

(declare-fun res!152226 () Bool)

(assert (=> b!183152 (=> (not res!152226) (not e!127027))))

(assert (=> b!183152 (= res!152226 (= (_2!8544 lt!281928) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!183152 (= lt!281928 (readNBitsLSBFirstsLoopPure!0 (_1!8543 lt!281895) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!281899 () Unit!13128)

(declare-fun lt!281911 () Unit!13128)

(assert (=> b!183152 (= lt!281899 lt!281911)))

(assert (=> b!183152 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281912)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087))) lt!281896)))

(assert (=> b!183152 (= lt!281911 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8542 lt!281087) (buf!4748 (_2!8542 lt!281912)) lt!281896))))

(assert (=> b!183152 e!127021))

(declare-fun res!152222 () Bool)

(assert (=> b!183152 (=> (not res!152222) (not e!127021))))

(assert (=> b!183152 (= res!152222 (and (= (size!4296 (buf!4748 (_2!8542 lt!281087))) (size!4296 (buf!4748 (_2!8542 lt!281912)))) (bvsge lt!281896 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183152 (= lt!281896 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!183152 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!183152 (= lt!281895 (reader!0 (_2!8542 lt!281087) (_2!8542 lt!281912)))))

(declare-fun b!183153 () Bool)

(declare-fun res!152229 () Bool)

(assert (=> b!183153 (=> (not res!152229) (not e!127022))))

(assert (=> b!183153 (= res!152229 (= (size!4296 (buf!4748 (_2!8542 lt!281087))) (size!4296 (buf!4748 (_2!8542 lt!281912)))))))

(assert (= (and d!63449 c!9421) b!183141))

(assert (= (and d!63449 (not c!9421)) b!183142))

(assert (= (and b!183142 res!152225) b!183139))

(assert (= (and b!183139 res!152224) b!183149))

(assert (= (and b!183149 res!152220) b!183148))

(assert (= (and b!183148 res!152230) b!183140))

(assert (= (and b!183142 res!152228) b!183150))

(assert (= (and b!183142 c!9422) b!183144))

(assert (= (and b!183142 (not c!9422)) b!183145))

(assert (= (and b!183142 res!152227) b!183147))

(assert (= (or b!183141 b!183142) bm!2969))

(assert (= (and d!63449 res!152221) b!183153))

(assert (= (and b!183153 res!152229) b!183138))

(assert (= (and b!183138 res!152219) b!183146))

(assert (= (and b!183146 res!152223) b!183152))

(assert (= (and b!183152 res!152222) b!183151))

(assert (= (and b!183152 res!152226) b!183143))

(declare-fun m!284937 () Bool)

(assert (=> b!183146 m!284937))

(declare-fun m!284939 () Bool)

(assert (=> b!183151 m!284939))

(declare-fun m!284941 () Bool)

(assert (=> b!183149 m!284941))

(declare-fun m!284943 () Bool)

(assert (=> b!183138 m!284943))

(assert (=> b!183138 m!284437))

(declare-fun m!284945 () Bool)

(assert (=> bm!2969 m!284945))

(declare-fun m!284947 () Bool)

(assert (=> b!183139 m!284947))

(assert (=> b!183139 m!284437))

(declare-fun m!284949 () Bool)

(assert (=> b!183141 m!284949))

(declare-fun m!284951 () Bool)

(assert (=> b!183152 m!284951))

(declare-fun m!284953 () Bool)

(assert (=> b!183152 m!284953))

(declare-fun m!284955 () Bool)

(assert (=> b!183152 m!284955))

(declare-fun m!284957 () Bool)

(assert (=> b!183152 m!284957))

(declare-fun m!284959 () Bool)

(assert (=> b!183152 m!284959))

(declare-fun m!284961 () Bool)

(assert (=> b!183152 m!284961))

(declare-fun m!284963 () Bool)

(assert (=> b!183148 m!284963))

(assert (=> b!183148 m!284963))

(declare-fun m!284965 () Bool)

(assert (=> b!183148 m!284965))

(declare-fun m!284967 () Bool)

(assert (=> b!183142 m!284967))

(declare-fun m!284969 () Bool)

(assert (=> b!183142 m!284969))

(declare-fun m!284971 () Bool)

(assert (=> b!183142 m!284971))

(declare-fun m!284973 () Bool)

(assert (=> b!183142 m!284973))

(declare-fun m!284975 () Bool)

(assert (=> b!183142 m!284975))

(declare-fun m!284977 () Bool)

(assert (=> b!183142 m!284977))

(declare-fun m!284979 () Bool)

(assert (=> b!183142 m!284979))

(declare-fun m!284981 () Bool)

(assert (=> b!183142 m!284981))

(declare-fun m!284983 () Bool)

(assert (=> b!183142 m!284983))

(declare-fun m!284985 () Bool)

(assert (=> b!183142 m!284985))

(declare-fun m!284987 () Bool)

(assert (=> b!183142 m!284987))

(declare-fun m!284989 () Bool)

(assert (=> b!183142 m!284989))

(assert (=> b!183142 m!284437))

(declare-fun m!284991 () Bool)

(assert (=> b!183142 m!284991))

(declare-fun m!284993 () Bool)

(assert (=> b!183142 m!284993))

(declare-fun m!284995 () Bool)

(assert (=> b!183142 m!284995))

(declare-fun m!284997 () Bool)

(assert (=> b!183142 m!284997))

(declare-fun m!284999 () Bool)

(assert (=> b!183142 m!284999))

(declare-fun m!285001 () Bool)

(assert (=> b!183142 m!285001))

(assert (=> b!183142 m!284985))

(declare-fun m!285003 () Bool)

(assert (=> b!183142 m!285003))

(declare-fun m!285005 () Bool)

(assert (=> b!183142 m!285005))

(declare-fun m!285007 () Bool)

(assert (=> b!183142 m!285007))

(declare-fun m!285009 () Bool)

(assert (=> b!183142 m!285009))

(declare-fun m!285011 () Bool)

(assert (=> b!183142 m!285011))

(declare-fun m!285013 () Bool)

(assert (=> b!183142 m!285013))

(declare-fun m!285015 () Bool)

(assert (=> b!183142 m!285015))

(assert (=> b!183142 m!284953))

(assert (=> b!183142 m!284955))

(declare-fun m!285017 () Bool)

(assert (=> b!183142 m!285017))

(declare-fun m!285019 () Bool)

(assert (=> b!183142 m!285019))

(declare-fun m!285021 () Bool)

(assert (=> b!183142 m!285021))

(declare-fun m!285023 () Bool)

(assert (=> b!183142 m!285023))

(declare-fun m!285025 () Bool)

(assert (=> b!183142 m!285025))

(declare-fun m!285027 () Bool)

(assert (=> b!183140 m!285027))

(assert (=> b!183140 m!284947))

(declare-fun m!285029 () Bool)

(assert (=> d!63449 m!285029))

(assert (=> b!182860 d!63449))

(declare-fun d!63561 () Bool)

(declare-fun res!152239 () Bool)

(declare-fun e!127034 () Bool)

(assert (=> d!63561 (=> (not res!152239) (not e!127034))))

(assert (=> d!63561 (= res!152239 (= (size!4296 (buf!4748 thiss!1204)) (size!4296 (buf!4748 (_2!8542 lt!281087)))))))

(assert (=> d!63561 (= (isPrefixOf!0 thiss!1204 (_2!8542 lt!281087)) e!127034)))

(declare-fun b!183161 () Bool)

(declare-fun res!152238 () Bool)

(assert (=> b!183161 (=> (not res!152238) (not e!127034))))

(assert (=> b!183161 (= res!152238 (bvsle (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)) (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087)))))))

(declare-fun b!183162 () Bool)

(declare-fun e!127033 () Bool)

(assert (=> b!183162 (= e!127034 e!127033)))

(declare-fun res!152240 () Bool)

(assert (=> b!183162 (=> res!152240 e!127033)))

(assert (=> b!183162 (= res!152240 (= (size!4296 (buf!4748 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!183163 () Bool)

(assert (=> b!183163 (= e!127033 (arrayBitRangesEq!0 (buf!4748 thiss!1204) (buf!4748 (_2!8542 lt!281087)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204))))))

(assert (= (and d!63561 res!152239) b!183161))

(assert (= (and b!183161 res!152238) b!183162))

(assert (= (and b!183162 (not res!152240)) b!183163))

(assert (=> b!183161 m!284439))

(assert (=> b!183161 m!284437))

(assert (=> b!183163 m!284439))

(assert (=> b!183163 m!284439))

(declare-fun m!285031 () Bool)

(assert (=> b!183163 m!285031))

(assert (=> b!182871 d!63561))

(declare-fun d!63563 () Bool)

(declare-fun e!127035 () Bool)

(assert (=> d!63563 e!127035))

(declare-fun res!152241 () Bool)

(assert (=> d!63563 (=> (not res!152241) (not e!127035))))

(declare-fun lt!281952 () (_ BitVec 64))

(declare-fun lt!281956 () (_ BitVec 64))

(declare-fun lt!281957 () (_ BitVec 64))

(assert (=> d!63563 (= res!152241 (= lt!281956 (bvsub lt!281952 lt!281957)))))

(assert (=> d!63563 (or (= (bvand lt!281952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281957 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281952 lt!281957) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63563 (= lt!281957 (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281087)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087)))))))

(declare-fun lt!281955 () (_ BitVec 64))

(declare-fun lt!281954 () (_ BitVec 64))

(assert (=> d!63563 (= lt!281952 (bvmul lt!281955 lt!281954))))

(assert (=> d!63563 (or (= lt!281955 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281954 (bvsdiv (bvmul lt!281955 lt!281954) lt!281955)))))

(assert (=> d!63563 (= lt!281954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63563 (= lt!281955 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281087)))))))

(assert (=> d!63563 (= lt!281956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087)))))))

(assert (=> d!63563 (invariant!0 (currentBit!8971 (_2!8542 lt!281087)) (currentByte!8976 (_2!8542 lt!281087)) (size!4296 (buf!4748 (_2!8542 lt!281087))))))

(assert (=> d!63563 (= (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))) lt!281956)))

(declare-fun b!183164 () Bool)

(declare-fun res!152242 () Bool)

(assert (=> b!183164 (=> (not res!152242) (not e!127035))))

(assert (=> b!183164 (= res!152242 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281956))))

(declare-fun b!183165 () Bool)

(declare-fun lt!281953 () (_ BitVec 64))

(assert (=> b!183165 (= e!127035 (bvsle lt!281956 (bvmul lt!281953 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183165 (or (= lt!281953 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281953 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281953)))))

(assert (=> b!183165 (= lt!281953 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281087)))))))

(assert (= (and d!63563 res!152241) b!183164))

(assert (= (and b!183164 res!152242) b!183165))

(declare-fun m!285033 () Bool)

(assert (=> d!63563 m!285033))

(assert (=> d!63563 m!284519))

(assert (=> b!182872 d!63563))

(declare-fun d!63565 () Bool)

(declare-fun e!127036 () Bool)

(assert (=> d!63565 e!127036))

(declare-fun res!152243 () Bool)

(assert (=> d!63565 (=> (not res!152243) (not e!127036))))

(declare-fun lt!281962 () (_ BitVec 64))

(declare-fun lt!281963 () (_ BitVec 64))

(declare-fun lt!281958 () (_ BitVec 64))

(assert (=> d!63565 (= res!152243 (= lt!281962 (bvsub lt!281958 lt!281963)))))

(assert (=> d!63565 (or (= (bvand lt!281958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281958 lt!281963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63565 (= lt!281963 (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 thiss!1204))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204))))))

(declare-fun lt!281961 () (_ BitVec 64))

(declare-fun lt!281960 () (_ BitVec 64))

(assert (=> d!63565 (= lt!281958 (bvmul lt!281961 lt!281960))))

(assert (=> d!63565 (or (= lt!281961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281960 (bvsdiv (bvmul lt!281961 lt!281960) lt!281961)))))

(assert (=> d!63565 (= lt!281960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63565 (= lt!281961 ((_ sign_extend 32) (size!4296 (buf!4748 thiss!1204))))))

(assert (=> d!63565 (= lt!281962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8976 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8971 thiss!1204))))))

(assert (=> d!63565 (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 thiss!1204)))))

(assert (=> d!63565 (= (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)) lt!281962)))

(declare-fun b!183166 () Bool)

(declare-fun res!152244 () Bool)

(assert (=> b!183166 (=> (not res!152244) (not e!127036))))

(assert (=> b!183166 (= res!152244 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281962))))

(declare-fun b!183167 () Bool)

(declare-fun lt!281959 () (_ BitVec 64))

(assert (=> b!183167 (= e!127036 (bvsle lt!281962 (bvmul lt!281959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183167 (or (= lt!281959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281959)))))

(assert (=> b!183167 (= lt!281959 ((_ sign_extend 32) (size!4296 (buf!4748 thiss!1204))))))

(assert (= (and d!63565 res!152243) b!183166))

(assert (= (and b!183166 res!152244) b!183167))

(declare-fun m!285035 () Bool)

(assert (=> d!63565 m!285035))

(assert (=> d!63565 m!284459))

(assert (=> b!182872 d!63565))

(declare-fun d!63567 () Bool)

(declare-fun res!152246 () Bool)

(declare-fun e!127038 () Bool)

(assert (=> d!63567 (=> (not res!152246) (not e!127038))))

(assert (=> d!63567 (= res!152246 (= (size!4296 (buf!4748 (_2!8542 lt!281087))) (size!4296 (buf!4748 (_2!8542 lt!281086)))))))

(assert (=> d!63567 (= (isPrefixOf!0 (_2!8542 lt!281087) (_2!8542 lt!281086)) e!127038)))

(declare-fun b!183168 () Bool)

(declare-fun res!152245 () Bool)

(assert (=> b!183168 (=> (not res!152245) (not e!127038))))

(assert (=> b!183168 (= res!152245 (bvsle (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))) (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281086))) (currentByte!8976 (_2!8542 lt!281086)) (currentBit!8971 (_2!8542 lt!281086)))))))

(declare-fun b!183169 () Bool)

(declare-fun e!127037 () Bool)

(assert (=> b!183169 (= e!127038 e!127037)))

(declare-fun res!152247 () Bool)

(assert (=> b!183169 (=> res!152247 e!127037)))

(assert (=> b!183169 (= res!152247 (= (size!4296 (buf!4748 (_2!8542 lt!281087))) #b00000000000000000000000000000000))))

(declare-fun b!183170 () Bool)

(assert (=> b!183170 (= e!127037 (arrayBitRangesEq!0 (buf!4748 (_2!8542 lt!281087)) (buf!4748 (_2!8542 lt!281086)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087)))))))

(assert (= (and d!63567 res!152246) b!183168))

(assert (= (and b!183168 res!152245) b!183169))

(assert (= (and b!183169 (not res!152247)) b!183170))

(assert (=> b!183168 m!284437))

(assert (=> b!183168 m!284449))

(assert (=> b!183170 m!284437))

(assert (=> b!183170 m!284437))

(declare-fun m!285037 () Bool)

(assert (=> b!183170 m!285037))

(assert (=> b!182862 d!63567))

(declare-fun d!63569 () Bool)

(declare-fun e!127039 () Bool)

(assert (=> d!63569 e!127039))

(declare-fun res!152248 () Bool)

(assert (=> d!63569 (=> (not res!152248) (not e!127039))))

(declare-fun lt!281964 () (_ BitVec 64))

(declare-fun lt!281968 () (_ BitVec 64))

(declare-fun lt!281969 () (_ BitVec 64))

(assert (=> d!63569 (= res!152248 (= lt!281968 (bvsub lt!281964 lt!281969)))))

(assert (=> d!63569 (or (= (bvand lt!281964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281964 lt!281969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63569 (= lt!281969 (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281092)))) ((_ sign_extend 32) (currentByte!8976 (_1!8541 lt!281092))) ((_ sign_extend 32) (currentBit!8971 (_1!8541 lt!281092)))))))

(declare-fun lt!281967 () (_ BitVec 64))

(declare-fun lt!281966 () (_ BitVec 64))

(assert (=> d!63569 (= lt!281964 (bvmul lt!281967 lt!281966))))

(assert (=> d!63569 (or (= lt!281967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281966 (bvsdiv (bvmul lt!281967 lt!281966) lt!281967)))))

(assert (=> d!63569 (= lt!281966 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63569 (= lt!281967 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281092)))))))

(assert (=> d!63569 (= lt!281968 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8976 (_1!8541 lt!281092))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8971 (_1!8541 lt!281092)))))))

(assert (=> d!63569 (invariant!0 (currentBit!8971 (_1!8541 lt!281092)) (currentByte!8976 (_1!8541 lt!281092)) (size!4296 (buf!4748 (_1!8541 lt!281092))))))

(assert (=> d!63569 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281092))) (currentByte!8976 (_1!8541 lt!281092)) (currentBit!8971 (_1!8541 lt!281092))) lt!281968)))

(declare-fun b!183171 () Bool)

(declare-fun res!152249 () Bool)

(assert (=> b!183171 (=> (not res!152249) (not e!127039))))

(assert (=> b!183171 (= res!152249 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281968))))

(declare-fun b!183172 () Bool)

(declare-fun lt!281965 () (_ BitVec 64))

(assert (=> b!183172 (= e!127039 (bvsle lt!281968 (bvmul lt!281965 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183172 (or (= lt!281965 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281965 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281965)))))

(assert (=> b!183172 (= lt!281965 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281092)))))))

(assert (= (and d!63569 res!152248) b!183171))

(assert (= (and b!183171 res!152249) b!183172))

(declare-fun m!285039 () Bool)

(assert (=> d!63569 m!285039))

(declare-fun m!285041 () Bool)

(assert (=> d!63569 m!285041))

(assert (=> b!182873 d!63569))

(assert (=> b!182863 d!63561))

(declare-fun d!63571 () Bool)

(assert (=> d!63571 (= (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 thiss!1204))) (and (bvsge (currentBit!8971 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8971 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8976 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8976 thiss!1204) (size!4296 (buf!4748 thiss!1204))) (and (= (currentBit!8971 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8976 thiss!1204) (size!4296 (buf!4748 thiss!1204)))))))))

(assert (=> b!182874 d!63571))

(declare-fun d!63573 () Bool)

(assert (=> d!63573 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204)) lt!281085) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204))) lt!281085))))

(declare-fun bs!15818 () Bool)

(assert (= bs!15818 d!63573))

(declare-fun m!285043 () Bool)

(assert (=> bs!15818 m!285043))

(assert (=> b!182864 d!63573))

(declare-fun d!63575 () Bool)

(assert (=> d!63575 (= (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281087)))) (and (bvsge (currentBit!8971 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8971 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8976 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281087)))) (and (= (currentBit!8971 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8976 thiss!1204) (size!4296 (buf!4748 (_2!8542 lt!281087))))))))))

(assert (=> b!182864 d!63575))

(declare-fun d!63577 () Bool)

(declare-fun e!127040 () Bool)

(assert (=> d!63577 e!127040))

(declare-fun res!152250 () Bool)

(assert (=> d!63577 (=> (not res!152250) (not e!127040))))

(declare-fun lt!281974 () (_ BitVec 64))

(declare-fun lt!281970 () (_ BitVec 64))

(declare-fun lt!281975 () (_ BitVec 64))

(assert (=> d!63577 (= res!152250 (= lt!281974 (bvsub lt!281970 lt!281975)))))

(assert (=> d!63577 (or (= (bvand lt!281970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!281975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!281970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!281970 lt!281975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63577 (= lt!281975 (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281093)))) ((_ sign_extend 32) (currentByte!8976 (_1!8541 lt!281093))) ((_ sign_extend 32) (currentBit!8971 (_1!8541 lt!281093)))))))

(declare-fun lt!281973 () (_ BitVec 64))

(declare-fun lt!281972 () (_ BitVec 64))

(assert (=> d!63577 (= lt!281970 (bvmul lt!281973 lt!281972))))

(assert (=> d!63577 (or (= lt!281973 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!281972 (bvsdiv (bvmul lt!281973 lt!281972) lt!281973)))))

(assert (=> d!63577 (= lt!281972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63577 (= lt!281973 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281093)))))))

(assert (=> d!63577 (= lt!281974 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8976 (_1!8541 lt!281093))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8971 (_1!8541 lt!281093)))))))

(assert (=> d!63577 (invariant!0 (currentBit!8971 (_1!8541 lt!281093)) (currentByte!8976 (_1!8541 lt!281093)) (size!4296 (buf!4748 (_1!8541 lt!281093))))))

(assert (=> d!63577 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281093))) (currentByte!8976 (_1!8541 lt!281093)) (currentBit!8971 (_1!8541 lt!281093))) lt!281974)))

(declare-fun b!183173 () Bool)

(declare-fun res!152251 () Bool)

(assert (=> b!183173 (=> (not res!152251) (not e!127040))))

(assert (=> b!183173 (= res!152251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!281974))))

(declare-fun b!183174 () Bool)

(declare-fun lt!281971 () (_ BitVec 64))

(assert (=> b!183174 (= e!127040 (bvsle lt!281974 (bvmul lt!281971 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183174 (or (= lt!281971 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!281971 #b0000000000000000000000000000000000000000000000000000000000001000) lt!281971)))))

(assert (=> b!183174 (= lt!281971 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281093)))))))

(assert (= (and d!63577 res!152250) b!183173))

(assert (= (and b!183173 res!152251) b!183174))

(declare-fun m!285045 () Bool)

(assert (=> d!63577 m!285045))

(declare-fun m!285047 () Bool)

(assert (=> d!63577 m!285047))

(assert (=> b!182864 d!63577))

(declare-fun d!63579 () Bool)

(declare-fun e!127047 () Bool)

(assert (=> d!63579 e!127047))

(declare-fun res!152262 () Bool)

(assert (=> d!63579 (=> (not res!152262) (not e!127047))))

(declare-fun lt!281993 () tuple2!15792)

(declare-fun lt!281992 () tuple2!15792)

(assert (=> d!63579 (= res!152262 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281993))) (currentByte!8976 (_1!8541 lt!281993)) (currentBit!8971 (_1!8541 lt!281993))) (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281992))) (currentByte!8976 (_1!8541 lt!281992)) (currentBit!8971 (_1!8541 lt!281992)))))))

(declare-fun lt!281994 () Unit!13128)

(declare-fun lt!281995 () BitStream!7700)

(declare-fun choose!50 (BitStream!7700 BitStream!7700 BitStream!7700 tuple2!15792 tuple2!15792 BitStream!7700 Bool tuple2!15792 tuple2!15792 BitStream!7700 Bool) Unit!13128)

(assert (=> d!63579 (= lt!281994 (choose!50 lt!281082 (_2!8542 lt!281086) lt!281995 lt!281993 (tuple2!15793 (_1!8541 lt!281993) (_2!8541 lt!281993)) (_1!8541 lt!281993) (_2!8541 lt!281993) lt!281992 (tuple2!15793 (_1!8541 lt!281992) (_2!8541 lt!281992)) (_1!8541 lt!281992) (_2!8541 lt!281992)))))

(assert (=> d!63579 (= lt!281992 (readBitPure!0 lt!281995))))

(assert (=> d!63579 (= lt!281993 (readBitPure!0 lt!281082))))

(assert (=> d!63579 (= lt!281995 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 lt!281082) (currentBit!8971 lt!281082)))))

(assert (=> d!63579 (invariant!0 (currentBit!8971 lt!281082) (currentByte!8976 lt!281082) (size!4296 (buf!4748 (_2!8542 lt!281086))))))

(assert (=> d!63579 (= (readBitPrefixLemma!0 lt!281082 (_2!8542 lt!281086)) lt!281994)))

(declare-fun b!183186 () Bool)

(assert (=> b!183186 (= e!127047 (= (_2!8541 lt!281993) (_2!8541 lt!281992)))))

(assert (= (and d!63579 res!152262) b!183186))

(declare-fun m!285049 () Bool)

(assert (=> d!63579 m!285049))

(declare-fun m!285051 () Bool)

(assert (=> d!63579 m!285051))

(declare-fun m!285053 () Bool)

(assert (=> d!63579 m!285053))

(declare-fun m!285055 () Bool)

(assert (=> d!63579 m!285055))

(declare-fun m!285057 () Bool)

(assert (=> d!63579 m!285057))

(assert (=> d!63579 m!284483))

(assert (=> b!182864 d!63579))

(declare-fun d!63581 () Bool)

(declare-fun lt!281996 () tuple2!15804)

(assert (=> d!63581 (= lt!281996 (readBit!0 lt!281082))))

(assert (=> d!63581 (= (readBitPure!0 lt!281082) (tuple2!15793 (_2!8547 lt!281996) (_1!8547 lt!281996)))))

(declare-fun bs!15819 () Bool)

(assert (= bs!15819 d!63581))

(declare-fun m!285059 () Bool)

(assert (=> bs!15819 m!285059))

(assert (=> b!182864 d!63581))

(declare-fun d!63583 () Bool)

(declare-datatypes ((tuple2!15810 0))(
  ( (tuple2!15811 (_1!8550 (_ BitVec 64)) (_2!8550 BitStream!7700)) )
))
(declare-fun lt!282003 () tuple2!15810)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15810)

(assert (=> d!63583 (= lt!282003 (readNBitsLSBFirstsLoop!0 (_1!8543 lt!281090) nBits!348 i!590 lt!281084))))

(assert (=> d!63583 (= (readNBitsLSBFirstsLoopPure!0 (_1!8543 lt!281090) nBits!348 i!590 lt!281084) (tuple2!15799 (_2!8550 lt!282003) (_1!8550 lt!282003)))))

(declare-fun bs!15820 () Bool)

(assert (= bs!15820 d!63583))

(declare-fun m!285077 () Bool)

(assert (=> bs!15820 m!285077))

(assert (=> b!182864 d!63583))

(declare-fun d!63587 () Bool)

(declare-fun e!127052 () Bool)

(assert (=> d!63587 e!127052))

(declare-fun res!152270 () Bool)

(assert (=> d!63587 (=> (not res!152270) (not e!127052))))

(declare-fun lt!282004 () (_ BitVec 64))

(declare-fun lt!282009 () (_ BitVec 64))

(declare-fun lt!282008 () (_ BitVec 64))

(assert (=> d!63587 (= res!152270 (= lt!282008 (bvsub lt!282004 lt!282009)))))

(assert (=> d!63587 (or (= (bvand lt!282004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!282009 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!282004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!282004 lt!282009) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63587 (= lt!282009 (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281095)))) ((_ sign_extend 32) (currentByte!8976 (_1!8541 lt!281095))) ((_ sign_extend 32) (currentBit!8971 (_1!8541 lt!281095)))))))

(declare-fun lt!282007 () (_ BitVec 64))

(declare-fun lt!282006 () (_ BitVec 64))

(assert (=> d!63587 (= lt!282004 (bvmul lt!282007 lt!282006))))

(assert (=> d!63587 (or (= lt!282007 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!282006 (bvsdiv (bvmul lt!282007 lt!282006) lt!282007)))))

(assert (=> d!63587 (= lt!282006 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63587 (= lt!282007 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281095)))))))

(assert (=> d!63587 (= lt!282008 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8976 (_1!8541 lt!281095))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8971 (_1!8541 lt!281095)))))))

(assert (=> d!63587 (invariant!0 (currentBit!8971 (_1!8541 lt!281095)) (currentByte!8976 (_1!8541 lt!281095)) (size!4296 (buf!4748 (_1!8541 lt!281095))))))

(assert (=> d!63587 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!281095))) (currentByte!8976 (_1!8541 lt!281095)) (currentBit!8971 (_1!8541 lt!281095))) lt!282008)))

(declare-fun b!183194 () Bool)

(declare-fun res!152271 () Bool)

(assert (=> b!183194 (=> (not res!152271) (not e!127052))))

(assert (=> b!183194 (= res!152271 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!282008))))

(declare-fun b!183195 () Bool)

(declare-fun lt!282005 () (_ BitVec 64))

(assert (=> b!183195 (= e!127052 (bvsle lt!282008 (bvmul lt!282005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!183195 (or (= lt!282005 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!282005 #b0000000000000000000000000000000000000000000000000000000000001000) lt!282005)))))

(assert (=> b!183195 (= lt!282005 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8541 lt!281095)))))))

(assert (= (and d!63587 res!152270) b!183194))

(assert (= (and b!183194 res!152271) b!183195))

(declare-fun m!285079 () Bool)

(assert (=> d!63587 m!285079))

(declare-fun m!285081 () Bool)

(assert (=> d!63587 m!285081))

(assert (=> b!182864 d!63587))

(declare-fun d!63589 () Bool)

(assert (=> d!63589 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!182864 d!63589))

(declare-fun d!63591 () Bool)

(assert (=> d!63591 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087))) lt!281077)))

(declare-fun lt!282012 () Unit!13128)

(declare-fun choose!9 (BitStream!7700 array!9741 (_ BitVec 64) BitStream!7700) Unit!13128)

(assert (=> d!63591 (= lt!282012 (choose!9 (_2!8542 lt!281087) (buf!4748 (_2!8542 lt!281086)) lt!281077 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087)))))))

(assert (=> d!63591 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8542 lt!281087) (buf!4748 (_2!8542 lt!281086)) lt!281077) lt!282012)))

(declare-fun bs!15821 () Bool)

(assert (= bs!15821 d!63591))

(assert (=> bs!15821 m!284487))

(declare-fun m!285083 () Bool)

(assert (=> bs!15821 m!285083))

(assert (=> b!182864 d!63591))

(declare-fun lt!282061 () (_ BitVec 64))

(declare-fun lt!282060 () (_ BitVec 64))

(declare-fun lt!282067 () tuple2!15796)

(declare-fun b!183206 () Bool)

(declare-fun e!127058 () Bool)

(assert (=> b!183206 (= e!127058 (= (_1!8543 lt!282067) (withMovedBitIndex!0 (_2!8543 lt!282067) (bvsub lt!282061 lt!282060))))))

(assert (=> b!183206 (or (= (bvand lt!282061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!282060 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!282061 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!282061 lt!282060) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183206 (= lt!282060 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281086))) (currentByte!8976 (_2!8542 lt!281086)) (currentBit!8971 (_2!8542 lt!281086))))))

(assert (=> b!183206 (= lt!282061 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))))))

(declare-fun b!183207 () Bool)

(declare-fun res!152279 () Bool)

(assert (=> b!183207 (=> (not res!152279) (not e!127058))))

(assert (=> b!183207 (= res!152279 (isPrefixOf!0 (_1!8543 lt!282067) (_2!8542 lt!281087)))))

(declare-fun b!183208 () Bool)

(declare-fun e!127057 () Unit!13128)

(declare-fun lt!282065 () Unit!13128)

(assert (=> b!183208 (= e!127057 lt!282065)))

(declare-fun lt!282072 () (_ BitVec 64))

(assert (=> b!183208 (= lt!282072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!282064 () (_ BitVec 64))

(assert (=> b!183208 (= lt!282064 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281087))) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9741 array!9741 (_ BitVec 64) (_ BitVec 64)) Unit!13128)

(assert (=> b!183208 (= lt!282065 (arrayBitRangesEqSymmetric!0 (buf!4748 (_2!8542 lt!281087)) (buf!4748 (_2!8542 lt!281086)) lt!282072 lt!282064))))

(assert (=> b!183208 (arrayBitRangesEq!0 (buf!4748 (_2!8542 lt!281086)) (buf!4748 (_2!8542 lt!281087)) lt!282072 lt!282064)))

(declare-fun b!183210 () Bool)

(declare-fun res!152280 () Bool)

(assert (=> b!183210 (=> (not res!152280) (not e!127058))))

(assert (=> b!183210 (= res!152280 (isPrefixOf!0 (_2!8543 lt!282067) (_2!8542 lt!281086)))))

(declare-fun b!183209 () Bool)

(declare-fun Unit!13167 () Unit!13128)

(assert (=> b!183209 (= e!127057 Unit!13167)))

(declare-fun d!63593 () Bool)

(assert (=> d!63593 e!127058))

(declare-fun res!152278 () Bool)

(assert (=> d!63593 (=> (not res!152278) (not e!127058))))

(assert (=> d!63593 (= res!152278 (isPrefixOf!0 (_1!8543 lt!282067) (_2!8543 lt!282067)))))

(declare-fun lt!282063 () BitStream!7700)

(assert (=> d!63593 (= lt!282067 (tuple2!15797 lt!282063 (_2!8542 lt!281086)))))

(declare-fun lt!282057 () Unit!13128)

(declare-fun lt!282071 () Unit!13128)

(assert (=> d!63593 (= lt!282057 lt!282071)))

(assert (=> d!63593 (isPrefixOf!0 lt!282063 (_2!8542 lt!281086))))

(assert (=> d!63593 (= lt!282071 (lemmaIsPrefixTransitive!0 lt!282063 (_2!8542 lt!281086) (_2!8542 lt!281086)))))

(declare-fun lt!282068 () Unit!13128)

(declare-fun lt!282053 () Unit!13128)

(assert (=> d!63593 (= lt!282068 lt!282053)))

(assert (=> d!63593 (isPrefixOf!0 lt!282063 (_2!8542 lt!281086))))

(assert (=> d!63593 (= lt!282053 (lemmaIsPrefixTransitive!0 lt!282063 (_2!8542 lt!281087) (_2!8542 lt!281086)))))

(declare-fun lt!282070 () Unit!13128)

(assert (=> d!63593 (= lt!282070 e!127057)))

(declare-fun c!9425 () Bool)

(assert (=> d!63593 (= c!9425 (not (= (size!4296 (buf!4748 (_2!8542 lt!281087))) #b00000000000000000000000000000000)))))

(declare-fun lt!282058 () Unit!13128)

(declare-fun lt!282069 () Unit!13128)

(assert (=> d!63593 (= lt!282058 lt!282069)))

(assert (=> d!63593 (isPrefixOf!0 (_2!8542 lt!281086) (_2!8542 lt!281086))))

(assert (=> d!63593 (= lt!282069 (lemmaIsPrefixRefl!0 (_2!8542 lt!281086)))))

(declare-fun lt!282056 () Unit!13128)

(declare-fun lt!282059 () Unit!13128)

(assert (=> d!63593 (= lt!282056 lt!282059)))

(assert (=> d!63593 (= lt!282059 (lemmaIsPrefixRefl!0 (_2!8542 lt!281086)))))

(declare-fun lt!282062 () Unit!13128)

(declare-fun lt!282054 () Unit!13128)

(assert (=> d!63593 (= lt!282062 lt!282054)))

(assert (=> d!63593 (isPrefixOf!0 lt!282063 lt!282063)))

(assert (=> d!63593 (= lt!282054 (lemmaIsPrefixRefl!0 lt!282063))))

(declare-fun lt!282066 () Unit!13128)

(declare-fun lt!282055 () Unit!13128)

(assert (=> d!63593 (= lt!282066 lt!282055)))

(assert (=> d!63593 (isPrefixOf!0 (_2!8542 lt!281087) (_2!8542 lt!281087))))

(assert (=> d!63593 (= lt!282055 (lemmaIsPrefixRefl!0 (_2!8542 lt!281087)))))

(assert (=> d!63593 (= lt!282063 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 (_2!8542 lt!281087)) (currentBit!8971 (_2!8542 lt!281087))))))

(assert (=> d!63593 (isPrefixOf!0 (_2!8542 lt!281087) (_2!8542 lt!281086))))

(assert (=> d!63593 (= (reader!0 (_2!8542 lt!281087) (_2!8542 lt!281086)) lt!282067)))

(assert (= (and d!63593 c!9425) b!183208))

(assert (= (and d!63593 (not c!9425)) b!183209))

(assert (= (and d!63593 res!152278) b!183207))

(assert (= (and b!183207 res!152279) b!183210))

(assert (= (and b!183210 res!152280) b!183206))

(declare-fun m!285085 () Bool)

(assert (=> b!183207 m!285085))

(declare-fun m!285087 () Bool)

(assert (=> b!183210 m!285087))

(assert (=> b!183208 m!284437))

(declare-fun m!285089 () Bool)

(assert (=> b!183208 m!285089))

(declare-fun m!285091 () Bool)

(assert (=> b!183208 m!285091))

(declare-fun m!285093 () Bool)

(assert (=> d!63593 m!285093))

(declare-fun m!285095 () Bool)

(assert (=> d!63593 m!285095))

(declare-fun m!285097 () Bool)

(assert (=> d!63593 m!285097))

(declare-fun m!285099 () Bool)

(assert (=> d!63593 m!285099))

(declare-fun m!285101 () Bool)

(assert (=> d!63593 m!285101))

(assert (=> d!63593 m!284949))

(declare-fun m!285103 () Bool)

(assert (=> d!63593 m!285103))

(declare-fun m!285105 () Bool)

(assert (=> d!63593 m!285105))

(assert (=> d!63593 m!284461))

(declare-fun m!285107 () Bool)

(assert (=> d!63593 m!285107))

(declare-fun m!285109 () Bool)

(assert (=> d!63593 m!285109))

(declare-fun m!285111 () Bool)

(assert (=> b!183206 m!285111))

(assert (=> b!183206 m!284449))

(assert (=> b!183206 m!284437))

(assert (=> b!182864 d!63593))

(declare-fun d!63595 () Bool)

(declare-fun lt!282073 () tuple2!15804)

(assert (=> d!63595 (= lt!282073 (readBit!0 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204))))))

(assert (=> d!63595 (= (readBitPure!0 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204))) (tuple2!15793 (_2!8547 lt!282073) (_1!8547 lt!282073)))))

(declare-fun bs!15822 () Bool)

(assert (= bs!15822 d!63595))

(declare-fun m!285113 () Bool)

(assert (=> bs!15822 m!285113))

(assert (=> b!182864 d!63595))

(declare-fun lt!282081 () (_ BitVec 64))

(declare-fun e!127060 () Bool)

(declare-fun lt!282082 () (_ BitVec 64))

(declare-fun b!183211 () Bool)

(declare-fun lt!282088 () tuple2!15796)

(assert (=> b!183211 (= e!127060 (= (_1!8543 lt!282088) (withMovedBitIndex!0 (_2!8543 lt!282088) (bvsub lt!282082 lt!282081))))))

(assert (=> b!183211 (or (= (bvand lt!282082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!282081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!282082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!282082 lt!282081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183211 (= lt!282081 (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!281086))) (currentByte!8976 (_2!8542 lt!281086)) (currentBit!8971 (_2!8542 lt!281086))))))

(assert (=> b!183211 (= lt!282082 (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(declare-fun b!183212 () Bool)

(declare-fun res!152282 () Bool)

(assert (=> b!183212 (=> (not res!152282) (not e!127060))))

(assert (=> b!183212 (= res!152282 (isPrefixOf!0 (_1!8543 lt!282088) thiss!1204))))

(declare-fun b!183213 () Bool)

(declare-fun e!127059 () Unit!13128)

(declare-fun lt!282086 () Unit!13128)

(assert (=> b!183213 (= e!127059 lt!282086)))

(declare-fun lt!282093 () (_ BitVec 64))

(assert (=> b!183213 (= lt!282093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!282085 () (_ BitVec 64))

(assert (=> b!183213 (= lt!282085 (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(assert (=> b!183213 (= lt!282086 (arrayBitRangesEqSymmetric!0 (buf!4748 thiss!1204) (buf!4748 (_2!8542 lt!281086)) lt!282093 lt!282085))))

(assert (=> b!183213 (arrayBitRangesEq!0 (buf!4748 (_2!8542 lt!281086)) (buf!4748 thiss!1204) lt!282093 lt!282085)))

(declare-fun b!183215 () Bool)

(declare-fun res!152283 () Bool)

(assert (=> b!183215 (=> (not res!152283) (not e!127060))))

(assert (=> b!183215 (= res!152283 (isPrefixOf!0 (_2!8543 lt!282088) (_2!8542 lt!281086)))))

(declare-fun b!183214 () Bool)

(declare-fun Unit!13168 () Unit!13128)

(assert (=> b!183214 (= e!127059 Unit!13168)))

(declare-fun d!63597 () Bool)

(assert (=> d!63597 e!127060))

(declare-fun res!152281 () Bool)

(assert (=> d!63597 (=> (not res!152281) (not e!127060))))

(assert (=> d!63597 (= res!152281 (isPrefixOf!0 (_1!8543 lt!282088) (_2!8543 lt!282088)))))

(declare-fun lt!282084 () BitStream!7700)

(assert (=> d!63597 (= lt!282088 (tuple2!15797 lt!282084 (_2!8542 lt!281086)))))

(declare-fun lt!282078 () Unit!13128)

(declare-fun lt!282092 () Unit!13128)

(assert (=> d!63597 (= lt!282078 lt!282092)))

(assert (=> d!63597 (isPrefixOf!0 lt!282084 (_2!8542 lt!281086))))

(assert (=> d!63597 (= lt!282092 (lemmaIsPrefixTransitive!0 lt!282084 (_2!8542 lt!281086) (_2!8542 lt!281086)))))

(declare-fun lt!282089 () Unit!13128)

(declare-fun lt!282074 () Unit!13128)

(assert (=> d!63597 (= lt!282089 lt!282074)))

(assert (=> d!63597 (isPrefixOf!0 lt!282084 (_2!8542 lt!281086))))

(assert (=> d!63597 (= lt!282074 (lemmaIsPrefixTransitive!0 lt!282084 thiss!1204 (_2!8542 lt!281086)))))

(declare-fun lt!282091 () Unit!13128)

(assert (=> d!63597 (= lt!282091 e!127059)))

(declare-fun c!9426 () Bool)

(assert (=> d!63597 (= c!9426 (not (= (size!4296 (buf!4748 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!282079 () Unit!13128)

(declare-fun lt!282090 () Unit!13128)

(assert (=> d!63597 (= lt!282079 lt!282090)))

(assert (=> d!63597 (isPrefixOf!0 (_2!8542 lt!281086) (_2!8542 lt!281086))))

(assert (=> d!63597 (= lt!282090 (lemmaIsPrefixRefl!0 (_2!8542 lt!281086)))))

(declare-fun lt!282077 () Unit!13128)

(declare-fun lt!282080 () Unit!13128)

(assert (=> d!63597 (= lt!282077 lt!282080)))

(assert (=> d!63597 (= lt!282080 (lemmaIsPrefixRefl!0 (_2!8542 lt!281086)))))

(declare-fun lt!282083 () Unit!13128)

(declare-fun lt!282075 () Unit!13128)

(assert (=> d!63597 (= lt!282083 lt!282075)))

(assert (=> d!63597 (isPrefixOf!0 lt!282084 lt!282084)))

(assert (=> d!63597 (= lt!282075 (lemmaIsPrefixRefl!0 lt!282084))))

(declare-fun lt!282087 () Unit!13128)

(declare-fun lt!282076 () Unit!13128)

(assert (=> d!63597 (= lt!282087 lt!282076)))

(assert (=> d!63597 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63597 (= lt!282076 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63597 (= lt!282084 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(assert (=> d!63597 (isPrefixOf!0 thiss!1204 (_2!8542 lt!281086))))

(assert (=> d!63597 (= (reader!0 thiss!1204 (_2!8542 lt!281086)) lt!282088)))

(assert (= (and d!63597 c!9426) b!183213))

(assert (= (and d!63597 (not c!9426)) b!183214))

(assert (= (and d!63597 res!152281) b!183212))

(assert (= (and b!183212 res!152282) b!183215))

(assert (= (and b!183215 res!152283) b!183211))

(declare-fun m!285115 () Bool)

(assert (=> b!183212 m!285115))

(declare-fun m!285117 () Bool)

(assert (=> b!183215 m!285117))

(assert (=> b!183213 m!284439))

(declare-fun m!285119 () Bool)

(assert (=> b!183213 m!285119))

(declare-fun m!285121 () Bool)

(assert (=> b!183213 m!285121))

(declare-fun m!285123 () Bool)

(assert (=> d!63597 m!285123))

(declare-fun m!285125 () Bool)

(assert (=> d!63597 m!285125))

(declare-fun m!285127 () Bool)

(assert (=> d!63597 m!285127))

(declare-fun m!285129 () Bool)

(assert (=> d!63597 m!285129))

(declare-fun m!285131 () Bool)

(assert (=> d!63597 m!285131))

(declare-fun m!285133 () Bool)

(assert (=> d!63597 m!285133))

(declare-fun m!285135 () Bool)

(assert (=> d!63597 m!285135))

(assert (=> d!63597 m!285105))

(assert (=> d!63597 m!284451))

(assert (=> d!63597 m!285107))

(declare-fun m!285137 () Bool)

(assert (=> d!63597 m!285137))

(declare-fun m!285139 () Bool)

(assert (=> b!183211 m!285139))

(assert (=> b!183211 m!284449))

(assert (=> b!183211 m!284439))

(assert (=> b!182864 d!63597))

(declare-fun d!63599 () Bool)

(assert (=> d!63599 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087))) lt!281077) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 (_2!8542 lt!281087))) ((_ sign_extend 32) (currentBit!8971 (_2!8542 lt!281087)))) lt!281077))))

(declare-fun bs!15823 () Bool)

(assert (= bs!15823 d!63599))

(declare-fun m!285141 () Bool)

(assert (=> bs!15823 m!285141))

(assert (=> b!182864 d!63599))

(declare-fun d!63601 () Bool)

(declare-fun lt!282094 () tuple2!15804)

(assert (=> d!63601 (= lt!282094 (readBit!0 (_1!8543 lt!281090)))))

(assert (=> d!63601 (= (readBitPure!0 (_1!8543 lt!281090)) (tuple2!15793 (_2!8547 lt!282094) (_1!8547 lt!282094)))))

(declare-fun bs!15824 () Bool)

(assert (= bs!15824 d!63601))

(declare-fun m!285143 () Bool)

(assert (=> bs!15824 m!285143))

(assert (=> b!182864 d!63601))

(declare-fun d!63603 () Bool)

(assert (=> d!63603 (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_2!8542 lt!281086)))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204)) lt!281085)))

(declare-fun lt!282095 () Unit!13128)

(assert (=> d!63603 (= lt!282095 (choose!9 thiss!1204 (buf!4748 (_2!8542 lt!281086)) lt!281085 (BitStream!7701 (buf!4748 (_2!8542 lt!281086)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204))))))

(assert (=> d!63603 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4748 (_2!8542 lt!281086)) lt!281085) lt!282095)))

(declare-fun bs!15825 () Bool)

(assert (= bs!15825 d!63603))

(assert (=> bs!15825 m!284475))

(declare-fun m!285145 () Bool)

(assert (=> bs!15825 m!285145))

(assert (=> b!182864 d!63603))

(declare-fun d!63605 () Bool)

(assert (=> d!63605 (= (invariant!0 (currentBit!8971 (_2!8542 lt!281086)) (currentByte!8976 (_2!8542 lt!281086)) (size!4296 (buf!4748 (_2!8542 lt!281086)))) (and (bvsge (currentBit!8971 (_2!8542 lt!281086)) #b00000000000000000000000000000000) (bvslt (currentBit!8971 (_2!8542 lt!281086)) #b00000000000000000000000000001000) (bvsge (currentByte!8976 (_2!8542 lt!281086)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8976 (_2!8542 lt!281086)) (size!4296 (buf!4748 (_2!8542 lt!281086)))) (and (= (currentBit!8971 (_2!8542 lt!281086)) #b00000000000000000000000000000000) (= (currentByte!8976 (_2!8542 lt!281086)) (size!4296 (buf!4748 (_2!8542 lt!281086))))))))))

(assert (=> b!182865 d!63605))

(declare-fun d!63607 () Bool)

(assert (=> d!63607 (= (array_inv!4037 (buf!4748 thiss!1204)) (bvsge (size!4296 (buf!4748 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!182866 d!63607))

(declare-fun d!63609 () Bool)

(assert (=> d!63609 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!590)))))))))

(assert (=> b!182856 d!63609))

(declare-fun d!63611 () Bool)

(assert (=> d!63611 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 thiss!1204))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204)) lt!281085) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 thiss!1204))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204))) lt!281085))))

(declare-fun bs!15826 () Bool)

(assert (= bs!15826 d!63611))

(assert (=> bs!15826 m!285035))

(assert (=> b!182867 d!63611))

(assert (=> b!182857 d!63563))

(assert (=> b!182857 d!63565))

(declare-fun b!183225 () Bool)

(declare-fun res!152294 () Bool)

(declare-fun e!127066 () Bool)

(assert (=> b!183225 (=> (not res!152294) (not e!127066))))

(declare-fun lt!282107 () tuple2!15794)

(declare-fun lt!282104 () (_ BitVec 64))

(declare-fun lt!282106 () (_ BitVec 64))

(assert (=> b!183225 (= res!152294 (= (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!282107))) (currentByte!8976 (_2!8542 lt!282107)) (currentBit!8971 (_2!8542 lt!282107))) (bvadd lt!282104 lt!282106)))))

(assert (=> b!183225 (or (not (= (bvand lt!282104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!282106 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!282104 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!282104 lt!282106) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183225 (= lt!282106 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!183225 (= lt!282104 (bitIndex!0 (size!4296 (buf!4748 thiss!1204)) (currentByte!8976 thiss!1204) (currentBit!8971 thiss!1204)))))

(declare-fun b!183228 () Bool)

(declare-fun e!127065 () Bool)

(declare-fun lt!282105 () tuple2!15792)

(assert (=> b!183228 (= e!127065 (= (bitIndex!0 (size!4296 (buf!4748 (_1!8541 lt!282105))) (currentByte!8976 (_1!8541 lt!282105)) (currentBit!8971 (_1!8541 lt!282105))) (bitIndex!0 (size!4296 (buf!4748 (_2!8542 lt!282107))) (currentByte!8976 (_2!8542 lt!282107)) (currentBit!8971 (_2!8542 lt!282107)))))))

(declare-fun b!183227 () Bool)

(assert (=> b!183227 (= e!127066 e!127065)))

(declare-fun res!152292 () Bool)

(assert (=> b!183227 (=> (not res!152292) (not e!127065))))

(assert (=> b!183227 (= res!152292 (and (= (_2!8541 lt!282105) lt!281078) (= (_1!8541 lt!282105) (_2!8542 lt!282107))))))

(assert (=> b!183227 (= lt!282105 (readBitPure!0 (readerFrom!0 (_2!8542 lt!282107) (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204))))))

(declare-fun b!183226 () Bool)

(declare-fun res!152295 () Bool)

(assert (=> b!183226 (=> (not res!152295) (not e!127066))))

(assert (=> b!183226 (= res!152295 (isPrefixOf!0 thiss!1204 (_2!8542 lt!282107)))))

(declare-fun d!63613 () Bool)

(assert (=> d!63613 e!127066))

(declare-fun res!152293 () Bool)

(assert (=> d!63613 (=> (not res!152293) (not e!127066))))

(assert (=> d!63613 (= res!152293 (= (size!4296 (buf!4748 thiss!1204)) (size!4296 (buf!4748 (_2!8542 lt!282107)))))))

(declare-fun choose!16 (BitStream!7700 Bool) tuple2!15794)

(assert (=> d!63613 (= lt!282107 (choose!16 thiss!1204 lt!281078))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63613 (validate_offset_bit!0 ((_ sign_extend 32) (size!4296 (buf!4748 thiss!1204))) ((_ sign_extend 32) (currentByte!8976 thiss!1204)) ((_ sign_extend 32) (currentBit!8971 thiss!1204)))))

(assert (=> d!63613 (= (appendBit!0 thiss!1204 lt!281078) lt!282107)))

(assert (= (and d!63613 res!152293) b!183225))

(assert (= (and b!183225 res!152294) b!183226))

(assert (= (and b!183226 res!152295) b!183227))

(assert (= (and b!183227 res!152292) b!183228))

(declare-fun m!285147 () Bool)

(assert (=> b!183226 m!285147))

(declare-fun m!285149 () Bool)

(assert (=> b!183225 m!285149))

(assert (=> b!183225 m!284439))

(declare-fun m!285151 () Bool)

(assert (=> d!63613 m!285151))

(declare-fun m!285153 () Bool)

(assert (=> d!63613 m!285153))

(declare-fun m!285155 () Bool)

(assert (=> b!183228 m!285155))

(assert (=> b!183228 m!285149))

(declare-fun m!285157 () Bool)

(assert (=> b!183227 m!285157))

(assert (=> b!183227 m!285157))

(declare-fun m!285159 () Bool)

(assert (=> b!183227 m!285159))

(assert (=> b!182857 d!63613))

(declare-fun d!63615 () Bool)

(assert (=> d!63615 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8971 thiss!1204) (currentByte!8976 thiss!1204) (size!4296 (buf!4748 thiss!1204))))))

(declare-fun bs!15827 () Bool)

(assert (= bs!15827 d!63615))

(assert (=> bs!15827 m!284459))

(assert (=> start!40074 d!63615))

(declare-fun d!63617 () Bool)

(assert (=> d!63617 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8543 lt!281088)))) ((_ sign_extend 32) (currentByte!8976 (_1!8543 lt!281088))) ((_ sign_extend 32) (currentBit!8971 (_1!8543 lt!281088))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4296 (buf!4748 (_1!8543 lt!281088)))) ((_ sign_extend 32) (currentByte!8976 (_1!8543 lt!281088))) ((_ sign_extend 32) (currentBit!8971 (_1!8543 lt!281088)))) ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun bs!15828 () Bool)

(assert (= bs!15828 d!63617))

(declare-fun m!285161 () Bool)

(assert (=> bs!15828 m!285161))

(assert (=> b!182858 d!63617))

(push 1)

(assert (not d!63601))

(assert (not b!183148))

(assert (not d!63563))

(assert (not b!183211))

(assert (not d!63447))

(assert (not d!63587))

(assert (not d!63443))

(assert (not b!182920))

(assert (not b!183206))

(assert (not b!183213))

(assert (not b!182907))

(assert (not b!183146))

(assert (not b!183142))

(assert (not d!63615))

(assert (not d!63439))

(assert (not d!63611))

(assert (not bm!2969))

(assert (not d!63565))

(assert (not b!183208))

(assert (not d!63591))

(assert (not b!183215))

(assert (not d!63595))

(assert (not b!183226))

(assert (not b!183207))

(assert (not b!183210))

(assert (not d!63597))

(assert (not d!63599))

(assert (not d!63569))

(assert (not d!63617))

(assert (not b!182922))

(assert (not d!63613))

(assert (not b!183225))

(assert (not b!183228))

(assert (not d!63579))

(assert (not d!63603))

(assert (not d!63583))

(assert (not b!183170))

(assert (not b!183161))

(assert (not d!63581))

(assert (not b!183151))

(assert (not b!183168))

(assert (not b!183152))

(assert (not d!63573))

(assert (not b!183227))

(assert (not b!183149))

(assert (not b!183138))

(assert (not d!63449))

(assert (not b!183139))

(assert (not b!183212))

(assert (not d!63577))

(assert (not b!183141))

(assert (not d!63593))

(assert (not b!183163))

(assert (not b!183140))

(assert (not d!63441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

