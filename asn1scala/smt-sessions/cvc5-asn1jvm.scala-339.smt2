; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7934 () Bool)

(assert start!7934)

(declare-fun b!39469 () Bool)

(declare-fun e!26000 () Bool)

(declare-fun e!26012 () Bool)

(assert (=> b!39469 (= e!26000 e!26012)))

(declare-fun res!33581 () Bool)

(assert (=> b!39469 (=> res!33581 e!26012)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!39469 (= res!33581 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!1985 0))(
  ( (array!1986 (arr!1391 (Array (_ BitVec 32) (_ BitVec 8))) (size!895 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1540 0))(
  ( (BitStream!1541 (buf!1223 array!1985) (currentByte!2635 (_ BitVec 32)) (currentBit!2630 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2811 0))(
  ( (Unit!2812) )
))
(declare-datatypes ((tuple2!3814 0))(
  ( (tuple2!3815 (_1!1994 Unit!2811) (_2!1994 BitStream!1540)) )
))
(declare-fun lt!59894 () tuple2!3814)

(declare-fun lt!59898 () (_ BitVec 64))

(declare-datatypes ((tuple2!3816 0))(
  ( (tuple2!3817 (_1!1995 BitStream!1540) (_2!1995 BitStream!1540)) )
))
(declare-fun lt!59900 () tuple2!3816)

(declare-datatypes ((List!471 0))(
  ( (Nil!468) (Cons!467 (h!586 Bool) (t!1221 List!471)) )
))
(declare-fun lt!59909 () List!471)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1540 BitStream!1540 (_ BitVec 64)) List!471)

(assert (=> b!39469 (= lt!59909 (bitStreamReadBitsIntoList!0 (_2!1994 lt!59894) (_1!1995 lt!59900) lt!59898))))

(declare-fun lt!59899 () tuple2!3816)

(declare-fun lt!59896 () List!471)

(assert (=> b!39469 (= lt!59896 (bitStreamReadBitsIntoList!0 (_2!1994 lt!59894) (_1!1995 lt!59899) (bvsub to!314 i!635)))))

(declare-fun lt!59889 () tuple2!3814)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39469 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!59898)))

(declare-fun lt!59890 () Unit!2811)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1540 array!1985 (_ BitVec 64)) Unit!2811)

(assert (=> b!39469 (= lt!59890 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1994 lt!59889) (buf!1223 (_2!1994 lt!59894)) lt!59898))))

(declare-fun reader!0 (BitStream!1540 BitStream!1540) tuple2!3816)

(assert (=> b!39469 (= lt!59900 (reader!0 (_2!1994 lt!59889) (_2!1994 lt!59894)))))

(declare-fun thiss!1379 () BitStream!1540)

(assert (=> b!39469 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59892 () Unit!2811)

(assert (=> b!39469 (= lt!59892 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1223 (_2!1994 lt!59894)) (bvsub to!314 i!635)))))

(assert (=> b!39469 (= lt!59899 (reader!0 thiss!1379 (_2!1994 lt!59894)))))

(declare-fun b!39470 () Bool)

(declare-fun e!26003 () Bool)

(declare-fun e!25998 () Bool)

(assert (=> b!39470 (= e!26003 e!25998)))

(declare-fun res!33591 () Bool)

(assert (=> b!39470 (=> res!33591 e!25998)))

(declare-fun lt!59904 () (_ BitVec 64))

(declare-fun lt!59897 () (_ BitVec 64))

(assert (=> b!39470 (= res!33591 (not (= lt!59904 (bvsub (bvadd lt!59897 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!39470 (= lt!59904 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59894))) (currentByte!2635 (_2!1994 lt!59894)) (currentBit!2630 (_2!1994 lt!59894))))))

(declare-fun b!39471 () Bool)

(declare-fun e!26008 () Bool)

(declare-fun e!26002 () Bool)

(assert (=> b!39471 (= e!26008 e!26002)))

(declare-fun res!33584 () Bool)

(assert (=> b!39471 (=> res!33584 e!26002)))

(declare-fun lt!59893 () Bool)

(declare-fun bitAt!0 (array!1985 (_ BitVec 64)) Bool)

(assert (=> b!39471 (= res!33584 (not (= lt!59893 (bitAt!0 (buf!1223 (_1!1995 lt!59900)) lt!59897))))))

(assert (=> b!39471 (= lt!59893 (bitAt!0 (buf!1223 (_1!1995 lt!59899)) lt!59897))))

(declare-fun b!39472 () Bool)

(declare-fun e!26007 () Bool)

(declare-fun e!26005 () Bool)

(assert (=> b!39472 (= e!26007 e!26005)))

(declare-fun res!33586 () Bool)

(assert (=> b!39472 (=> res!33586 e!26005)))

(declare-fun lt!59902 () Bool)

(declare-fun lt!59907 () Bool)

(assert (=> b!39472 (= res!33586 (not (= lt!59902 lt!59907)))))

(assert (=> b!39472 (= lt!59902 (bitAt!0 (buf!1223 (_2!1994 lt!59889)) lt!59897))))

(declare-fun b!39473 () Bool)

(declare-fun res!33588 () Bool)

(assert (=> b!39473 (=> res!33588 e!25998)))

(assert (=> b!39473 (= res!33588 (not (= (size!895 (buf!1223 thiss!1379)) (size!895 (buf!1223 (_2!1994 lt!59894))))))))

(declare-fun srcBuffer!2 () array!1985)

(declare-fun e!26014 () Bool)

(declare-fun b!39474 () Bool)

(declare-fun lt!59911 () tuple2!3816)

(declare-fun head!308 (List!471) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1540 array!1985 (_ BitVec 64) (_ BitVec 64)) List!471)

(assert (=> b!39474 (= e!26014 (= (head!308 (byteArrayBitContentToList!0 (_2!1994 lt!59889) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!308 (bitStreamReadBitsIntoList!0 (_2!1994 lt!59889) (_1!1995 lt!59911) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!39475 () Bool)

(declare-fun e!26004 () Bool)

(assert (=> b!39475 (= e!26004 e!26007)))

(declare-fun res!33580 () Bool)

(assert (=> b!39475 (=> res!33580 e!26007)))

(declare-fun lt!59891 () Bool)

(assert (=> b!39475 (= res!33580 (not (= lt!59891 lt!59907)))))

(assert (=> b!39475 (= lt!59907 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!39475 (= lt!59891 (head!308 (byteArrayBitContentToList!0 (_2!1994 lt!59894) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!39476 () Bool)

(declare-fun res!33593 () Bool)

(declare-fun e!26006 () Bool)

(assert (=> b!39476 (=> res!33593 e!26006)))

(declare-datatypes ((tuple2!3818 0))(
  ( (tuple2!3819 (_1!1996 BitStream!1540) (_2!1996 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1540) tuple2!3818)

(assert (=> b!39476 (= res!33593 (not (= (_2!1996 (readBitPure!0 (_1!1995 lt!59899))) lt!59907)))))

(declare-fun b!39477 () Bool)

(declare-fun e!26009 () Bool)

(assert (=> b!39477 (= e!26009 e!26003)))

(declare-fun res!33590 () Bool)

(assert (=> b!39477 (=> res!33590 e!26003)))

(declare-fun isPrefixOf!0 (BitStream!1540 BitStream!1540) Bool)

(assert (=> b!39477 (= res!33590 (not (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!59894))))))

(assert (=> b!39477 (isPrefixOf!0 thiss!1379 (_2!1994 lt!59894))))

(declare-fun lt!59910 () Unit!2811)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1540 BitStream!1540 BitStream!1540) Unit!2811)

(assert (=> b!39477 (= lt!59910 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1994 lt!59889) (_2!1994 lt!59894)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1540 array!1985 (_ BitVec 64) (_ BitVec 64)) tuple2!3814)

(assert (=> b!39477 (= lt!59894 (appendBitsMSBFirstLoop!0 (_2!1994 lt!59889) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!39477 e!26014))

(declare-fun res!33592 () Bool)

(assert (=> b!39477 (=> (not res!33592) (not e!26014))))

(assert (=> b!39477 (= res!33592 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59912 () Unit!2811)

(assert (=> b!39477 (= lt!59912 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1223 (_2!1994 lt!59889)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39477 (= lt!59911 (reader!0 thiss!1379 (_2!1994 lt!59889)))))

(declare-fun b!39478 () Bool)

(declare-fun res!33574 () Bool)

(assert (=> b!39478 (=> res!33574 e!26006)))

(declare-fun lt!59914 () Bool)

(assert (=> b!39478 (= res!33574 (not (= lt!59914 lt!59891)))))

(declare-fun b!39479 () Bool)

(assert (=> b!39479 (= e!26012 e!26008)))

(declare-fun res!33582 () Bool)

(assert (=> b!39479 (=> res!33582 e!26008)))

(declare-fun lt!59903 () List!471)

(assert (=> b!39479 (= res!33582 (not (= lt!59903 lt!59909)))))

(assert (=> b!39479 (= lt!59909 lt!59903)))

(declare-fun tail!188 (List!471) List!471)

(assert (=> b!39479 (= lt!59903 (tail!188 lt!59896))))

(declare-fun lt!59895 () Unit!2811)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1540 BitStream!1540 BitStream!1540 BitStream!1540 (_ BitVec 64) List!471) Unit!2811)

(assert (=> b!39479 (= lt!59895 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1994 lt!59894) (_2!1994 lt!59894) (_1!1995 lt!59899) (_1!1995 lt!59900) (bvsub to!314 i!635) lt!59896))))

(declare-fun res!33587 () Bool)

(declare-fun e!26010 () Bool)

(assert (=> start!7934 (=> (not res!33587) (not e!26010))))

(assert (=> start!7934 (= res!33587 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!895 srcBuffer!2))))))))

(assert (=> start!7934 e!26010))

(assert (=> start!7934 true))

(declare-fun array_inv!823 (array!1985) Bool)

(assert (=> start!7934 (array_inv!823 srcBuffer!2)))

(declare-fun e!26001 () Bool)

(declare-fun inv!12 (BitStream!1540) Bool)

(assert (=> start!7934 (and (inv!12 thiss!1379) e!26001)))

(declare-fun b!39468 () Bool)

(declare-fun res!33577 () Bool)

(assert (=> b!39468 (=> res!33577 e!25998)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!39468 (= res!33577 (not (invariant!0 (currentBit!2630 (_2!1994 lt!59894)) (currentByte!2635 (_2!1994 lt!59894)) (size!895 (buf!1223 (_2!1994 lt!59894))))))))

(declare-fun b!39480 () Bool)

(declare-fun res!33575 () Bool)

(assert (=> b!39480 (=> res!33575 e!26012)))

(declare-fun length!197 (List!471) Int)

(assert (=> b!39480 (= res!33575 (<= (length!197 lt!59896) 0))))

(declare-fun b!39481 () Bool)

(declare-fun res!33573 () Bool)

(assert (=> b!39481 (=> res!33573 e!26000)))

(assert (=> b!39481 (= res!33573 (not (invariant!0 (currentBit!2630 (_2!1994 lt!59889)) (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59894))))))))

(declare-fun b!39482 () Bool)

(declare-fun e!25999 () Bool)

(assert (=> b!39482 (= e!26010 (not e!25999))))

(declare-fun res!33594 () Bool)

(assert (=> b!39482 (=> res!33594 e!25999)))

(assert (=> b!39482 (= res!33594 (bvsge i!635 to!314))))

(assert (=> b!39482 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59906 () Unit!2811)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1540) Unit!2811)

(assert (=> b!39482 (= lt!59906 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!39482 (= lt!59897 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(declare-fun b!39483 () Bool)

(assert (=> b!39483 (= e!26005 e!26006)))

(declare-fun res!33578 () Bool)

(assert (=> b!39483 (=> res!33578 e!26006)))

(declare-fun lt!59908 () Bool)

(assert (=> b!39483 (= res!33578 (not (= lt!59908 lt!59907)))))

(assert (=> b!39483 (= lt!59902 lt!59908)))

(assert (=> b!39483 (= lt!59908 (bitAt!0 (buf!1223 (_2!1994 lt!59894)) lt!59897))))

(declare-fun lt!59913 () Unit!2811)

(declare-fun lt!59901 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1985 array!1985 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2811)

(assert (=> b!39483 (= lt!59913 (arrayBitRangesEqImpliesEq!0 (buf!1223 (_2!1994 lt!59889)) (buf!1223 (_2!1994 lt!59894)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59897 lt!59901))))

(declare-fun b!39484 () Bool)

(assert (=> b!39484 (= e!26002 e!26004)))

(declare-fun res!33589 () Bool)

(assert (=> b!39484 (=> res!33589 e!26004)))

(assert (=> b!39484 (= res!33589 (not (= lt!59914 lt!59893)))))

(assert (=> b!39484 (= lt!59914 (head!308 lt!59896))))

(declare-fun b!39485 () Bool)

(assert (=> b!39485 (= e!26006 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_1!1995 lt!59899)))) ((_ sign_extend 32) (currentByte!2635 (_1!1995 lt!59899))) ((_ sign_extend 32) (currentBit!2630 (_1!1995 lt!59899))) (bvsub to!314 i!635)))))

(declare-fun b!39486 () Bool)

(assert (=> b!39486 (= e!25998 e!26000)))

(declare-fun res!33583 () Bool)

(assert (=> b!39486 (=> res!33583 e!26000)))

(assert (=> b!39486 (= res!33583 (not (= (size!895 (buf!1223 (_2!1994 lt!59889))) (size!895 (buf!1223 (_2!1994 lt!59894))))))))

(assert (=> b!39486 (= lt!59904 (bvsub (bvsub (bvadd lt!59901 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39486 (= lt!59901 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))))))

(assert (=> b!39486 (= (size!895 (buf!1223 (_2!1994 lt!59894))) (size!895 (buf!1223 thiss!1379)))))

(declare-fun b!39487 () Bool)

(assert (=> b!39487 (= e!25999 e!26009)))

(declare-fun res!33576 () Bool)

(assert (=> b!39487 (=> res!33576 e!26009)))

(assert (=> b!39487 (= res!33576 (not (isPrefixOf!0 thiss!1379 (_2!1994 lt!59889))))))

(assert (=> b!39487 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!59898)))

(assert (=> b!39487 (= lt!59898 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59905 () Unit!2811)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1540 BitStream!1540 (_ BitVec 64) (_ BitVec 64)) Unit!2811)

(assert (=> b!39487 (= lt!59905 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1994 lt!59889) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1540 (_ BitVec 8) (_ BitVec 32)) tuple2!3814)

(assert (=> b!39487 (= lt!59889 (appendBitFromByte!0 thiss!1379 (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!39488 () Bool)

(declare-fun res!33585 () Bool)

(assert (=> b!39488 (=> (not res!33585) (not e!26010))))

(assert (=> b!39488 (= res!33585 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 thiss!1379))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!39489 () Bool)

(assert (=> b!39489 (= e!26001 (array_inv!823 (buf!1223 thiss!1379)))))

(declare-fun b!39490 () Bool)

(declare-fun res!33579 () Bool)

(assert (=> b!39490 (=> res!33579 e!26000)))

(assert (=> b!39490 (= res!33579 (not (invariant!0 (currentBit!2630 (_2!1994 lt!59889)) (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59889))))))))

(assert (= (and start!7934 res!33587) b!39488))

(assert (= (and b!39488 res!33585) b!39482))

(assert (= (and b!39482 (not res!33594)) b!39487))

(assert (= (and b!39487 (not res!33576)) b!39477))

(assert (= (and b!39477 res!33592) b!39474))

(assert (= (and b!39477 (not res!33590)) b!39470))

(assert (= (and b!39470 (not res!33591)) b!39468))

(assert (= (and b!39468 (not res!33577)) b!39473))

(assert (= (and b!39473 (not res!33588)) b!39486))

(assert (= (and b!39486 (not res!33583)) b!39490))

(assert (= (and b!39490 (not res!33579)) b!39481))

(assert (= (and b!39481 (not res!33573)) b!39469))

(assert (= (and b!39469 (not res!33581)) b!39480))

(assert (= (and b!39480 (not res!33575)) b!39479))

(assert (= (and b!39479 (not res!33582)) b!39471))

(assert (= (and b!39471 (not res!33584)) b!39484))

(assert (= (and b!39484 (not res!33589)) b!39475))

(assert (= (and b!39475 (not res!33580)) b!39472))

(assert (= (and b!39472 (not res!33586)) b!39483))

(assert (= (and b!39483 (not res!33578)) b!39476))

(assert (= (and b!39476 (not res!33593)) b!39478))

(assert (= (and b!39478 (not res!33574)) b!39485))

(assert (= start!7934 b!39489))

(declare-fun m!60165 () Bool)

(assert (=> b!39488 m!60165))

(declare-fun m!60167 () Bool)

(assert (=> b!39481 m!60167))

(declare-fun m!60169 () Bool)

(assert (=> b!39475 m!60169))

(declare-fun m!60171 () Bool)

(assert (=> b!39475 m!60171))

(assert (=> b!39475 m!60171))

(declare-fun m!60173 () Bool)

(assert (=> b!39475 m!60173))

(declare-fun m!60175 () Bool)

(assert (=> b!39484 m!60175))

(declare-fun m!60177 () Bool)

(assert (=> b!39479 m!60177))

(declare-fun m!60179 () Bool)

(assert (=> b!39479 m!60179))

(declare-fun m!60181 () Bool)

(assert (=> b!39468 m!60181))

(declare-fun m!60183 () Bool)

(assert (=> b!39489 m!60183))

(declare-fun m!60185 () Bool)

(assert (=> b!39469 m!60185))

(declare-fun m!60187 () Bool)

(assert (=> b!39469 m!60187))

(declare-fun m!60189 () Bool)

(assert (=> b!39469 m!60189))

(declare-fun m!60191 () Bool)

(assert (=> b!39469 m!60191))

(declare-fun m!60193 () Bool)

(assert (=> b!39469 m!60193))

(declare-fun m!60195 () Bool)

(assert (=> b!39469 m!60195))

(declare-fun m!60197 () Bool)

(assert (=> b!39469 m!60197))

(declare-fun m!60199 () Bool)

(assert (=> b!39469 m!60199))

(declare-fun m!60201 () Bool)

(assert (=> b!39472 m!60201))

(declare-fun m!60203 () Bool)

(assert (=> b!39487 m!60203))

(declare-fun m!60205 () Bool)

(assert (=> b!39487 m!60205))

(declare-fun m!60207 () Bool)

(assert (=> b!39487 m!60207))

(declare-fun m!60209 () Bool)

(assert (=> b!39487 m!60209))

(declare-fun m!60211 () Bool)

(assert (=> b!39487 m!60211))

(assert (=> b!39487 m!60207))

(declare-fun m!60213 () Bool)

(assert (=> b!39483 m!60213))

(declare-fun m!60215 () Bool)

(assert (=> b!39483 m!60215))

(declare-fun m!60217 () Bool)

(assert (=> b!39476 m!60217))

(declare-fun m!60219 () Bool)

(assert (=> b!39474 m!60219))

(assert (=> b!39474 m!60219))

(declare-fun m!60221 () Bool)

(assert (=> b!39474 m!60221))

(declare-fun m!60223 () Bool)

(assert (=> b!39474 m!60223))

(assert (=> b!39474 m!60223))

(declare-fun m!60225 () Bool)

(assert (=> b!39474 m!60225))

(declare-fun m!60227 () Bool)

(assert (=> b!39486 m!60227))

(declare-fun m!60229 () Bool)

(assert (=> b!39490 m!60229))

(declare-fun m!60231 () Bool)

(assert (=> b!39480 m!60231))

(declare-fun m!60233 () Bool)

(assert (=> b!39485 m!60233))

(declare-fun m!60235 () Bool)

(assert (=> b!39470 m!60235))

(declare-fun m!60237 () Bool)

(assert (=> b!39482 m!60237))

(declare-fun m!60239 () Bool)

(assert (=> b!39482 m!60239))

(declare-fun m!60241 () Bool)

(assert (=> b!39482 m!60241))

(declare-fun m!60243 () Bool)

(assert (=> b!39471 m!60243))

(declare-fun m!60245 () Bool)

(assert (=> b!39471 m!60245))

(declare-fun m!60247 () Bool)

(assert (=> start!7934 m!60247))

(declare-fun m!60249 () Bool)

(assert (=> start!7934 m!60249))

(declare-fun m!60251 () Bool)

(assert (=> b!39477 m!60251))

(declare-fun m!60253 () Bool)

(assert (=> b!39477 m!60253))

(declare-fun m!60255 () Bool)

(assert (=> b!39477 m!60255))

(declare-fun m!60257 () Bool)

(assert (=> b!39477 m!60257))

(declare-fun m!60259 () Bool)

(assert (=> b!39477 m!60259))

(declare-fun m!60261 () Bool)

(assert (=> b!39477 m!60261))

(declare-fun m!60263 () Bool)

(assert (=> b!39477 m!60263))

(push 1)

(assert (not b!39489))

(assert (not b!39484))

(assert (not b!39471))

(assert (not b!39486))

(assert (not b!39468))

(assert (not b!39482))

(assert (not start!7934))

(assert (not b!39487))

(assert (not b!39477))

(assert (not b!39474))

(assert (not b!39483))

(assert (not b!39469))

(assert (not b!39481))

(assert (not b!39472))

(assert (not b!39479))

(assert (not b!39485))

(assert (not b!39476))

(assert (not b!39488))

(assert (not b!39490))

(assert (not b!39470))

(assert (not b!39480))

(assert (not b!39475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11692 () Bool)

(declare-fun e!26153 () Bool)

(assert (=> d!11692 e!26153))

(declare-fun res!33767 () Bool)

(assert (=> d!11692 (=> (not res!33767) (not e!26153))))

(declare-fun lt!60218 () (_ BitVec 64))

(declare-fun lt!60219 () (_ BitVec 64))

(declare-fun lt!60217 () (_ BitVec 64))

(assert (=> d!11692 (= res!33767 (= lt!60218 (bvsub lt!60217 lt!60219)))))

(assert (=> d!11692 (or (= (bvand lt!60217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60219 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60217 lt!60219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11692 (= lt!60219 (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889)))))))

(declare-fun lt!60220 () (_ BitVec 64))

(declare-fun lt!60215 () (_ BitVec 64))

(assert (=> d!11692 (= lt!60217 (bvmul lt!60220 lt!60215))))

(assert (=> d!11692 (or (= lt!60220 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!60215 (bvsdiv (bvmul lt!60220 lt!60215) lt!60220)))))

(assert (=> d!11692 (= lt!60215 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11692 (= lt!60220 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))))))

(assert (=> d!11692 (= lt!60218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889)))))))

(assert (=> d!11692 (invariant!0 (currentBit!2630 (_2!1994 lt!59889)) (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59889))))))

(assert (=> d!11692 (= (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))) lt!60218)))

(declare-fun b!39698 () Bool)

(declare-fun res!33766 () Bool)

(assert (=> b!39698 (=> (not res!33766) (not e!26153))))

(assert (=> b!39698 (= res!33766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!60218))))

(declare-fun b!39699 () Bool)

(declare-fun lt!60216 () (_ BitVec 64))

(assert (=> b!39699 (= e!26153 (bvsle lt!60218 (bvmul lt!60216 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!39699 (or (= lt!60216 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!60216 #b0000000000000000000000000000000000000000000000000000000000001000) lt!60216)))))

(assert (=> b!39699 (= lt!60216 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))))))

(assert (= (and d!11692 res!33767) b!39698))

(assert (= (and b!39698 res!33766) b!39699))

(declare-fun m!60575 () Bool)

(assert (=> d!11692 m!60575))

(assert (=> d!11692 m!60229))

(assert (=> b!39486 d!11692))

(declare-fun d!11694 () Bool)

(assert (=> d!11694 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3111 () Bool)

(assert (= bs!3111 d!11694))

(assert (=> bs!3111 m!60207))

(declare-fun m!60577 () Bool)

(assert (=> bs!3111 m!60577))

(assert (=> b!39475 d!11694))

(declare-fun d!11696 () Bool)

(assert (=> d!11696 (= (head!308 (byteArrayBitContentToList!0 (_2!1994 lt!59894) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!586 (byteArrayBitContentToList!0 (_2!1994 lt!59894) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!39475 d!11696))

(declare-fun d!11698 () Bool)

(declare-fun c!2703 () Bool)

(assert (=> d!11698 (= c!2703 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26156 () List!471)

(assert (=> d!11698 (= (byteArrayBitContentToList!0 (_2!1994 lt!59894) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!26156)))

(declare-fun b!39704 () Bool)

(assert (=> b!39704 (= e!26156 Nil!468)))

(declare-fun b!39705 () Bool)

(assert (=> b!39705 (= e!26156 (Cons!467 (not (= (bvand ((_ sign_extend 24) (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1994 lt!59894) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11698 c!2703) b!39704))

(assert (= (and d!11698 (not c!2703)) b!39705))

(assert (=> b!39705 m!60207))

(assert (=> b!39705 m!60577))

(declare-fun m!60579 () Bool)

(assert (=> b!39705 m!60579))

(assert (=> b!39475 d!11698))

(declare-fun d!11700 () Bool)

(assert (=> d!11700 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_1!1995 lt!59899)))) ((_ sign_extend 32) (currentByte!2635 (_1!1995 lt!59899))) ((_ sign_extend 32) (currentBit!2630 (_1!1995 lt!59899))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 (_1!1995 lt!59899)))) ((_ sign_extend 32) (currentByte!2635 (_1!1995 lt!59899))) ((_ sign_extend 32) (currentBit!2630 (_1!1995 lt!59899)))) (bvsub to!314 i!635)))))

(declare-fun bs!3112 () Bool)

(assert (= bs!3112 d!11700))

(declare-fun m!60581 () Bool)

(assert (=> bs!3112 m!60581))

(assert (=> b!39485 d!11700))

(declare-fun d!11702 () Bool)

(declare-fun res!33776 () Bool)

(declare-fun e!26161 () Bool)

(assert (=> d!11702 (=> (not res!33776) (not e!26161))))

(assert (=> d!11702 (= res!33776 (= (size!895 (buf!1223 thiss!1379)) (size!895 (buf!1223 (_2!1994 lt!59889)))))))

(assert (=> d!11702 (= (isPrefixOf!0 thiss!1379 (_2!1994 lt!59889)) e!26161)))

(declare-fun b!39712 () Bool)

(declare-fun res!33774 () Bool)

(assert (=> b!39712 (=> (not res!33774) (not e!26161))))

(assert (=> b!39712 (= res!33774 (bvsle (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)) (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889)))))))

(declare-fun b!39713 () Bool)

(declare-fun e!26162 () Bool)

(assert (=> b!39713 (= e!26161 e!26162)))

(declare-fun res!33775 () Bool)

(assert (=> b!39713 (=> res!33775 e!26162)))

(assert (=> b!39713 (= res!33775 (= (size!895 (buf!1223 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39714 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1985 array!1985 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39714 (= e!26162 (arrayBitRangesEq!0 (buf!1223 thiss!1379) (buf!1223 (_2!1994 lt!59889)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379))))))

(assert (= (and d!11702 res!33776) b!39712))

(assert (= (and b!39712 res!33774) b!39713))

(assert (= (and b!39713 (not res!33775)) b!39714))

(assert (=> b!39712 m!60241))

(assert (=> b!39712 m!60227))

(assert (=> b!39714 m!60241))

(assert (=> b!39714 m!60241))

(declare-fun m!60583 () Bool)

(assert (=> b!39714 m!60583))

(assert (=> b!39487 d!11702))

(declare-fun d!11704 () Bool)

(assert (=> d!11704 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!59898) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889)))) lt!59898))))

(declare-fun bs!3113 () Bool)

(assert (= bs!3113 d!11704))

(assert (=> bs!3113 m!60575))

(assert (=> b!39487 d!11704))

(declare-fun d!11706 () Bool)

(declare-fun e!26165 () Bool)

(assert (=> d!11706 e!26165))

(declare-fun res!33779 () Bool)

(assert (=> d!11706 (=> (not res!33779) (not e!26165))))

(assert (=> d!11706 (= res!33779 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!60223 () Unit!2811)

(declare-fun choose!27 (BitStream!1540 BitStream!1540 (_ BitVec 64) (_ BitVec 64)) Unit!2811)

(assert (=> d!11706 (= lt!60223 (choose!27 thiss!1379 (_2!1994 lt!59889) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11706 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11706 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1994 lt!59889) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!60223)))

(declare-fun b!39717 () Bool)

(assert (=> b!39717 (= e!26165 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11706 res!33779) b!39717))

(declare-fun m!60585 () Bool)

(assert (=> d!11706 m!60585))

(declare-fun m!60587 () Bool)

(assert (=> b!39717 m!60587))

(assert (=> b!39487 d!11706))

(declare-fun b!39826 () Bool)

(declare-fun e!26218 () Bool)

(declare-fun e!26219 () Bool)

(assert (=> b!39826 (= e!26218 e!26219)))

(declare-fun res!33852 () Bool)

(assert (=> b!39826 (=> (not res!33852) (not e!26219))))

(declare-fun lt!60437 () tuple2!3818)

(declare-fun lt!60435 () Bool)

(declare-fun lt!60434 () tuple2!3814)

(assert (=> b!39826 (= res!33852 (and (= (_2!1996 lt!60437) lt!60435) (= (_1!1996 lt!60437) (_2!1994 lt!60434))))))

(declare-fun readerFrom!0 (BitStream!1540 (_ BitVec 32) (_ BitVec 32)) BitStream!1540)

(assert (=> b!39826 (= lt!60437 (readBitPure!0 (readerFrom!0 (_2!1994 lt!60434) (currentBit!2630 thiss!1379) (currentByte!2635 thiss!1379))))))

(declare-fun b!39827 () Bool)

(declare-fun e!26220 () Bool)

(declare-fun e!26221 () Bool)

(assert (=> b!39827 (= e!26220 e!26221)))

(declare-fun res!33854 () Bool)

(assert (=> b!39827 (=> (not res!33854) (not e!26221))))

(declare-fun lt!60433 () tuple2!3818)

(declare-fun lt!60440 () tuple2!3814)

(declare-fun lt!60430 () (_ BitVec 8))

(assert (=> b!39827 (= res!33854 (and (= (_2!1996 lt!60433) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!60430)) #b00000000000000000000000000000000))) (= (_1!1996 lt!60433) (_2!1994 lt!60440))))))

(declare-datatypes ((tuple2!3836 0))(
  ( (tuple2!3837 (_1!2005 array!1985) (_2!2005 BitStream!1540)) )
))
(declare-fun lt!60436 () tuple2!3836)

(declare-fun lt!60431 () BitStream!1540)

(declare-fun readBits!0 (BitStream!1540 (_ BitVec 64)) tuple2!3836)

(assert (=> b!39827 (= lt!60436 (readBits!0 lt!60431 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39827 (= lt!60433 (readBitPure!0 lt!60431))))

(assert (=> b!39827 (= lt!60431 (readerFrom!0 (_2!1994 lt!60440) (currentBit!2630 thiss!1379) (currentByte!2635 thiss!1379)))))

(declare-fun b!39828 () Bool)

(declare-fun res!33857 () Bool)

(assert (=> b!39828 (=> (not res!33857) (not e!26218))))

(assert (=> b!39828 (= res!33857 (isPrefixOf!0 thiss!1379 (_2!1994 lt!60434)))))

(declare-fun b!39829 () Bool)

(assert (=> b!39829 (= e!26221 (= (bitIndex!0 (size!895 (buf!1223 (_1!1996 lt!60433))) (currentByte!2635 (_1!1996 lt!60433)) (currentBit!2630 (_1!1996 lt!60433))) (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60440))) (currentByte!2635 (_2!1994 lt!60440)) (currentBit!2630 (_2!1994 lt!60440)))))))

(declare-fun b!39830 () Bool)

(declare-fun res!33859 () Bool)

(assert (=> b!39830 (=> (not res!33859) (not e!26218))))

(assert (=> b!39830 (= res!33859 (= (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60434))) (currentByte!2635 (_2!1994 lt!60434)) (currentBit!2630 (_2!1994 lt!60434))) (bvadd (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!39831 () Bool)

(declare-fun res!33855 () Bool)

(assert (=> b!39831 (=> (not res!33855) (not e!26220))))

(declare-fun lt!60439 () (_ BitVec 64))

(declare-fun lt!60438 () (_ BitVec 64))

(assert (=> b!39831 (= res!33855 (= (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60440))) (currentByte!2635 (_2!1994 lt!60440)) (currentBit!2630 (_2!1994 lt!60440))) (bvadd lt!60438 lt!60439)))))

(assert (=> b!39831 (or (not (= (bvand lt!60438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!60438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!60438 lt!60439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39831 (= lt!60439 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!39831 (= lt!60438 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(declare-fun d!11708 () Bool)

(assert (=> d!11708 e!26220))

(declare-fun res!33856 () Bool)

(assert (=> d!11708 (=> (not res!33856) (not e!26220))))

(assert (=> d!11708 (= res!33856 (= (size!895 (buf!1223 (_2!1994 lt!60440))) (size!895 (buf!1223 thiss!1379))))))

(declare-fun lt!60441 () array!1985)

(assert (=> d!11708 (= lt!60430 (select (arr!1391 lt!60441) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11708 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!895 lt!60441)))))

(assert (=> d!11708 (= lt!60441 (array!1986 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!60432 () tuple2!3814)

(assert (=> d!11708 (= lt!60440 (tuple2!3815 (_1!1994 lt!60432) (_2!1994 lt!60432)))))

(assert (=> d!11708 (= lt!60432 lt!60434)))

(assert (=> d!11708 e!26218))

(declare-fun res!33853 () Bool)

(assert (=> d!11708 (=> (not res!33853) (not e!26218))))

(assert (=> d!11708 (= res!33853 (= (size!895 (buf!1223 thiss!1379)) (size!895 (buf!1223 (_2!1994 lt!60434)))))))

(declare-fun appendBit!0 (BitStream!1540 Bool) tuple2!3814)

(assert (=> d!11708 (= lt!60434 (appendBit!0 thiss!1379 lt!60435))))

(assert (=> d!11708 (= lt!60435 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11708 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11708 (= (appendBitFromByte!0 thiss!1379 (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!60440)))

(declare-fun b!39832 () Bool)

(assert (=> b!39832 (= e!26219 (= (bitIndex!0 (size!895 (buf!1223 (_1!1996 lt!60437))) (currentByte!2635 (_1!1996 lt!60437)) (currentBit!2630 (_1!1996 lt!60437))) (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60434))) (currentByte!2635 (_2!1994 lt!60434)) (currentBit!2630 (_2!1994 lt!60434)))))))

(declare-fun b!39833 () Bool)

(declare-fun res!33858 () Bool)

(assert (=> b!39833 (=> (not res!33858) (not e!26220))))

(assert (=> b!39833 (= res!33858 (isPrefixOf!0 thiss!1379 (_2!1994 lt!60440)))))

(assert (= (and d!11708 res!33853) b!39830))

(assert (= (and b!39830 res!33859) b!39828))

(assert (= (and b!39828 res!33857) b!39826))

(assert (= (and b!39826 res!33852) b!39832))

(assert (= (and d!11708 res!33856) b!39831))

(assert (= (and b!39831 res!33855) b!39833))

(assert (= (and b!39833 res!33858) b!39827))

(assert (= (and b!39827 res!33854) b!39829))

(declare-fun m!60753 () Bool)

(assert (=> b!39830 m!60753))

(assert (=> b!39830 m!60241))

(declare-fun m!60755 () Bool)

(assert (=> b!39831 m!60755))

(assert (=> b!39831 m!60241))

(declare-fun m!60757 () Bool)

(assert (=> b!39827 m!60757))

(declare-fun m!60759 () Bool)

(assert (=> b!39827 m!60759))

(declare-fun m!60761 () Bool)

(assert (=> b!39827 m!60761))

(declare-fun m!60763 () Bool)

(assert (=> b!39833 m!60763))

(declare-fun m!60765 () Bool)

(assert (=> b!39829 m!60765))

(assert (=> b!39829 m!60755))

(declare-fun m!60767 () Bool)

(assert (=> b!39828 m!60767))

(declare-fun m!60769 () Bool)

(assert (=> b!39832 m!60769))

(assert (=> b!39832 m!60753))

(declare-fun m!60771 () Bool)

(assert (=> d!11708 m!60771))

(declare-fun m!60773 () Bool)

(assert (=> d!11708 m!60773))

(assert (=> d!11708 m!60577))

(declare-fun m!60775 () Bool)

(assert (=> b!39826 m!60775))

(assert (=> b!39826 m!60775))

(declare-fun m!60777 () Bool)

(assert (=> b!39826 m!60777))

(assert (=> b!39487 d!11708))

(declare-fun d!11756 () Bool)

(declare-datatypes ((tuple2!3842 0))(
  ( (tuple2!3843 (_1!2008 Bool) (_2!2008 BitStream!1540)) )
))
(declare-fun lt!60444 () tuple2!3842)

(declare-fun readBit!0 (BitStream!1540) tuple2!3842)

(assert (=> d!11756 (= lt!60444 (readBit!0 (_1!1995 lt!59899)))))

(assert (=> d!11756 (= (readBitPure!0 (_1!1995 lt!59899)) (tuple2!3819 (_2!2008 lt!60444) (_1!2008 lt!60444)))))

(declare-fun bs!3120 () Bool)

(assert (= bs!3120 d!11756))

(declare-fun m!60779 () Bool)

(assert (=> bs!3120 m!60779))

(assert (=> b!39476 d!11756))

(declare-fun d!11758 () Bool)

(assert (=> d!11758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 thiss!1379))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 thiss!1379))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3121 () Bool)

(assert (= bs!3121 d!11758))

(declare-fun m!60781 () Bool)

(assert (=> bs!3121 m!60781))

(assert (=> b!39488 d!11758))

(declare-fun d!11760 () Bool)

(assert (=> d!11760 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60447 () Unit!2811)

(declare-fun choose!9 (BitStream!1540 array!1985 (_ BitVec 64) BitStream!1540) Unit!2811)

(assert (=> d!11760 (= lt!60447 (choose!9 thiss!1379 (buf!1223 (_2!1994 lt!59889)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1541 (buf!1223 (_2!1994 lt!59889)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379))))))

(assert (=> d!11760 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1223 (_2!1994 lt!59889)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!60447)))

(declare-fun bs!3122 () Bool)

(assert (= bs!3122 d!11760))

(assert (=> bs!3122 m!60263))

(declare-fun m!60783 () Bool)

(assert (=> bs!3122 m!60783))

(assert (=> b!39477 d!11760))

(declare-fun d!11762 () Bool)

(assert (=> d!11762 (isPrefixOf!0 thiss!1379 (_2!1994 lt!59894))))

(declare-fun lt!60450 () Unit!2811)

(declare-fun choose!30 (BitStream!1540 BitStream!1540 BitStream!1540) Unit!2811)

(assert (=> d!11762 (= lt!60450 (choose!30 thiss!1379 (_2!1994 lt!59889) (_2!1994 lt!59894)))))

(assert (=> d!11762 (isPrefixOf!0 thiss!1379 (_2!1994 lt!59889))))

(assert (=> d!11762 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1994 lt!59889) (_2!1994 lt!59894)) lt!60450)))

(declare-fun bs!3123 () Bool)

(assert (= bs!3123 d!11762))

(assert (=> bs!3123 m!60261))

(declare-fun m!60785 () Bool)

(assert (=> bs!3123 m!60785))

(assert (=> bs!3123 m!60211))

(assert (=> b!39477 d!11762))

(declare-fun b!39844 () Bool)

(declare-fun e!26227 () Unit!2811)

(declare-fun Unit!2818 () Unit!2811)

(assert (=> b!39844 (= e!26227 Unit!2818)))

(declare-fun b!39845 () Bool)

(declare-fun lt!60509 () Unit!2811)

(assert (=> b!39845 (= e!26227 lt!60509)))

(declare-fun lt!60492 () (_ BitVec 64))

(assert (=> b!39845 (= lt!60492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60499 () (_ BitVec 64))

(assert (=> b!39845 (= lt!60499 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1985 array!1985 (_ BitVec 64) (_ BitVec 64)) Unit!2811)

(assert (=> b!39845 (= lt!60509 (arrayBitRangesEqSymmetric!0 (buf!1223 thiss!1379) (buf!1223 (_2!1994 lt!59889)) lt!60492 lt!60499))))

(assert (=> b!39845 (arrayBitRangesEq!0 (buf!1223 (_2!1994 lt!59889)) (buf!1223 thiss!1379) lt!60492 lt!60499)))

(declare-fun d!11764 () Bool)

(declare-fun e!26226 () Bool)

(assert (=> d!11764 e!26226))

(declare-fun res!33866 () Bool)

(assert (=> d!11764 (=> (not res!33866) (not e!26226))))

(declare-fun lt!60495 () tuple2!3816)

(assert (=> d!11764 (= res!33866 (isPrefixOf!0 (_1!1995 lt!60495) (_2!1995 lt!60495)))))

(declare-fun lt!60498 () BitStream!1540)

(assert (=> d!11764 (= lt!60495 (tuple2!3817 lt!60498 (_2!1994 lt!59889)))))

(declare-fun lt!60493 () Unit!2811)

(declare-fun lt!60503 () Unit!2811)

(assert (=> d!11764 (= lt!60493 lt!60503)))

(assert (=> d!11764 (isPrefixOf!0 lt!60498 (_2!1994 lt!59889))))

(assert (=> d!11764 (= lt!60503 (lemmaIsPrefixTransitive!0 lt!60498 (_2!1994 lt!59889) (_2!1994 lt!59889)))))

(declare-fun lt!60500 () Unit!2811)

(declare-fun lt!60510 () Unit!2811)

(assert (=> d!11764 (= lt!60500 lt!60510)))

(assert (=> d!11764 (isPrefixOf!0 lt!60498 (_2!1994 lt!59889))))

(assert (=> d!11764 (= lt!60510 (lemmaIsPrefixTransitive!0 lt!60498 thiss!1379 (_2!1994 lt!59889)))))

(declare-fun lt!60506 () Unit!2811)

(assert (=> d!11764 (= lt!60506 e!26227)))

(declare-fun c!2723 () Bool)

(assert (=> d!11764 (= c!2723 (not (= (size!895 (buf!1223 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!60508 () Unit!2811)

(declare-fun lt!60504 () Unit!2811)

(assert (=> d!11764 (= lt!60508 lt!60504)))

(assert (=> d!11764 (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!59889))))

(assert (=> d!11764 (= lt!60504 (lemmaIsPrefixRefl!0 (_2!1994 lt!59889)))))

(declare-fun lt!60502 () Unit!2811)

(declare-fun lt!60494 () Unit!2811)

(assert (=> d!11764 (= lt!60502 lt!60494)))

(assert (=> d!11764 (= lt!60494 (lemmaIsPrefixRefl!0 (_2!1994 lt!59889)))))

(declare-fun lt!60496 () Unit!2811)

(declare-fun lt!60505 () Unit!2811)

(assert (=> d!11764 (= lt!60496 lt!60505)))

(assert (=> d!11764 (isPrefixOf!0 lt!60498 lt!60498)))

(assert (=> d!11764 (= lt!60505 (lemmaIsPrefixRefl!0 lt!60498))))

(declare-fun lt!60507 () Unit!2811)

(declare-fun lt!60501 () Unit!2811)

(assert (=> d!11764 (= lt!60507 lt!60501)))

(assert (=> d!11764 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11764 (= lt!60501 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11764 (= lt!60498 (BitStream!1541 (buf!1223 (_2!1994 lt!59889)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(assert (=> d!11764 (isPrefixOf!0 thiss!1379 (_2!1994 lt!59889))))

(assert (=> d!11764 (= (reader!0 thiss!1379 (_2!1994 lt!59889)) lt!60495)))

(declare-fun b!39846 () Bool)

(declare-fun res!33867 () Bool)

(assert (=> b!39846 (=> (not res!33867) (not e!26226))))

(assert (=> b!39846 (= res!33867 (isPrefixOf!0 (_2!1995 lt!60495) (_2!1994 lt!59889)))))

(declare-fun b!39847 () Bool)

(declare-fun lt!60497 () (_ BitVec 64))

(declare-fun lt!60491 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1540 (_ BitVec 64)) BitStream!1540)

(assert (=> b!39847 (= e!26226 (= (_1!1995 lt!60495) (withMovedBitIndex!0 (_2!1995 lt!60495) (bvsub lt!60497 lt!60491))))))

(assert (=> b!39847 (or (= (bvand lt!60497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60491 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60497 lt!60491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39847 (= lt!60491 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))))))

(assert (=> b!39847 (= lt!60497 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(declare-fun b!39848 () Bool)

(declare-fun res!33868 () Bool)

(assert (=> b!39848 (=> (not res!33868) (not e!26226))))

(assert (=> b!39848 (= res!33868 (isPrefixOf!0 (_1!1995 lt!60495) thiss!1379))))

(assert (= (and d!11764 c!2723) b!39845))

(assert (= (and d!11764 (not c!2723)) b!39844))

(assert (= (and d!11764 res!33866) b!39848))

(assert (= (and b!39848 res!33868) b!39846))

(assert (= (and b!39846 res!33867) b!39847))

(declare-fun m!60787 () Bool)

(assert (=> b!39847 m!60787))

(assert (=> b!39847 m!60227))

(assert (=> b!39847 m!60241))

(declare-fun m!60789 () Bool)

(assert (=> d!11764 m!60789))

(declare-fun m!60791 () Bool)

(assert (=> d!11764 m!60791))

(assert (=> d!11764 m!60239))

(assert (=> d!11764 m!60211))

(assert (=> d!11764 m!60237))

(declare-fun m!60793 () Bool)

(assert (=> d!11764 m!60793))

(declare-fun m!60795 () Bool)

(assert (=> d!11764 m!60795))

(declare-fun m!60797 () Bool)

(assert (=> d!11764 m!60797))

(declare-fun m!60799 () Bool)

(assert (=> d!11764 m!60799))

(declare-fun m!60801 () Bool)

(assert (=> d!11764 m!60801))

(declare-fun m!60803 () Bool)

(assert (=> d!11764 m!60803))

(declare-fun m!60805 () Bool)

(assert (=> b!39846 m!60805))

(assert (=> b!39845 m!60241))

(declare-fun m!60807 () Bool)

(assert (=> b!39845 m!60807))

(declare-fun m!60809 () Bool)

(assert (=> b!39845 m!60809))

(declare-fun m!60811 () Bool)

(assert (=> b!39848 m!60811))

(assert (=> b!39477 d!11764))

(declare-fun d!11766 () Bool)

(declare-fun res!33871 () Bool)

(declare-fun e!26228 () Bool)

(assert (=> d!11766 (=> (not res!33871) (not e!26228))))

(assert (=> d!11766 (= res!33871 (= (size!895 (buf!1223 (_2!1994 lt!59889))) (size!895 (buf!1223 (_2!1994 lt!59894)))))))

(assert (=> d!11766 (= (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!59894)) e!26228)))

(declare-fun b!39849 () Bool)

(declare-fun res!33869 () Bool)

(assert (=> b!39849 (=> (not res!33869) (not e!26228))))

(assert (=> b!39849 (= res!33869 (bvsle (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))) (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59894))) (currentByte!2635 (_2!1994 lt!59894)) (currentBit!2630 (_2!1994 lt!59894)))))))

(declare-fun b!39850 () Bool)

(declare-fun e!26229 () Bool)

(assert (=> b!39850 (= e!26228 e!26229)))

(declare-fun res!33870 () Bool)

(assert (=> b!39850 (=> res!33870 e!26229)))

(assert (=> b!39850 (= res!33870 (= (size!895 (buf!1223 (_2!1994 lt!59889))) #b00000000000000000000000000000000))))

(declare-fun b!39851 () Bool)

(assert (=> b!39851 (= e!26229 (arrayBitRangesEq!0 (buf!1223 (_2!1994 lt!59889)) (buf!1223 (_2!1994 lt!59894)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889)))))))

(assert (= (and d!11766 res!33871) b!39849))

(assert (= (and b!39849 res!33869) b!39850))

(assert (= (and b!39850 (not res!33870)) b!39851))

(assert (=> b!39849 m!60227))

(assert (=> b!39849 m!60235))

(assert (=> b!39851 m!60227))

(assert (=> b!39851 m!60227))

(declare-fun m!60813 () Bool)

(assert (=> b!39851 m!60813))

(assert (=> b!39477 d!11766))

(declare-fun d!11768 () Bool)

(assert (=> d!11768 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3124 () Bool)

(assert (= bs!3124 d!11768))

(declare-fun m!60815 () Bool)

(assert (=> bs!3124 m!60815))

(assert (=> b!39477 d!11768))

(declare-fun d!11770 () Bool)

(declare-fun res!33874 () Bool)

(declare-fun e!26230 () Bool)

(assert (=> d!11770 (=> (not res!33874) (not e!26230))))

(assert (=> d!11770 (= res!33874 (= (size!895 (buf!1223 thiss!1379)) (size!895 (buf!1223 (_2!1994 lt!59894)))))))

(assert (=> d!11770 (= (isPrefixOf!0 thiss!1379 (_2!1994 lt!59894)) e!26230)))

(declare-fun b!39852 () Bool)

(declare-fun res!33872 () Bool)

(assert (=> b!39852 (=> (not res!33872) (not e!26230))))

(assert (=> b!39852 (= res!33872 (bvsle (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)) (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59894))) (currentByte!2635 (_2!1994 lt!59894)) (currentBit!2630 (_2!1994 lt!59894)))))))

(declare-fun b!39853 () Bool)

(declare-fun e!26231 () Bool)

(assert (=> b!39853 (= e!26230 e!26231)))

(declare-fun res!33873 () Bool)

(assert (=> b!39853 (=> res!33873 e!26231)))

(assert (=> b!39853 (= res!33873 (= (size!895 (buf!1223 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39854 () Bool)

(assert (=> b!39854 (= e!26231 (arrayBitRangesEq!0 (buf!1223 thiss!1379) (buf!1223 (_2!1994 lt!59894)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379))))))

(assert (= (and d!11770 res!33874) b!39852))

(assert (= (and b!39852 res!33872) b!39853))

(assert (= (and b!39853 (not res!33873)) b!39854))

(assert (=> b!39852 m!60241))

(assert (=> b!39852 m!60235))

(assert (=> b!39854 m!60241))

(assert (=> b!39854 m!60241))

(declare-fun m!60817 () Bool)

(assert (=> b!39854 m!60817))

(assert (=> b!39477 d!11770))

(declare-fun b!39935 () Bool)

(declare-fun e!26268 () tuple2!3814)

(declare-fun Unit!2821 () Unit!2811)

(assert (=> b!39935 (= e!26268 (tuple2!3815 Unit!2821 (_2!1994 lt!59889)))))

(assert (=> b!39935 (= (size!895 (buf!1223 (_2!1994 lt!59889))) (size!895 (buf!1223 (_2!1994 lt!59889))))))

(declare-fun lt!60892 () Unit!2811)

(declare-fun Unit!2822 () Unit!2811)

(assert (=> b!39935 (= lt!60892 Unit!2822)))

(declare-fun call!489 () tuple2!3816)

(declare-fun checkByteArrayBitContent!0 (BitStream!1540 array!1985 array!1985 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39935 (checkByteArrayBitContent!0 (_2!1994 lt!59889) srcBuffer!2 (_1!2005 (readBits!0 (_1!1995 call!489) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!39936 () Bool)

(declare-fun res!33939 () Bool)

(declare-fun e!26269 () Bool)

(assert (=> b!39936 (=> (not res!33939) (not e!26269))))

(declare-fun lt!60850 () tuple2!3814)

(assert (=> b!39936 (= res!33939 (= (size!895 (buf!1223 (_2!1994 lt!59889))) (size!895 (buf!1223 (_2!1994 lt!60850)))))))

(declare-fun b!39937 () Bool)

(declare-fun res!33935 () Bool)

(assert (=> b!39937 (=> (not res!33935) (not e!26269))))

(assert (=> b!39937 (= res!33935 (= (size!895 (buf!1223 (_2!1994 lt!60850))) (size!895 (buf!1223 (_2!1994 lt!59889)))))))

(declare-fun d!11772 () Bool)

(assert (=> d!11772 e!26269))

(declare-fun res!33937 () Bool)

(assert (=> d!11772 (=> (not res!33937) (not e!26269))))

(declare-fun lt!60867 () (_ BitVec 64))

(assert (=> d!11772 (= res!33937 (= (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60850))) (currentByte!2635 (_2!1994 lt!60850)) (currentBit!2630 (_2!1994 lt!60850))) (bvsub lt!60867 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11772 (or (= (bvand lt!60867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60867 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!60871 () (_ BitVec 64))

(assert (=> d!11772 (= lt!60867 (bvadd lt!60871 to!314))))

(assert (=> d!11772 (or (not (= (bvand lt!60871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!60871 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!60871 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11772 (= lt!60871 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))))))

(assert (=> d!11772 (= lt!60850 e!26268)))

(declare-fun c!2734 () Bool)

(assert (=> d!11772 (= c!2734 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!60866 () Unit!2811)

(declare-fun lt!60855 () Unit!2811)

(assert (=> d!11772 (= lt!60866 lt!60855)))

(assert (=> d!11772 (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!59889))))

(assert (=> d!11772 (= lt!60855 (lemmaIsPrefixRefl!0 (_2!1994 lt!59889)))))

(declare-fun lt!60872 () (_ BitVec 64))

(assert (=> d!11772 (= lt!60872 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))))))

(assert (=> d!11772 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11772 (= (appendBitsMSBFirstLoop!0 (_2!1994 lt!59889) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!60850)))

(declare-fun b!39938 () Bool)

(declare-fun lt!60883 () tuple2!3814)

(declare-fun Unit!2823 () Unit!2811)

(assert (=> b!39938 (= e!26268 (tuple2!3815 Unit!2823 (_2!1994 lt!60883)))))

(declare-fun lt!60873 () tuple2!3814)

(assert (=> b!39938 (= lt!60873 (appendBitFromByte!0 (_2!1994 lt!59889) (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!60870 () (_ BitVec 64))

(assert (=> b!39938 (= lt!60870 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60887 () (_ BitVec 64))

(assert (=> b!39938 (= lt!60887 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60860 () Unit!2811)

(assert (=> b!39938 (= lt!60860 (validateOffsetBitsIneqLemma!0 (_2!1994 lt!59889) (_2!1994 lt!60873) lt!60870 lt!60887))))

(assert (=> b!39938 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!60873)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!60873))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!60873))) (bvsub lt!60870 lt!60887))))

(declare-fun lt!60869 () Unit!2811)

(assert (=> b!39938 (= lt!60869 lt!60860)))

(declare-fun lt!60877 () tuple2!3816)

(assert (=> b!39938 (= lt!60877 (reader!0 (_2!1994 lt!59889) (_2!1994 lt!60873)))))

(declare-fun lt!60881 () (_ BitVec 64))

(assert (=> b!39938 (= lt!60881 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60875 () Unit!2811)

(assert (=> b!39938 (= lt!60875 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1994 lt!59889) (buf!1223 (_2!1994 lt!60873)) lt!60881))))

(assert (=> b!39938 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!60873)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!60881)))

(declare-fun lt!60891 () Unit!2811)

(assert (=> b!39938 (= lt!60891 lt!60875)))

(assert (=> b!39938 (= (head!308 (byteArrayBitContentToList!0 (_2!1994 lt!60873) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!308 (bitStreamReadBitsIntoList!0 (_2!1994 lt!60873) (_1!1995 lt!60877) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60878 () Unit!2811)

(declare-fun Unit!2824 () Unit!2811)

(assert (=> b!39938 (= lt!60878 Unit!2824)))

(assert (=> b!39938 (= lt!60883 (appendBitsMSBFirstLoop!0 (_2!1994 lt!60873) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!60857 () Unit!2811)

(assert (=> b!39938 (= lt!60857 (lemmaIsPrefixTransitive!0 (_2!1994 lt!59889) (_2!1994 lt!60873) (_2!1994 lt!60883)))))

(assert (=> b!39938 (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!60883))))

(declare-fun lt!60879 () Unit!2811)

(assert (=> b!39938 (= lt!60879 lt!60857)))

(assert (=> b!39938 (= (size!895 (buf!1223 (_2!1994 lt!60883))) (size!895 (buf!1223 (_2!1994 lt!59889))))))

(declare-fun lt!60863 () Unit!2811)

(declare-fun Unit!2825 () Unit!2811)

(assert (=> b!39938 (= lt!60863 Unit!2825)))

(assert (=> b!39938 (= (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60883))) (currentByte!2635 (_2!1994 lt!60883)) (currentBit!2630 (_2!1994 lt!60883))) (bvsub (bvadd (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60874 () Unit!2811)

(declare-fun Unit!2826 () Unit!2811)

(assert (=> b!39938 (= lt!60874 Unit!2826)))

(assert (=> b!39938 (= (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60883))) (currentByte!2635 (_2!1994 lt!60883)) (currentBit!2630 (_2!1994 lt!60883))) (bvsub (bvsub (bvadd (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60873))) (currentByte!2635 (_2!1994 lt!60873)) (currentBit!2630 (_2!1994 lt!60873))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60853 () Unit!2811)

(declare-fun Unit!2827 () Unit!2811)

(assert (=> b!39938 (= lt!60853 Unit!2827)))

(declare-fun lt!60890 () tuple2!3816)

(assert (=> b!39938 (= lt!60890 (reader!0 (_2!1994 lt!59889) (_2!1994 lt!60883)))))

(declare-fun lt!60858 () (_ BitVec 64))

(assert (=> b!39938 (= lt!60858 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60864 () Unit!2811)

(assert (=> b!39938 (= lt!60864 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1994 lt!59889) (buf!1223 (_2!1994 lt!60883)) lt!60858))))

(assert (=> b!39938 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!60883)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!60858)))

(declare-fun lt!60876 () Unit!2811)

(assert (=> b!39938 (= lt!60876 lt!60864)))

(declare-fun lt!60893 () tuple2!3816)

(assert (=> b!39938 (= lt!60893 call!489)))

(declare-fun lt!60882 () (_ BitVec 64))

(assert (=> b!39938 (= lt!60882 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60859 () Unit!2811)

(assert (=> b!39938 (= lt!60859 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1994 lt!60873) (buf!1223 (_2!1994 lt!60883)) lt!60882))))

(assert (=> b!39938 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!60883)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!60873))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!60873))) lt!60882)))

(declare-fun lt!60885 () Unit!2811)

(assert (=> b!39938 (= lt!60885 lt!60859)))

(declare-fun lt!60880 () List!471)

(assert (=> b!39938 (= lt!60880 (byteArrayBitContentToList!0 (_2!1994 lt!60883) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!60884 () List!471)

(assert (=> b!39938 (= lt!60884 (byteArrayBitContentToList!0 (_2!1994 lt!60883) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60862 () List!471)

(assert (=> b!39938 (= lt!60862 (bitStreamReadBitsIntoList!0 (_2!1994 lt!60883) (_1!1995 lt!60890) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!60856 () List!471)

(assert (=> b!39938 (= lt!60856 (bitStreamReadBitsIntoList!0 (_2!1994 lt!60883) (_1!1995 lt!60893) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60889 () (_ BitVec 64))

(assert (=> b!39938 (= lt!60889 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60888 () Unit!2811)

(assert (=> b!39938 (= lt!60888 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1994 lt!60883) (_2!1994 lt!60883) (_1!1995 lt!60890) (_1!1995 lt!60893) lt!60889 lt!60862))))

(assert (=> b!39938 (= (bitStreamReadBitsIntoList!0 (_2!1994 lt!60883) (_1!1995 lt!60893) (bvsub lt!60889 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!188 lt!60862))))

(declare-fun lt!60865 () Unit!2811)

(assert (=> b!39938 (= lt!60865 lt!60888)))

(declare-fun lt!60854 () Unit!2811)

(assert (=> b!39938 (= lt!60854 (arrayBitRangesEqImpliesEq!0 (buf!1223 (_2!1994 lt!60873)) (buf!1223 (_2!1994 lt!60883)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!60872 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!60873))) (currentByte!2635 (_2!1994 lt!60873)) (currentBit!2630 (_2!1994 lt!60873)))))))

(assert (=> b!39938 (= (bitAt!0 (buf!1223 (_2!1994 lt!60873)) lt!60872) (bitAt!0 (buf!1223 (_2!1994 lt!60883)) lt!60872))))

(declare-fun lt!60852 () Unit!2811)

(assert (=> b!39938 (= lt!60852 lt!60854)))

(declare-fun b!39939 () Bool)

(declare-fun res!33940 () Bool)

(assert (=> b!39939 (=> (not res!33940) (not e!26269))))

(assert (=> b!39939 (= res!33940 (invariant!0 (currentBit!2630 (_2!1994 lt!60850)) (currentByte!2635 (_2!1994 lt!60850)) (size!895 (buf!1223 (_2!1994 lt!60850)))))))

(declare-fun b!39940 () Bool)

(declare-fun lt!60861 () tuple2!3816)

(assert (=> b!39940 (= e!26269 (= (bitStreamReadBitsIntoList!0 (_2!1994 lt!60850) (_1!1995 lt!60861) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1994 lt!60850) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!39940 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39940 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!60868 () Unit!2811)

(declare-fun lt!60886 () Unit!2811)

(assert (=> b!39940 (= lt!60868 lt!60886)))

(declare-fun lt!60851 () (_ BitVec 64))

(assert (=> b!39940 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!60850)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!60851)))

(assert (=> b!39940 (= lt!60886 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1994 lt!59889) (buf!1223 (_2!1994 lt!60850)) lt!60851))))

(declare-fun e!26270 () Bool)

(assert (=> b!39940 e!26270))

(declare-fun res!33938 () Bool)

(assert (=> b!39940 (=> (not res!33938) (not e!26270))))

(assert (=> b!39940 (= res!33938 (and (= (size!895 (buf!1223 (_2!1994 lt!59889))) (size!895 (buf!1223 (_2!1994 lt!60850)))) (bvsge lt!60851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39940 (= lt!60851 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!39940 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39940 (= lt!60861 (reader!0 (_2!1994 lt!59889) (_2!1994 lt!60850)))))

(declare-fun b!39941 () Bool)

(declare-fun res!33936 () Bool)

(assert (=> b!39941 (=> (not res!33936) (not e!26269))))

(assert (=> b!39941 (= res!33936 (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!60850)))))

(declare-fun bm!486 () Bool)

(assert (=> bm!486 (= call!489 (reader!0 (ite c!2734 (_2!1994 lt!60873) (_2!1994 lt!59889)) (ite c!2734 (_2!1994 lt!60883) (_2!1994 lt!59889))))))

(declare-fun b!39942 () Bool)

(assert (=> b!39942 (= e!26270 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59889)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!60851))))

(assert (= (and d!11772 c!2734) b!39938))

(assert (= (and d!11772 (not c!2734)) b!39935))

(assert (= (or b!39938 b!39935) bm!486))

(assert (= (and d!11772 res!33937) b!39939))

(assert (= (and b!39939 res!33940) b!39936))

(assert (= (and b!39936 res!33939) b!39941))

(assert (= (and b!39941 res!33936) b!39937))

(assert (= (and b!39937 res!33935) b!39940))

(assert (= (and b!39940 res!33938) b!39942))

(declare-fun m!60939 () Bool)

(assert (=> b!39938 m!60939))

(declare-fun m!60941 () Bool)

(assert (=> b!39938 m!60941))

(declare-fun m!60943 () Bool)

(assert (=> b!39938 m!60943))

(declare-fun m!60945 () Bool)

(assert (=> b!39938 m!60945))

(declare-fun m!60947 () Bool)

(assert (=> b!39938 m!60947))

(assert (=> b!39938 m!60227))

(declare-fun m!60949 () Bool)

(assert (=> b!39938 m!60949))

(declare-fun m!60951 () Bool)

(assert (=> b!39938 m!60951))

(declare-fun m!60953 () Bool)

(assert (=> b!39938 m!60953))

(declare-fun m!60955 () Bool)

(assert (=> b!39938 m!60955))

(declare-fun m!60957 () Bool)

(assert (=> b!39938 m!60957))

(declare-fun m!60959 () Bool)

(assert (=> b!39938 m!60959))

(declare-fun m!60961 () Bool)

(assert (=> b!39938 m!60961))

(assert (=> b!39938 m!60959))

(declare-fun m!60963 () Bool)

(assert (=> b!39938 m!60963))

(declare-fun m!60965 () Bool)

(assert (=> b!39938 m!60965))

(declare-fun m!60967 () Bool)

(assert (=> b!39938 m!60967))

(declare-fun m!60969 () Bool)

(assert (=> b!39938 m!60969))

(declare-fun m!60971 () Bool)

(assert (=> b!39938 m!60971))

(declare-fun m!60973 () Bool)

(assert (=> b!39938 m!60973))

(declare-fun m!60975 () Bool)

(assert (=> b!39938 m!60975))

(assert (=> b!39938 m!60943))

(declare-fun m!60977 () Bool)

(assert (=> b!39938 m!60977))

(declare-fun m!60979 () Bool)

(assert (=> b!39938 m!60979))

(declare-fun m!60981 () Bool)

(assert (=> b!39938 m!60981))

(declare-fun m!60983 () Bool)

(assert (=> b!39938 m!60983))

(declare-fun m!60985 () Bool)

(assert (=> b!39938 m!60985))

(assert (=> b!39938 m!60967))

(declare-fun m!60987 () Bool)

(assert (=> b!39938 m!60987))

(declare-fun m!60989 () Bool)

(assert (=> b!39938 m!60989))

(assert (=> b!39938 m!60953))

(declare-fun m!60991 () Bool)

(assert (=> b!39938 m!60991))

(declare-fun m!60993 () Bool)

(assert (=> b!39938 m!60993))

(declare-fun m!60995 () Bool)

(assert (=> b!39938 m!60995))

(declare-fun m!60997 () Bool)

(assert (=> b!39938 m!60997))

(declare-fun m!60999 () Bool)

(assert (=> b!39938 m!60999))

(declare-fun m!61001 () Bool)

(assert (=> bm!486 m!61001))

(declare-fun m!61003 () Bool)

(assert (=> b!39935 m!61003))

(declare-fun m!61005 () Bool)

(assert (=> b!39935 m!61005))

(declare-fun m!61007 () Bool)

(assert (=> b!39940 m!61007))

(declare-fun m!61009 () Bool)

(assert (=> b!39940 m!61009))

(declare-fun m!61011 () Bool)

(assert (=> b!39940 m!61011))

(declare-fun m!61013 () Bool)

(assert (=> b!39940 m!61013))

(declare-fun m!61015 () Bool)

(assert (=> b!39940 m!61015))

(declare-fun m!61017 () Bool)

(assert (=> b!39941 m!61017))

(declare-fun m!61019 () Bool)

(assert (=> b!39942 m!61019))

(declare-fun m!61021 () Bool)

(assert (=> d!11772 m!61021))

(assert (=> d!11772 m!60227))

(assert (=> d!11772 m!60789))

(assert (=> d!11772 m!60803))

(declare-fun m!61023 () Bool)

(assert (=> b!39939 m!61023))

(assert (=> b!39477 d!11772))

(declare-fun d!11814 () Bool)

(assert (=> d!11814 (= (invariant!0 (currentBit!2630 (_2!1994 lt!59889)) (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59889)))) (and (bvsge (currentBit!2630 (_2!1994 lt!59889)) #b00000000000000000000000000000000) (bvslt (currentBit!2630 (_2!1994 lt!59889)) #b00000000000000000000000000001000) (bvsge (currentByte!2635 (_2!1994 lt!59889)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59889)))) (and (= (currentBit!2630 (_2!1994 lt!59889)) #b00000000000000000000000000000000) (= (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59889))))))))))

(assert (=> b!39490 d!11814))

(declare-fun d!11816 () Bool)

(assert (=> d!11816 (= (tail!188 lt!59896) (t!1221 lt!59896))))

(assert (=> b!39479 d!11816))

(declare-fun d!11818 () Bool)

(declare-fun e!26278 () Bool)

(assert (=> d!11818 e!26278))

(declare-fun res!33952 () Bool)

(assert (=> d!11818 (=> (not res!33952) (not e!26278))))

(declare-fun lt!60946 () (_ BitVec 64))

(assert (=> d!11818 (= res!33952 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60946 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!60946) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11818 (= lt!60946 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60945 () Unit!2811)

(declare-fun choose!42 (BitStream!1540 BitStream!1540 BitStream!1540 BitStream!1540 (_ BitVec 64) List!471) Unit!2811)

(assert (=> d!11818 (= lt!60945 (choose!42 (_2!1994 lt!59894) (_2!1994 lt!59894) (_1!1995 lt!59899) (_1!1995 lt!59900) (bvsub to!314 i!635) lt!59896))))

(assert (=> d!11818 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11818 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1994 lt!59894) (_2!1994 lt!59894) (_1!1995 lt!59899) (_1!1995 lt!59900) (bvsub to!314 i!635) lt!59896) lt!60945)))

(declare-fun b!39956 () Bool)

(assert (=> b!39956 (= e!26278 (= (bitStreamReadBitsIntoList!0 (_2!1994 lt!59894) (_1!1995 lt!59900) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!188 lt!59896)))))

(assert (= (and d!11818 res!33952) b!39956))

(declare-fun m!61115 () Bool)

(assert (=> d!11818 m!61115))

(declare-fun m!61117 () Bool)

(assert (=> b!39956 m!61117))

(assert (=> b!39956 m!60177))

(assert (=> b!39479 d!11818))

(declare-fun d!11828 () Bool)

(assert (=> d!11828 (= (invariant!0 (currentBit!2630 (_2!1994 lt!59894)) (currentByte!2635 (_2!1994 lt!59894)) (size!895 (buf!1223 (_2!1994 lt!59894)))) (and (bvsge (currentBit!2630 (_2!1994 lt!59894)) #b00000000000000000000000000000000) (bvslt (currentBit!2630 (_2!1994 lt!59894)) #b00000000000000000000000000001000) (bvsge (currentByte!2635 (_2!1994 lt!59894)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2635 (_2!1994 lt!59894)) (size!895 (buf!1223 (_2!1994 lt!59894)))) (and (= (currentBit!2630 (_2!1994 lt!59894)) #b00000000000000000000000000000000) (= (currentByte!2635 (_2!1994 lt!59894)) (size!895 (buf!1223 (_2!1994 lt!59894))))))))))

(assert (=> b!39468 d!11828))

(declare-fun d!11830 () Bool)

(assert (=> d!11830 (= (array_inv!823 (buf!1223 thiss!1379)) (bvsge (size!895 (buf!1223 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!39489 d!11830))

(declare-fun d!11834 () Bool)

(declare-fun e!26279 () Bool)

(assert (=> d!11834 e!26279))

(declare-fun res!33954 () Bool)

(assert (=> d!11834 (=> (not res!33954) (not e!26279))))

(declare-fun lt!60949 () (_ BitVec 64))

(declare-fun lt!60951 () (_ BitVec 64))

(declare-fun lt!60950 () (_ BitVec 64))

(assert (=> d!11834 (= res!33954 (= lt!60950 (bvsub lt!60949 lt!60951)))))

(assert (=> d!11834 (or (= (bvand lt!60949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60951 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60949 lt!60951) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11834 (= lt!60951 (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59894))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59894)))))))

(declare-fun lt!60952 () (_ BitVec 64))

(declare-fun lt!60947 () (_ BitVec 64))

(assert (=> d!11834 (= lt!60949 (bvmul lt!60952 lt!60947))))

(assert (=> d!11834 (or (= lt!60952 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!60947 (bvsdiv (bvmul lt!60952 lt!60947) lt!60952)))))

(assert (=> d!11834 (= lt!60947 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11834 (= lt!60952 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))))))

(assert (=> d!11834 (= lt!60950 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59894))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59894)))))))

(assert (=> d!11834 (invariant!0 (currentBit!2630 (_2!1994 lt!59894)) (currentByte!2635 (_2!1994 lt!59894)) (size!895 (buf!1223 (_2!1994 lt!59894))))))

(assert (=> d!11834 (= (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59894))) (currentByte!2635 (_2!1994 lt!59894)) (currentBit!2630 (_2!1994 lt!59894))) lt!60950)))

(declare-fun b!39957 () Bool)

(declare-fun res!33953 () Bool)

(assert (=> b!39957 (=> (not res!33953) (not e!26279))))

(assert (=> b!39957 (= res!33953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!60950))))

(declare-fun b!39958 () Bool)

(declare-fun lt!60948 () (_ BitVec 64))

(assert (=> b!39958 (= e!26279 (bvsle lt!60950 (bvmul lt!60948 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!39958 (or (= lt!60948 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!60948 #b0000000000000000000000000000000000000000000000000000000000001000) lt!60948)))))

(assert (=> b!39958 (= lt!60948 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))))))

(assert (= (and d!11834 res!33954) b!39957))

(assert (= (and b!39957 res!33953) b!39958))

(declare-fun m!61121 () Bool)

(assert (=> d!11834 m!61121))

(assert (=> d!11834 m!60181))

(assert (=> b!39470 d!11834))

(declare-fun d!11838 () Bool)

(declare-fun size!898 (List!471) Int)

(assert (=> d!11838 (= (length!197 lt!59896) (size!898 lt!59896))))

(declare-fun bs!3138 () Bool)

(assert (= bs!3138 d!11838))

(declare-fun m!61123 () Bool)

(assert (=> bs!3138 m!61123))

(assert (=> b!39480 d!11838))

(declare-fun d!11840 () Bool)

(assert (=> d!11840 (= (array_inv!823 srcBuffer!2) (bvsge (size!895 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7934 d!11840))

(declare-fun d!11842 () Bool)

(assert (=> d!11842 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2630 thiss!1379) (currentByte!2635 thiss!1379) (size!895 (buf!1223 thiss!1379))))))

(declare-fun bs!3139 () Bool)

(assert (= bs!3139 d!11842))

(declare-fun m!61125 () Bool)

(assert (=> bs!3139 m!61125))

(assert (=> start!7934 d!11842))

(declare-fun b!39959 () Bool)

(declare-fun e!26281 () Unit!2811)

(declare-fun Unit!2830 () Unit!2811)

(assert (=> b!39959 (= e!26281 Unit!2830)))

(declare-fun b!39960 () Bool)

(declare-fun lt!60971 () Unit!2811)

(assert (=> b!39960 (= e!26281 lt!60971)))

(declare-fun lt!60954 () (_ BitVec 64))

(assert (=> b!39960 (= lt!60954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60961 () (_ BitVec 64))

(assert (=> b!39960 (= lt!60961 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(assert (=> b!39960 (= lt!60971 (arrayBitRangesEqSymmetric!0 (buf!1223 thiss!1379) (buf!1223 (_2!1994 lt!59894)) lt!60954 lt!60961))))

(assert (=> b!39960 (arrayBitRangesEq!0 (buf!1223 (_2!1994 lt!59894)) (buf!1223 thiss!1379) lt!60954 lt!60961)))

(declare-fun d!11844 () Bool)

(declare-fun e!26280 () Bool)

(assert (=> d!11844 e!26280))

(declare-fun res!33955 () Bool)

(assert (=> d!11844 (=> (not res!33955) (not e!26280))))

(declare-fun lt!60957 () tuple2!3816)

(assert (=> d!11844 (= res!33955 (isPrefixOf!0 (_1!1995 lt!60957) (_2!1995 lt!60957)))))

(declare-fun lt!60960 () BitStream!1540)

(assert (=> d!11844 (= lt!60957 (tuple2!3817 lt!60960 (_2!1994 lt!59894)))))

(declare-fun lt!60955 () Unit!2811)

(declare-fun lt!60965 () Unit!2811)

(assert (=> d!11844 (= lt!60955 lt!60965)))

(assert (=> d!11844 (isPrefixOf!0 lt!60960 (_2!1994 lt!59894))))

(assert (=> d!11844 (= lt!60965 (lemmaIsPrefixTransitive!0 lt!60960 (_2!1994 lt!59894) (_2!1994 lt!59894)))))

(declare-fun lt!60962 () Unit!2811)

(declare-fun lt!60972 () Unit!2811)

(assert (=> d!11844 (= lt!60962 lt!60972)))

(assert (=> d!11844 (isPrefixOf!0 lt!60960 (_2!1994 lt!59894))))

(assert (=> d!11844 (= lt!60972 (lemmaIsPrefixTransitive!0 lt!60960 thiss!1379 (_2!1994 lt!59894)))))

(declare-fun lt!60968 () Unit!2811)

(assert (=> d!11844 (= lt!60968 e!26281)))

(declare-fun c!2736 () Bool)

(assert (=> d!11844 (= c!2736 (not (= (size!895 (buf!1223 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!60970 () Unit!2811)

(declare-fun lt!60966 () Unit!2811)

(assert (=> d!11844 (= lt!60970 lt!60966)))

(assert (=> d!11844 (isPrefixOf!0 (_2!1994 lt!59894) (_2!1994 lt!59894))))

(assert (=> d!11844 (= lt!60966 (lemmaIsPrefixRefl!0 (_2!1994 lt!59894)))))

(declare-fun lt!60964 () Unit!2811)

(declare-fun lt!60956 () Unit!2811)

(assert (=> d!11844 (= lt!60964 lt!60956)))

(assert (=> d!11844 (= lt!60956 (lemmaIsPrefixRefl!0 (_2!1994 lt!59894)))))

(declare-fun lt!60958 () Unit!2811)

(declare-fun lt!60967 () Unit!2811)

(assert (=> d!11844 (= lt!60958 lt!60967)))

(assert (=> d!11844 (isPrefixOf!0 lt!60960 lt!60960)))

(assert (=> d!11844 (= lt!60967 (lemmaIsPrefixRefl!0 lt!60960))))

(declare-fun lt!60969 () Unit!2811)

(declare-fun lt!60963 () Unit!2811)

(assert (=> d!11844 (= lt!60969 lt!60963)))

(assert (=> d!11844 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11844 (= lt!60963 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11844 (= lt!60960 (BitStream!1541 (buf!1223 (_2!1994 lt!59894)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(assert (=> d!11844 (isPrefixOf!0 thiss!1379 (_2!1994 lt!59894))))

(assert (=> d!11844 (= (reader!0 thiss!1379 (_2!1994 lt!59894)) lt!60957)))

(declare-fun b!39961 () Bool)

(declare-fun res!33956 () Bool)

(assert (=> b!39961 (=> (not res!33956) (not e!26280))))

(assert (=> b!39961 (= res!33956 (isPrefixOf!0 (_2!1995 lt!60957) (_2!1994 lt!59894)))))

(declare-fun lt!60959 () (_ BitVec 64))

(declare-fun b!39962 () Bool)

(declare-fun lt!60953 () (_ BitVec 64))

(assert (=> b!39962 (= e!26280 (= (_1!1995 lt!60957) (withMovedBitIndex!0 (_2!1995 lt!60957) (bvsub lt!60959 lt!60953))))))

(assert (=> b!39962 (or (= (bvand lt!60959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60959 lt!60953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39962 (= lt!60953 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59894))) (currentByte!2635 (_2!1994 lt!59894)) (currentBit!2630 (_2!1994 lt!59894))))))

(assert (=> b!39962 (= lt!60959 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)))))

(declare-fun b!39963 () Bool)

(declare-fun res!33957 () Bool)

(assert (=> b!39963 (=> (not res!33957) (not e!26280))))

(assert (=> b!39963 (= res!33957 (isPrefixOf!0 (_1!1995 lt!60957) thiss!1379))))

(assert (= (and d!11844 c!2736) b!39960))

(assert (= (and d!11844 (not c!2736)) b!39959))

(assert (= (and d!11844 res!33955) b!39963))

(assert (= (and b!39963 res!33957) b!39961))

(assert (= (and b!39961 res!33956) b!39962))

(declare-fun m!61127 () Bool)

(assert (=> b!39962 m!61127))

(assert (=> b!39962 m!60235))

(assert (=> b!39962 m!60241))

(declare-fun m!61129 () Bool)

(assert (=> d!11844 m!61129))

(declare-fun m!61131 () Bool)

(assert (=> d!11844 m!61131))

(assert (=> d!11844 m!60239))

(assert (=> d!11844 m!60261))

(assert (=> d!11844 m!60237))

(declare-fun m!61133 () Bool)

(assert (=> d!11844 m!61133))

(declare-fun m!61135 () Bool)

(assert (=> d!11844 m!61135))

(declare-fun m!61137 () Bool)

(assert (=> d!11844 m!61137))

(declare-fun m!61139 () Bool)

(assert (=> d!11844 m!61139))

(declare-fun m!61141 () Bool)

(assert (=> d!11844 m!61141))

(declare-fun m!61143 () Bool)

(assert (=> d!11844 m!61143))

(declare-fun m!61145 () Bool)

(assert (=> b!39961 m!61145))

(assert (=> b!39960 m!60241))

(declare-fun m!61147 () Bool)

(assert (=> b!39960 m!61147))

(declare-fun m!61149 () Bool)

(assert (=> b!39960 m!61149))

(declare-fun m!61151 () Bool)

(assert (=> b!39963 m!61151))

(assert (=> b!39469 d!11844))

(declare-fun d!11846 () Bool)

(assert (=> d!11846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3140 () Bool)

(assert (= bs!3140 d!11846))

(declare-fun m!61153 () Bool)

(assert (=> bs!3140 m!61153))

(assert (=> b!39469 d!11846))

(declare-datatypes ((tuple2!3846 0))(
  ( (tuple2!3847 (_1!2010 List!471) (_2!2010 BitStream!1540)) )
))
(declare-fun e!26290 () tuple2!3846)

(declare-fun lt!60987 () (_ BitVec 64))

(declare-fun b!39976 () Bool)

(declare-fun lt!60986 () tuple2!3842)

(assert (=> b!39976 (= e!26290 (tuple2!3847 (Cons!467 (_1!2008 lt!60986) (bitStreamReadBitsIntoList!0 (_2!1994 lt!59894) (_2!2008 lt!60986) (bvsub (bvsub to!314 i!635) lt!60987))) (_2!2008 lt!60986)))))

(assert (=> b!39976 (= lt!60986 (readBit!0 (_1!1995 lt!59899)))))

(assert (=> b!39976 (= lt!60987 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39977 () Bool)

(declare-fun e!26289 () Bool)

(declare-fun lt!60985 () List!471)

(declare-fun isEmpty!113 (List!471) Bool)

(assert (=> b!39977 (= e!26289 (isEmpty!113 lt!60985))))

(declare-fun b!39975 () Bool)

(assert (=> b!39975 (= e!26290 (tuple2!3847 Nil!468 (_1!1995 lt!59899)))))

(declare-fun b!39978 () Bool)

(assert (=> b!39978 (= e!26289 (> (length!197 lt!60985) 0))))

(declare-fun d!11848 () Bool)

(assert (=> d!11848 e!26289))

(declare-fun c!2741 () Bool)

(assert (=> d!11848 (= c!2741 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11848 (= lt!60985 (_1!2010 e!26290))))

(declare-fun c!2742 () Bool)

(assert (=> d!11848 (= c!2742 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11848 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11848 (= (bitStreamReadBitsIntoList!0 (_2!1994 lt!59894) (_1!1995 lt!59899) (bvsub to!314 i!635)) lt!60985)))

(assert (= (and d!11848 c!2742) b!39975))

(assert (= (and d!11848 (not c!2742)) b!39976))

(assert (= (and d!11848 c!2741) b!39977))

(assert (= (and d!11848 (not c!2741)) b!39978))

(declare-fun m!61161 () Bool)

(assert (=> b!39976 m!61161))

(assert (=> b!39976 m!60779))

(declare-fun m!61163 () Bool)

(assert (=> b!39977 m!61163))

(declare-fun m!61165 () Bool)

(assert (=> b!39978 m!61165))

(assert (=> b!39469 d!11848))

(declare-fun d!11852 () Bool)

(assert (=> d!11852 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!59898)))

(declare-fun lt!60988 () Unit!2811)

(assert (=> d!11852 (= lt!60988 (choose!9 (_2!1994 lt!59889) (buf!1223 (_2!1994 lt!59894)) lt!59898 (BitStream!1541 (buf!1223 (_2!1994 lt!59894)) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889)))))))

(assert (=> d!11852 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1994 lt!59889) (buf!1223 (_2!1994 lt!59894)) lt!59898) lt!60988)))

(declare-fun bs!3142 () Bool)

(assert (= bs!3142 d!11852))

(assert (=> bs!3142 m!60199))

(declare-fun m!61167 () Bool)

(assert (=> bs!3142 m!61167))

(assert (=> b!39469 d!11852))

(declare-fun d!11854 () Bool)

(assert (=> d!11854 (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!60989 () Unit!2811)

(assert (=> d!11854 (= lt!60989 (choose!9 thiss!1379 (buf!1223 (_2!1994 lt!59894)) (bvsub to!314 i!635) (BitStream!1541 (buf!1223 (_2!1994 lt!59894)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379))))))

(assert (=> d!11854 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1223 (_2!1994 lt!59894)) (bvsub to!314 i!635)) lt!60989)))

(declare-fun bs!3143 () Bool)

(assert (= bs!3143 d!11854))

(assert (=> bs!3143 m!60197))

(declare-fun m!61169 () Bool)

(assert (=> bs!3143 m!61169))

(assert (=> b!39469 d!11854))

(declare-fun b!39979 () Bool)

(declare-fun e!26292 () Unit!2811)

(declare-fun Unit!2838 () Unit!2811)

(assert (=> b!39979 (= e!26292 Unit!2838)))

(declare-fun b!39980 () Bool)

(declare-fun lt!61008 () Unit!2811)

(assert (=> b!39980 (= e!26292 lt!61008)))

(declare-fun lt!60991 () (_ BitVec 64))

(assert (=> b!39980 (= lt!60991 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60998 () (_ BitVec 64))

(assert (=> b!39980 (= lt!60998 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))))))

(assert (=> b!39980 (= lt!61008 (arrayBitRangesEqSymmetric!0 (buf!1223 (_2!1994 lt!59889)) (buf!1223 (_2!1994 lt!59894)) lt!60991 lt!60998))))

(assert (=> b!39980 (arrayBitRangesEq!0 (buf!1223 (_2!1994 lt!59894)) (buf!1223 (_2!1994 lt!59889)) lt!60991 lt!60998)))

(declare-fun d!11856 () Bool)

(declare-fun e!26291 () Bool)

(assert (=> d!11856 e!26291))

(declare-fun res!33961 () Bool)

(assert (=> d!11856 (=> (not res!33961) (not e!26291))))

(declare-fun lt!60994 () tuple2!3816)

(assert (=> d!11856 (= res!33961 (isPrefixOf!0 (_1!1995 lt!60994) (_2!1995 lt!60994)))))

(declare-fun lt!60997 () BitStream!1540)

(assert (=> d!11856 (= lt!60994 (tuple2!3817 lt!60997 (_2!1994 lt!59894)))))

(declare-fun lt!60992 () Unit!2811)

(declare-fun lt!61002 () Unit!2811)

(assert (=> d!11856 (= lt!60992 lt!61002)))

(assert (=> d!11856 (isPrefixOf!0 lt!60997 (_2!1994 lt!59894))))

(assert (=> d!11856 (= lt!61002 (lemmaIsPrefixTransitive!0 lt!60997 (_2!1994 lt!59894) (_2!1994 lt!59894)))))

(declare-fun lt!60999 () Unit!2811)

(declare-fun lt!61009 () Unit!2811)

(assert (=> d!11856 (= lt!60999 lt!61009)))

(assert (=> d!11856 (isPrefixOf!0 lt!60997 (_2!1994 lt!59894))))

(assert (=> d!11856 (= lt!61009 (lemmaIsPrefixTransitive!0 lt!60997 (_2!1994 lt!59889) (_2!1994 lt!59894)))))

(declare-fun lt!61005 () Unit!2811)

(assert (=> d!11856 (= lt!61005 e!26292)))

(declare-fun c!2743 () Bool)

(assert (=> d!11856 (= c!2743 (not (= (size!895 (buf!1223 (_2!1994 lt!59889))) #b00000000000000000000000000000000)))))

(declare-fun lt!61007 () Unit!2811)

(declare-fun lt!61003 () Unit!2811)

(assert (=> d!11856 (= lt!61007 lt!61003)))

(assert (=> d!11856 (isPrefixOf!0 (_2!1994 lt!59894) (_2!1994 lt!59894))))

(assert (=> d!11856 (= lt!61003 (lemmaIsPrefixRefl!0 (_2!1994 lt!59894)))))

(declare-fun lt!61001 () Unit!2811)

(declare-fun lt!60993 () Unit!2811)

(assert (=> d!11856 (= lt!61001 lt!60993)))

(assert (=> d!11856 (= lt!60993 (lemmaIsPrefixRefl!0 (_2!1994 lt!59894)))))

(declare-fun lt!60995 () Unit!2811)

(declare-fun lt!61004 () Unit!2811)

(assert (=> d!11856 (= lt!60995 lt!61004)))

(assert (=> d!11856 (isPrefixOf!0 lt!60997 lt!60997)))

(assert (=> d!11856 (= lt!61004 (lemmaIsPrefixRefl!0 lt!60997))))

(declare-fun lt!61006 () Unit!2811)

(declare-fun lt!61000 () Unit!2811)

(assert (=> d!11856 (= lt!61006 lt!61000)))

(assert (=> d!11856 (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!59889))))

(assert (=> d!11856 (= lt!61000 (lemmaIsPrefixRefl!0 (_2!1994 lt!59889)))))

(assert (=> d!11856 (= lt!60997 (BitStream!1541 (buf!1223 (_2!1994 lt!59894)) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))))))

(assert (=> d!11856 (isPrefixOf!0 (_2!1994 lt!59889) (_2!1994 lt!59894))))

(assert (=> d!11856 (= (reader!0 (_2!1994 lt!59889) (_2!1994 lt!59894)) lt!60994)))

(declare-fun b!39981 () Bool)

(declare-fun res!33962 () Bool)

(assert (=> b!39981 (=> (not res!33962) (not e!26291))))

(assert (=> b!39981 (= res!33962 (isPrefixOf!0 (_2!1995 lt!60994) (_2!1994 lt!59894)))))

(declare-fun lt!60990 () (_ BitVec 64))

(declare-fun lt!60996 () (_ BitVec 64))

(declare-fun b!39982 () Bool)

(assert (=> b!39982 (= e!26291 (= (_1!1995 lt!60994) (withMovedBitIndex!0 (_2!1995 lt!60994) (bvsub lt!60996 lt!60990))))))

(assert (=> b!39982 (or (= (bvand lt!60996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60990 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60996 lt!60990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39982 (= lt!60990 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59894))) (currentByte!2635 (_2!1994 lt!59894)) (currentBit!2630 (_2!1994 lt!59894))))))

(assert (=> b!39982 (= lt!60996 (bitIndex!0 (size!895 (buf!1223 (_2!1994 lt!59889))) (currentByte!2635 (_2!1994 lt!59889)) (currentBit!2630 (_2!1994 lt!59889))))))

(declare-fun b!39983 () Bool)

(declare-fun res!33963 () Bool)

(assert (=> b!39983 (=> (not res!33963) (not e!26291))))

(assert (=> b!39983 (= res!33963 (isPrefixOf!0 (_1!1995 lt!60994) (_2!1994 lt!59889)))))

(assert (= (and d!11856 c!2743) b!39980))

(assert (= (and d!11856 (not c!2743)) b!39979))

(assert (= (and d!11856 res!33961) b!39983))

(assert (= (and b!39983 res!33963) b!39981))

(assert (= (and b!39981 res!33962) b!39982))

(declare-fun m!61171 () Bool)

(assert (=> b!39982 m!61171))

(assert (=> b!39982 m!60235))

(assert (=> b!39982 m!60227))

(assert (=> d!11856 m!61129))

(declare-fun m!61173 () Bool)

(assert (=> d!11856 m!61173))

(assert (=> d!11856 m!60803))

(assert (=> d!11856 m!60255))

(assert (=> d!11856 m!60789))

(declare-fun m!61175 () Bool)

(assert (=> d!11856 m!61175))

(declare-fun m!61177 () Bool)

(assert (=> d!11856 m!61177))

(declare-fun m!61179 () Bool)

(assert (=> d!11856 m!61179))

(declare-fun m!61181 () Bool)

(assert (=> d!11856 m!61181))

(declare-fun m!61183 () Bool)

(assert (=> d!11856 m!61183))

(assert (=> d!11856 m!61143))

(declare-fun m!61185 () Bool)

(assert (=> b!39981 m!61185))

(assert (=> b!39980 m!60227))

(declare-fun m!61187 () Bool)

(assert (=> b!39980 m!61187))

(declare-fun m!61189 () Bool)

(assert (=> b!39980 m!61189))

(declare-fun m!61191 () Bool)

(assert (=> b!39983 m!61191))

(assert (=> b!39469 d!11856))

(declare-fun d!11858 () Bool)

(assert (=> d!11858 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889))) lt!59898) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 (_2!1994 lt!59894)))) ((_ sign_extend 32) (currentByte!2635 (_2!1994 lt!59889))) ((_ sign_extend 32) (currentBit!2630 (_2!1994 lt!59889)))) lt!59898))))

(declare-fun bs!3144 () Bool)

(assert (= bs!3144 d!11858))

(declare-fun m!61193 () Bool)

(assert (=> bs!3144 m!61193))

(assert (=> b!39469 d!11858))

(declare-fun lt!61012 () (_ BitVec 64))

(declare-fun e!26294 () tuple2!3846)

(declare-fun b!39985 () Bool)

(declare-fun lt!61011 () tuple2!3842)

(assert (=> b!39985 (= e!26294 (tuple2!3847 (Cons!467 (_1!2008 lt!61011) (bitStreamReadBitsIntoList!0 (_2!1994 lt!59894) (_2!2008 lt!61011) (bvsub lt!59898 lt!61012))) (_2!2008 lt!61011)))))

(assert (=> b!39985 (= lt!61011 (readBit!0 (_1!1995 lt!59900)))))

(assert (=> b!39985 (= lt!61012 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39986 () Bool)

(declare-fun e!26293 () Bool)

(declare-fun lt!61010 () List!471)

(assert (=> b!39986 (= e!26293 (isEmpty!113 lt!61010))))

(declare-fun b!39984 () Bool)

(assert (=> b!39984 (= e!26294 (tuple2!3847 Nil!468 (_1!1995 lt!59900)))))

(declare-fun b!39987 () Bool)

(assert (=> b!39987 (= e!26293 (> (length!197 lt!61010) 0))))

(declare-fun d!11860 () Bool)

(assert (=> d!11860 e!26293))

(declare-fun c!2744 () Bool)

(assert (=> d!11860 (= c!2744 (= lt!59898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11860 (= lt!61010 (_1!2010 e!26294))))

(declare-fun c!2745 () Bool)

(assert (=> d!11860 (= c!2745 (= lt!59898 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11860 (bvsge lt!59898 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11860 (= (bitStreamReadBitsIntoList!0 (_2!1994 lt!59894) (_1!1995 lt!59900) lt!59898) lt!61010)))

(assert (= (and d!11860 c!2745) b!39984))

(assert (= (and d!11860 (not c!2745)) b!39985))

(assert (= (and d!11860 c!2744) b!39986))

(assert (= (and d!11860 (not c!2744)) b!39987))

(declare-fun m!61195 () Bool)

(assert (=> b!39985 m!61195))

(declare-fun m!61197 () Bool)

(assert (=> b!39985 m!61197))

(declare-fun m!61199 () Bool)

(assert (=> b!39986 m!61199))

(declare-fun m!61201 () Bool)

(assert (=> b!39987 m!61201))

(assert (=> b!39469 d!11860))

(declare-fun d!11862 () Bool)

(declare-fun res!33966 () Bool)

(declare-fun e!26295 () Bool)

(assert (=> d!11862 (=> (not res!33966) (not e!26295))))

(assert (=> d!11862 (= res!33966 (= (size!895 (buf!1223 thiss!1379)) (size!895 (buf!1223 thiss!1379))))))

(assert (=> d!11862 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!26295)))

(declare-fun b!39988 () Bool)

(declare-fun res!33964 () Bool)

(assert (=> b!39988 (=> (not res!33964) (not e!26295))))

(assert (=> b!39988 (= res!33964 (bvsle (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)) (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379))))))

(declare-fun b!39989 () Bool)

(declare-fun e!26296 () Bool)

(assert (=> b!39989 (= e!26295 e!26296)))

(declare-fun res!33965 () Bool)

(assert (=> b!39989 (=> res!33965 e!26296)))

(assert (=> b!39989 (= res!33965 (= (size!895 (buf!1223 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39990 () Bool)

(assert (=> b!39990 (= e!26296 (arrayBitRangesEq!0 (buf!1223 thiss!1379) (buf!1223 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379))))))

(assert (= (and d!11862 res!33966) b!39988))

(assert (= (and b!39988 res!33964) b!39989))

(assert (= (and b!39989 (not res!33965)) b!39990))

(assert (=> b!39988 m!60241))

(assert (=> b!39988 m!60241))

(assert (=> b!39990 m!60241))

(assert (=> b!39990 m!60241))

(declare-fun m!61203 () Bool)

(assert (=> b!39990 m!61203))

(assert (=> b!39482 d!11862))

(declare-fun d!11864 () Bool)

(assert (=> d!11864 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!61015 () Unit!2811)

(declare-fun choose!11 (BitStream!1540) Unit!2811)

(assert (=> d!11864 (= lt!61015 (choose!11 thiss!1379))))

(assert (=> d!11864 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!61015)))

(declare-fun bs!3146 () Bool)

(assert (= bs!3146 d!11864))

(assert (=> bs!3146 m!60237))

(declare-fun m!61205 () Bool)

(assert (=> bs!3146 m!61205))

(assert (=> b!39482 d!11864))

(declare-fun d!11866 () Bool)

(declare-fun e!26297 () Bool)

(assert (=> d!11866 e!26297))

(declare-fun res!33968 () Bool)

(assert (=> d!11866 (=> (not res!33968) (not e!26297))))

(declare-fun lt!61018 () (_ BitVec 64))

(declare-fun lt!61019 () (_ BitVec 64))

(declare-fun lt!61020 () (_ BitVec 64))

(assert (=> d!11866 (= res!33968 (= lt!61019 (bvsub lt!61018 lt!61020)))))

(assert (=> d!11866 (or (= (bvand lt!61018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!61020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!61018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!61018 lt!61020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11866 (= lt!61020 (remainingBits!0 ((_ sign_extend 32) (size!895 (buf!1223 thiss!1379))) ((_ sign_extend 32) (currentByte!2635 thiss!1379)) ((_ sign_extend 32) (currentBit!2630 thiss!1379))))))

(declare-fun lt!61021 () (_ BitVec 64))

(declare-fun lt!61016 () (_ BitVec 64))

(assert (=> d!11866 (= lt!61018 (bvmul lt!61021 lt!61016))))

(assert (=> d!11866 (or (= lt!61021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!61016 (bvsdiv (bvmul lt!61021 lt!61016) lt!61021)))))

(assert (=> d!11866 (= lt!61016 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11866 (= lt!61021 ((_ sign_extend 32) (size!895 (buf!1223 thiss!1379))))))

(assert (=> d!11866 (= lt!61019 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2635 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2630 thiss!1379))))))

(assert (=> d!11866 (invariant!0 (currentBit!2630 thiss!1379) (currentByte!2635 thiss!1379) (size!895 (buf!1223 thiss!1379)))))

(assert (=> d!11866 (= (bitIndex!0 (size!895 (buf!1223 thiss!1379)) (currentByte!2635 thiss!1379) (currentBit!2630 thiss!1379)) lt!61019)))

(declare-fun b!39991 () Bool)

(declare-fun res!33967 () Bool)

(assert (=> b!39991 (=> (not res!33967) (not e!26297))))

(assert (=> b!39991 (= res!33967 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!61019))))

(declare-fun b!39992 () Bool)

(declare-fun lt!61017 () (_ BitVec 64))

(assert (=> b!39992 (= e!26297 (bvsle lt!61019 (bvmul lt!61017 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!39992 (or (= lt!61017 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!61017 #b0000000000000000000000000000000000000000000000000000000000001000) lt!61017)))))

(assert (=> b!39992 (= lt!61017 ((_ sign_extend 32) (size!895 (buf!1223 thiss!1379))))))

(assert (= (and d!11866 res!33968) b!39991))

(assert (= (and b!39991 res!33967) b!39992))

(assert (=> d!11866 m!60781))

(assert (=> d!11866 m!61125))

(assert (=> b!39482 d!11866))

(declare-fun d!11868 () Bool)

(assert (=> d!11868 (= (bitAt!0 (buf!1223 (_1!1995 lt!59900)) lt!59897) (not (= (bvand ((_ sign_extend 24) (select (arr!1391 (buf!1223 (_1!1995 lt!59900))) ((_ extract 31 0) (bvsdiv lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3147 () Bool)

(assert (= bs!3147 d!11868))

(declare-fun m!61207 () Bool)

(assert (=> bs!3147 m!61207))

(declare-fun m!61209 () Bool)

(assert (=> bs!3147 m!61209))

(assert (=> b!39471 d!11868))

(declare-fun d!11870 () Bool)

(assert (=> d!11870 (= (bitAt!0 (buf!1223 (_1!1995 lt!59899)) lt!59897) (not (= (bvand ((_ sign_extend 24) (select (arr!1391 (buf!1223 (_1!1995 lt!59899))) ((_ extract 31 0) (bvsdiv lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3148 () Bool)

(assert (= bs!3148 d!11870))

(declare-fun m!61211 () Bool)

(assert (=> bs!3148 m!61211))

(assert (=> bs!3148 m!61209))

(assert (=> b!39471 d!11870))

(declare-fun d!11872 () Bool)

(assert (=> d!11872 (= (invariant!0 (currentBit!2630 (_2!1994 lt!59889)) (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59894)))) (and (bvsge (currentBit!2630 (_2!1994 lt!59889)) #b00000000000000000000000000000000) (bvslt (currentBit!2630 (_2!1994 lt!59889)) #b00000000000000000000000000001000) (bvsge (currentByte!2635 (_2!1994 lt!59889)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59894)))) (and (= (currentBit!2630 (_2!1994 lt!59889)) #b00000000000000000000000000000000) (= (currentByte!2635 (_2!1994 lt!59889)) (size!895 (buf!1223 (_2!1994 lt!59894))))))))))

(assert (=> b!39481 d!11872))

(declare-fun d!11874 () Bool)

(assert (=> d!11874 (= (bitAt!0 (buf!1223 (_2!1994 lt!59894)) lt!59897) (not (= (bvand ((_ sign_extend 24) (select (arr!1391 (buf!1223 (_2!1994 lt!59894))) ((_ extract 31 0) (bvsdiv lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3149 () Bool)

(assert (= bs!3149 d!11874))

(declare-fun m!61213 () Bool)

(assert (=> bs!3149 m!61213))

(assert (=> bs!3149 m!61209))

(assert (=> b!39483 d!11874))

(declare-fun d!11876 () Bool)

(assert (=> d!11876 (= (bitAt!0 (buf!1223 (_2!1994 lt!59889)) lt!59897) (bitAt!0 (buf!1223 (_2!1994 lt!59894)) lt!59897))))

(declare-fun lt!61024 () Unit!2811)

(declare-fun choose!31 (array!1985 array!1985 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2811)

(assert (=> d!11876 (= lt!61024 (choose!31 (buf!1223 (_2!1994 lt!59889)) (buf!1223 (_2!1994 lt!59894)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59897 lt!59901))))

(assert (=> d!11876 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!59901))))

(assert (=> d!11876 (= (arrayBitRangesEqImpliesEq!0 (buf!1223 (_2!1994 lt!59889)) (buf!1223 (_2!1994 lt!59894)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59897 lt!59901) lt!61024)))

(declare-fun bs!3150 () Bool)

(assert (= bs!3150 d!11876))

(assert (=> bs!3150 m!60201))

(assert (=> bs!3150 m!60213))

(declare-fun m!61215 () Bool)

(assert (=> bs!3150 m!61215))

(assert (=> b!39483 d!11876))

(declare-fun d!11878 () Bool)

(assert (=> d!11878 (= (bitAt!0 (buf!1223 (_2!1994 lt!59889)) lt!59897) (not (= (bvand ((_ sign_extend 24) (select (arr!1391 (buf!1223 (_2!1994 lt!59889))) ((_ extract 31 0) (bvsdiv lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59897 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3151 () Bool)

(assert (= bs!3151 d!11878))

(declare-fun m!61217 () Bool)

(assert (=> bs!3151 m!61217))

(assert (=> bs!3151 m!61209))

(assert (=> b!39472 d!11878))

(declare-fun d!11880 () Bool)

(assert (=> d!11880 (= (head!308 (byteArrayBitContentToList!0 (_2!1994 lt!59889) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!586 (byteArrayBitContentToList!0 (_2!1994 lt!59889) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!39474 d!11880))

(declare-fun d!11882 () Bool)

(declare-fun c!2746 () Bool)

(assert (=> d!11882 (= c!2746 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26298 () List!471)

(assert (=> d!11882 (= (byteArrayBitContentToList!0 (_2!1994 lt!59889) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!26298)))

(declare-fun b!39993 () Bool)

(assert (=> b!39993 (= e!26298 Nil!468)))

(declare-fun b!39994 () Bool)

(assert (=> b!39994 (= e!26298 (Cons!467 (not (= (bvand ((_ sign_extend 24) (select (arr!1391 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1994 lt!59889) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11882 c!2746) b!39993))

(assert (= (and d!11882 (not c!2746)) b!39994))

(assert (=> b!39994 m!60207))

(assert (=> b!39994 m!60577))

(declare-fun m!61219 () Bool)

(assert (=> b!39994 m!61219))

(assert (=> b!39474 d!11882))

(declare-fun d!11884 () Bool)

(assert (=> d!11884 (= (head!308 (bitStreamReadBitsIntoList!0 (_2!1994 lt!59889) (_1!1995 lt!59911) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!586 (bitStreamReadBitsIntoList!0 (_2!1994 lt!59889) (_1!1995 lt!59911) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!39474 d!11884))

(declare-fun lt!61026 () tuple2!3842)

(declare-fun lt!61027 () (_ BitVec 64))

(declare-fun b!39996 () Bool)

(declare-fun e!26300 () tuple2!3846)

(assert (=> b!39996 (= e!26300 (tuple2!3847 (Cons!467 (_1!2008 lt!61026) (bitStreamReadBitsIntoList!0 (_2!1994 lt!59889) (_2!2008 lt!61026) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!61027))) (_2!2008 lt!61026)))))

(assert (=> b!39996 (= lt!61026 (readBit!0 (_1!1995 lt!59911)))))

(assert (=> b!39996 (= lt!61027 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39997 () Bool)

(declare-fun e!26299 () Bool)

(declare-fun lt!61025 () List!471)

(assert (=> b!39997 (= e!26299 (isEmpty!113 lt!61025))))

(declare-fun b!39995 () Bool)

(assert (=> b!39995 (= e!26300 (tuple2!3847 Nil!468 (_1!1995 lt!59911)))))

(declare-fun b!39998 () Bool)

(assert (=> b!39998 (= e!26299 (> (length!197 lt!61025) 0))))

(declare-fun d!11886 () Bool)

(assert (=> d!11886 e!26299))

(declare-fun c!2747 () Bool)

(assert (=> d!11886 (= c!2747 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11886 (= lt!61025 (_1!2010 e!26300))))

(declare-fun c!2748 () Bool)

(assert (=> d!11886 (= c!2748 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11886 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11886 (= (bitStreamReadBitsIntoList!0 (_2!1994 lt!59889) (_1!1995 lt!59911) #b0000000000000000000000000000000000000000000000000000000000000001) lt!61025)))

(assert (= (and d!11886 c!2748) b!39995))

(assert (= (and d!11886 (not c!2748)) b!39996))

(assert (= (and d!11886 c!2747) b!39997))

(assert (= (and d!11886 (not c!2747)) b!39998))

(declare-fun m!61221 () Bool)

(assert (=> b!39996 m!61221))

(declare-fun m!61223 () Bool)

(assert (=> b!39996 m!61223))

(declare-fun m!61225 () Bool)

(assert (=> b!39997 m!61225))

(declare-fun m!61227 () Bool)

(assert (=> b!39998 m!61227))

(assert (=> b!39474 d!11886))

(declare-fun d!11888 () Bool)

(assert (=> d!11888 (= (head!308 lt!59896) (h!586 lt!59896))))

(assert (=> b!39484 d!11888))

(push 1)

(assert (not b!39826))

(assert (not d!11864))

(assert (not d!11704))

(assert (not d!11866))

(assert (not b!39848))

(assert (not b!39852))

(assert (not d!11842))

(assert (not d!11700))

(assert (not b!39978))

(assert (not b!39941))

(assert (not b!39705))

(assert (not b!39961))

(assert (not b!39940))

(assert (not b!39956))

(assert (not d!11758))

(assert (not b!39988))

(assert (not b!39976))

(assert (not d!11876))

(assert (not b!39977))

(assert (not b!39998))

(assert (not b!39831))

(assert (not b!39942))

(assert (not d!11834))

(assert (not b!39828))

(assert (not b!39982))

(assert (not b!39986))

(assert (not b!39849))

(assert (not b!39847))

(assert (not d!11762))

(assert (not b!39987))

(assert (not d!11852))

(assert (not b!39980))

(assert (not b!39832))

(assert (not d!11854))

(assert (not b!39990))

(assert (not b!39854))

(assert (not b!39962))

(assert (not b!39939))

(assert (not b!39845))

(assert (not b!39983))

(assert (not b!39960))

(assert (not d!11760))

(assert (not d!11858))

(assert (not b!39833))

(assert (not d!11856))

(assert (not b!39851))

(assert (not b!39827))

(assert (not bm!486))

(assert (not d!11818))

(assert (not d!11708))

(assert (not b!39994))

(assert (not b!39996))

(assert (not b!39985))

(assert (not d!11838))

(assert (not b!39712))

(assert (not d!11764))

(assert (not b!39846))

(assert (not b!39717))

(assert (not b!39829))

(assert (not b!39981))

(assert (not b!39714))

(assert (not d!11846))

(assert (not b!39830))

(assert (not b!39997))

(assert (not d!11768))

(assert (not b!39935))

(assert (not b!39963))

(assert (not d!11844))

(assert (not b!39938))

(assert (not d!11772))

(assert (not d!11756))

(assert (not d!11692))

(assert (not d!11706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

