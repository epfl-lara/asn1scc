; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7204 () Bool)

(assert start!7204)

(declare-fun b!34999 () Bool)

(declare-fun e!23149 () Bool)

(declare-fun e!23147 () Bool)

(assert (=> b!34999 (= e!23149 e!23147)))

(declare-fun res!29896 () Bool)

(assert (=> b!34999 (=> res!29896 e!23147)))

(declare-fun lt!52012 () Bool)

(declare-datatypes ((array!1894 0))(
  ( (array!1895 (arr!1323 (Array (_ BitVec 32) (_ BitVec 8))) (size!842 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1464 0))(
  ( (BitStream!1465 (buf!1170 array!1894) (currentByte!2549 (_ BitVec 32)) (currentBit!2544 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3506 0))(
  ( (tuple2!3507 (_1!1840 BitStream!1464) (_2!1840 BitStream!1464)) )
))
(declare-fun lt!52013 () tuple2!3506)

(declare-fun lt!52017 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1894 (_ BitVec 64)) Bool)

(assert (=> b!34999 (= res!29896 (not (= lt!52012 (bitAt!0 (buf!1170 (_1!1840 lt!52013)) lt!52017))))))

(declare-fun lt!51998 () tuple2!3506)

(assert (=> b!34999 (= lt!52012 (bitAt!0 (buf!1170 (_1!1840 lt!51998)) lt!52017))))

(declare-fun b!35000 () Bool)

(declare-fun e!23154 () Bool)

(declare-fun thiss!1379 () BitStream!1464)

(declare-fun array_inv!785 (array!1894) Bool)

(assert (=> b!35000 (= e!23154 (array_inv!785 (buf!1170 thiss!1379)))))

(declare-fun b!35001 () Bool)

(declare-fun e!23159 () Bool)

(assert (=> b!35001 (= e!23147 e!23159)))

(declare-fun res!29909 () Bool)

(assert (=> b!35001 (=> res!29909 e!23159)))

(declare-fun srcBuffer!2 () array!1894)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((Unit!2587 0))(
  ( (Unit!2588) )
))
(declare-datatypes ((tuple2!3508 0))(
  ( (tuple2!3509 (_1!1841 Unit!2587) (_2!1841 BitStream!1464)) )
))
(declare-fun lt!52006 () tuple2!3508)

(declare-fun lt!52002 () Bool)

(declare-datatypes ((List!433 0))(
  ( (Nil!430) (Cons!429 (h!548 Bool) (t!1183 List!433)) )
))
(declare-fun head!270 (List!433) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1464 array!1894 (_ BitVec 64) (_ BitVec 64)) List!433)

(assert (=> b!35001 (= res!29909 (not (= (head!270 (byteArrayBitContentToList!0 (_2!1841 lt!52006) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!52002)))))

(assert (=> b!35001 (= lt!52002 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!35002 () Bool)

(declare-fun e!23155 () Bool)

(declare-fun e!23150 () Bool)

(assert (=> b!35002 (= e!23155 e!23150)))

(declare-fun res!29907 () Bool)

(assert (=> b!35002 (=> res!29907 e!23150)))

(assert (=> b!35002 (= res!29907 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!52003 () List!433)

(declare-fun lt!52008 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1464 BitStream!1464 (_ BitVec 64)) List!433)

(assert (=> b!35002 (= lt!52003 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52006) (_1!1840 lt!52013) lt!52008))))

(declare-fun lt!52000 () List!433)

(assert (=> b!35002 (= lt!52000 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52006) (_1!1840 lt!51998) (bvsub to!314 i!635)))))

(declare-fun lt!52016 () tuple2!3508)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35002 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52008)))

(declare-fun lt!51997 () Unit!2587)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1464 array!1894 (_ BitVec 64)) Unit!2587)

(assert (=> b!35002 (= lt!51997 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1841 lt!52016) (buf!1170 (_2!1841 lt!52006)) lt!52008))))

(declare-fun reader!0 (BitStream!1464 BitStream!1464) tuple2!3506)

(assert (=> b!35002 (= lt!52013 (reader!0 (_2!1841 lt!52016) (_2!1841 lt!52006)))))

(assert (=> b!35002 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!52007 () Unit!2587)

(assert (=> b!35002 (= lt!52007 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1170 (_2!1841 lt!52006)) (bvsub to!314 i!635)))))

(assert (=> b!35002 (= lt!51998 (reader!0 thiss!1379 (_2!1841 lt!52006)))))

(declare-fun b!35003 () Bool)

(declare-fun e!23151 () Bool)

(declare-fun e!23161 () Bool)

(assert (=> b!35003 (= e!23151 e!23161)))

(declare-fun res!29899 () Bool)

(assert (=> b!35003 (=> res!29899 e!23161)))

(declare-fun isPrefixOf!0 (BitStream!1464 BitStream!1464) Bool)

(assert (=> b!35003 (= res!29899 (not (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52006))))))

(assert (=> b!35003 (isPrefixOf!0 thiss!1379 (_2!1841 lt!52006))))

(declare-fun lt!52005 () Unit!2587)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1464 BitStream!1464 BitStream!1464) Unit!2587)

(assert (=> b!35003 (= lt!52005 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1841 lt!52016) (_2!1841 lt!52006)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1464 array!1894 (_ BitVec 64) (_ BitVec 64)) tuple2!3508)

(assert (=> b!35003 (= lt!52006 (appendBitsMSBFirstLoop!0 (_2!1841 lt!52016) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23148 () Bool)

(assert (=> b!35003 e!23148))

(declare-fun res!29904 () Bool)

(assert (=> b!35003 (=> (not res!29904) (not e!23148))))

(assert (=> b!35003 (= res!29904 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52004 () Unit!2587)

(assert (=> b!35003 (= lt!52004 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1170 (_2!1841 lt!52016)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52001 () tuple2!3506)

(assert (=> b!35003 (= lt!52001 (reader!0 thiss!1379 (_2!1841 lt!52016)))))

(declare-fun b!35004 () Bool)

(declare-fun e!23160 () Bool)

(assert (=> b!35004 (= e!23160 e!23155)))

(declare-fun res!29905 () Bool)

(assert (=> b!35004 (=> res!29905 e!23155)))

(assert (=> b!35004 (= res!29905 (not (= (size!842 (buf!1170 (_2!1841 lt!52016))) (size!842 (buf!1170 (_2!1841 lt!52006))))))))

(declare-fun lt!52009 () (_ BitVec 64))

(declare-fun lt!52018 () (_ BitVec 64))

(assert (=> b!35004 (= lt!52009 (bvsub (bvsub (bvadd lt!52018 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!35004 (= lt!52018 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))))))

(assert (=> b!35004 (= (size!842 (buf!1170 (_2!1841 lt!52006))) (size!842 (buf!1170 thiss!1379)))))

(declare-fun b!35005 () Bool)

(declare-fun e!23156 () Bool)

(assert (=> b!35005 (= e!23159 e!23156)))

(declare-fun res!29898 () Bool)

(assert (=> b!35005 (=> res!29898 e!23156)))

(declare-fun lt!51999 () Bool)

(assert (=> b!35005 (= res!29898 (not (= lt!51999 lt!52002)))))

(assert (=> b!35005 (= lt!51999 (bitAt!0 (buf!1170 (_2!1841 lt!52016)) lt!52017))))

(declare-fun b!35006 () Bool)

(assert (=> b!35006 (= e!23148 (= (head!270 (byteArrayBitContentToList!0 (_2!1841 lt!52016) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!270 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52016) (_1!1840 lt!52001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!35007 () Bool)

(declare-fun e!23157 () Bool)

(declare-fun e!23158 () Bool)

(assert (=> b!35007 (= e!23157 (not e!23158))))

(declare-fun res!29906 () Bool)

(assert (=> b!35007 (=> res!29906 e!23158)))

(assert (=> b!35007 (= res!29906 (bvsge i!635 to!314))))

(assert (=> b!35007 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!52010 () Unit!2587)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1464) Unit!2587)

(assert (=> b!35007 (= lt!52010 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!35007 (= lt!52017 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(declare-fun res!29893 () Bool)

(assert (=> start!7204 (=> (not res!29893) (not e!23157))))

(assert (=> start!7204 (= res!29893 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!842 srcBuffer!2))))))))

(assert (=> start!7204 e!23157))

(assert (=> start!7204 true))

(assert (=> start!7204 (array_inv!785 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1464) Bool)

(assert (=> start!7204 (and (inv!12 thiss!1379) e!23154)))

(declare-fun b!34998 () Bool)

(declare-fun res!29902 () Bool)

(assert (=> b!34998 (=> res!29902 e!23160)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!34998 (= res!29902 (not (invariant!0 (currentBit!2544 (_2!1841 lt!52006)) (currentByte!2549 (_2!1841 lt!52006)) (size!842 (buf!1170 (_2!1841 lt!52006))))))))

(declare-fun b!35008 () Bool)

(assert (=> b!35008 (= e!23156 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52017) (bvslt lt!52017 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006))))))))))

(assert (=> b!35008 (= lt!51999 (bitAt!0 (buf!1170 (_2!1841 lt!52006)) lt!52017))))

(declare-fun lt!52015 () Unit!2587)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1894 array!1894 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2587)

(assert (=> b!35008 (= lt!52015 (arrayBitRangesEqImpliesEq!0 (buf!1170 (_2!1841 lt!52016)) (buf!1170 (_2!1841 lt!52006)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52017 lt!52018))))

(declare-fun b!35009 () Bool)

(declare-fun res!29908 () Bool)

(assert (=> b!35009 (=> res!29908 e!23150)))

(declare-fun length!159 (List!433) Int)

(assert (=> b!35009 (= res!29908 (<= (length!159 lt!52000) 0))))

(declare-fun b!35010 () Bool)

(declare-fun res!29895 () Bool)

(assert (=> b!35010 (=> res!29895 e!23155)))

(assert (=> b!35010 (= res!29895 (not (invariant!0 (currentBit!2544 (_2!1841 lt!52016)) (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52016))))))))

(declare-fun b!35011 () Bool)

(assert (=> b!35011 (= e!23158 e!23151)))

(declare-fun res!29894 () Bool)

(assert (=> b!35011 (=> res!29894 e!23151)))

(assert (=> b!35011 (= res!29894 (not (isPrefixOf!0 thiss!1379 (_2!1841 lt!52016))))))

(assert (=> b!35011 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52008)))

(assert (=> b!35011 (= lt!52008 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!51996 () Unit!2587)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1464 BitStream!1464 (_ BitVec 64) (_ BitVec 64)) Unit!2587)

(assert (=> b!35011 (= lt!51996 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1841 lt!52016) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1464 (_ BitVec 8) (_ BitVec 32)) tuple2!3508)

(assert (=> b!35011 (= lt!52016 (appendBitFromByte!0 thiss!1379 (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!35012 () Bool)

(declare-fun res!29903 () Bool)

(assert (=> b!35012 (=> res!29903 e!23160)))

(assert (=> b!35012 (= res!29903 (not (= (size!842 (buf!1170 thiss!1379)) (size!842 (buf!1170 (_2!1841 lt!52006))))))))

(declare-fun b!35013 () Bool)

(assert (=> b!35013 (= e!23161 e!23160)))

(declare-fun res!29910 () Bool)

(assert (=> b!35013 (=> res!29910 e!23160)))

(assert (=> b!35013 (= res!29910 (not (= lt!52009 (bvsub (bvadd lt!52017 to!314) i!635))))))

(assert (=> b!35013 (= lt!52009 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52006))) (currentByte!2549 (_2!1841 lt!52006)) (currentBit!2544 (_2!1841 lt!52006))))))

(declare-fun b!35014 () Bool)

(assert (=> b!35014 (= e!23150 e!23149)))

(declare-fun res!29901 () Bool)

(assert (=> b!35014 (=> res!29901 e!23149)))

(declare-fun lt!52014 () List!433)

(assert (=> b!35014 (= res!29901 (not (= lt!52014 lt!52003)))))

(assert (=> b!35014 (= lt!52003 lt!52014)))

(declare-fun tail!150 (List!433) List!433)

(assert (=> b!35014 (= lt!52014 (tail!150 lt!52000))))

(declare-fun lt!52011 () Unit!2587)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1464 BitStream!1464 BitStream!1464 BitStream!1464 (_ BitVec 64) List!433) Unit!2587)

(assert (=> b!35014 (= lt!52011 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1841 lt!52006) (_2!1841 lt!52006) (_1!1840 lt!51998) (_1!1840 lt!52013) (bvsub to!314 i!635) lt!52000))))

(declare-fun b!35015 () Bool)

(declare-fun res!29900 () Bool)

(assert (=> b!35015 (=> res!29900 e!23155)))

(assert (=> b!35015 (= res!29900 (not (invariant!0 (currentBit!2544 (_2!1841 lt!52016)) (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52006))))))))

(declare-fun b!35016 () Bool)

(declare-fun res!29892 () Bool)

(assert (=> b!35016 (=> (not res!29892) (not e!23157))))

(assert (=> b!35016 (= res!29892 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 thiss!1379))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!35017 () Bool)

(declare-fun res!29897 () Bool)

(assert (=> b!35017 (=> res!29897 e!23147)))

(assert (=> b!35017 (= res!29897 (not (= (head!270 lt!52000) lt!52012)))))

(assert (= (and start!7204 res!29893) b!35016))

(assert (= (and b!35016 res!29892) b!35007))

(assert (= (and b!35007 (not res!29906)) b!35011))

(assert (= (and b!35011 (not res!29894)) b!35003))

(assert (= (and b!35003 res!29904) b!35006))

(assert (= (and b!35003 (not res!29899)) b!35013))

(assert (= (and b!35013 (not res!29910)) b!34998))

(assert (= (and b!34998 (not res!29902)) b!35012))

(assert (= (and b!35012 (not res!29903)) b!35004))

(assert (= (and b!35004 (not res!29905)) b!35010))

(assert (= (and b!35010 (not res!29895)) b!35015))

(assert (= (and b!35015 (not res!29900)) b!35002))

(assert (= (and b!35002 (not res!29907)) b!35009))

(assert (= (and b!35009 (not res!29908)) b!35014))

(assert (= (and b!35014 (not res!29901)) b!34999))

(assert (= (and b!34999 (not res!29896)) b!35017))

(assert (= (and b!35017 (not res!29897)) b!35001))

(assert (= (and b!35001 (not res!29909)) b!35005))

(assert (= (and b!35005 (not res!29898)) b!35008))

(assert (= start!7204 b!35000))

(declare-fun m!52401 () Bool)

(assert (=> b!35006 m!52401))

(assert (=> b!35006 m!52401))

(declare-fun m!52403 () Bool)

(assert (=> b!35006 m!52403))

(declare-fun m!52405 () Bool)

(assert (=> b!35006 m!52405))

(assert (=> b!35006 m!52405))

(declare-fun m!52407 () Bool)

(assert (=> b!35006 m!52407))

(declare-fun m!52409 () Bool)

(assert (=> b!35017 m!52409))

(declare-fun m!52411 () Bool)

(assert (=> b!35007 m!52411))

(declare-fun m!52413 () Bool)

(assert (=> b!35007 m!52413))

(declare-fun m!52415 () Bool)

(assert (=> b!35007 m!52415))

(declare-fun m!52417 () Bool)

(assert (=> b!35013 m!52417))

(declare-fun m!52419 () Bool)

(assert (=> b!34999 m!52419))

(declare-fun m!52421 () Bool)

(assert (=> b!34999 m!52421))

(declare-fun m!52423 () Bool)

(assert (=> b!34998 m!52423))

(declare-fun m!52425 () Bool)

(assert (=> b!35004 m!52425))

(declare-fun m!52427 () Bool)

(assert (=> b!35008 m!52427))

(declare-fun m!52429 () Bool)

(assert (=> b!35008 m!52429))

(declare-fun m!52431 () Bool)

(assert (=> b!35001 m!52431))

(assert (=> b!35001 m!52431))

(declare-fun m!52433 () Bool)

(assert (=> b!35001 m!52433))

(declare-fun m!52435 () Bool)

(assert (=> b!35001 m!52435))

(declare-fun m!52437 () Bool)

(assert (=> start!7204 m!52437))

(declare-fun m!52439 () Bool)

(assert (=> start!7204 m!52439))

(declare-fun m!52441 () Bool)

(assert (=> b!35016 m!52441))

(declare-fun m!52443 () Bool)

(assert (=> b!35000 m!52443))

(declare-fun m!52445 () Bool)

(assert (=> b!35003 m!52445))

(declare-fun m!52447 () Bool)

(assert (=> b!35003 m!52447))

(declare-fun m!52449 () Bool)

(assert (=> b!35003 m!52449))

(declare-fun m!52451 () Bool)

(assert (=> b!35003 m!52451))

(declare-fun m!52453 () Bool)

(assert (=> b!35003 m!52453))

(declare-fun m!52455 () Bool)

(assert (=> b!35003 m!52455))

(declare-fun m!52457 () Bool)

(assert (=> b!35003 m!52457))

(declare-fun m!52459 () Bool)

(assert (=> b!35014 m!52459))

(declare-fun m!52461 () Bool)

(assert (=> b!35014 m!52461))

(declare-fun m!52463 () Bool)

(assert (=> b!35015 m!52463))

(declare-fun m!52465 () Bool)

(assert (=> b!35011 m!52465))

(declare-fun m!52467 () Bool)

(assert (=> b!35011 m!52467))

(declare-fun m!52469 () Bool)

(assert (=> b!35011 m!52469))

(assert (=> b!35011 m!52467))

(declare-fun m!52471 () Bool)

(assert (=> b!35011 m!52471))

(declare-fun m!52473 () Bool)

(assert (=> b!35011 m!52473))

(declare-fun m!52475 () Bool)

(assert (=> b!35005 m!52475))

(declare-fun m!52477 () Bool)

(assert (=> b!35009 m!52477))

(declare-fun m!52479 () Bool)

(assert (=> b!35002 m!52479))

(declare-fun m!52481 () Bool)

(assert (=> b!35002 m!52481))

(declare-fun m!52483 () Bool)

(assert (=> b!35002 m!52483))

(declare-fun m!52485 () Bool)

(assert (=> b!35002 m!52485))

(declare-fun m!52487 () Bool)

(assert (=> b!35002 m!52487))

(declare-fun m!52489 () Bool)

(assert (=> b!35002 m!52489))

(declare-fun m!52491 () Bool)

(assert (=> b!35002 m!52491))

(declare-fun m!52493 () Bool)

(assert (=> b!35002 m!52493))

(declare-fun m!52495 () Bool)

(assert (=> b!35010 m!52495))

(check-sat (not b!35008) (not b!35017) (not b!34998) (not b!35007) (not b!35002) (not b!35003) (not b!35004) (not b!35016) (not b!35010) (not b!35014) (not b!35000) (not b!35006) (not b!35005) (not b!34999) (not b!35013) (not b!35011) (not b!35015) (not b!35001) (not b!35009) (not start!7204))
(check-sat)
(get-model)

(declare-fun d!10278 () Bool)

(declare-fun e!23289 () Bool)

(assert (=> d!10278 e!23289))

(declare-fun res!30081 () Bool)

(assert (=> d!10278 (=> (not res!30081) (not e!23289))))

(declare-fun lt!52344 () (_ BitVec 64))

(declare-fun lt!52346 () (_ BitVec 64))

(declare-fun lt!52342 () (_ BitVec 64))

(assert (=> d!10278 (= res!30081 (= lt!52342 (bvsub lt!52346 lt!52344)))))

(assert (=> d!10278 (or (= (bvand lt!52346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52346 lt!52344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10278 (= lt!52344 (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016)))))))

(declare-fun lt!52347 () (_ BitVec 64))

(declare-fun lt!52345 () (_ BitVec 64))

(assert (=> d!10278 (= lt!52346 (bvmul lt!52347 lt!52345))))

(assert (=> d!10278 (or (= lt!52347 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!52345 (bvsdiv (bvmul lt!52347 lt!52345) lt!52347)))))

(assert (=> d!10278 (= lt!52345 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10278 (= lt!52347 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))))))

(assert (=> d!10278 (= lt!52342 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016)))))))

(assert (=> d!10278 (invariant!0 (currentBit!2544 (_2!1841 lt!52016)) (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52016))))))

(assert (=> d!10278 (= (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))) lt!52342)))

(declare-fun b!35231 () Bool)

(declare-fun res!30082 () Bool)

(assert (=> b!35231 (=> (not res!30082) (not e!23289))))

(assert (=> b!35231 (= res!30082 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52342))))

(declare-fun b!35232 () Bool)

(declare-fun lt!52343 () (_ BitVec 64))

(assert (=> b!35232 (= e!23289 (bvsle lt!52342 (bvmul lt!52343 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35232 (or (= lt!52343 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52343 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52343)))))

(assert (=> b!35232 (= lt!52343 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))))))

(assert (= (and d!10278 res!30081) b!35231))

(assert (= (and b!35231 res!30082) b!35232))

(declare-fun m!52821 () Bool)

(assert (=> d!10278 m!52821))

(assert (=> d!10278 m!52495))

(assert (=> b!35004 d!10278))

(declare-fun d!10280 () Bool)

(assert (=> d!10280 (= (tail!150 lt!52000) (t!1183 lt!52000))))

(assert (=> b!35014 d!10280))

(declare-fun d!10282 () Bool)

(declare-fun e!23292 () Bool)

(assert (=> d!10282 e!23292))

(declare-fun res!30085 () Bool)

(assert (=> d!10282 (=> (not res!30085) (not e!23292))))

(declare-fun lt!52353 () (_ BitVec 64))

(assert (=> d!10282 (= res!30085 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52353 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!52353) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10282 (= lt!52353 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52352 () Unit!2587)

(declare-fun choose!42 (BitStream!1464 BitStream!1464 BitStream!1464 BitStream!1464 (_ BitVec 64) List!433) Unit!2587)

(assert (=> d!10282 (= lt!52352 (choose!42 (_2!1841 lt!52006) (_2!1841 lt!52006) (_1!1840 lt!51998) (_1!1840 lt!52013) (bvsub to!314 i!635) lt!52000))))

(assert (=> d!10282 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10282 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1841 lt!52006) (_2!1841 lt!52006) (_1!1840 lt!51998) (_1!1840 lt!52013) (bvsub to!314 i!635) lt!52000) lt!52352)))

(declare-fun b!35235 () Bool)

(assert (=> b!35235 (= e!23292 (= (bitStreamReadBitsIntoList!0 (_2!1841 lt!52006) (_1!1840 lt!52013) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!150 lt!52000)))))

(assert (= (and d!10282 res!30085) b!35235))

(declare-fun m!52823 () Bool)

(assert (=> d!10282 m!52823))

(declare-fun m!52825 () Bool)

(assert (=> b!35235 m!52825))

(assert (=> b!35235 m!52459))

(assert (=> b!35014 d!10282))

(declare-fun d!10284 () Bool)

(assert (=> d!10284 (isPrefixOf!0 thiss!1379 (_2!1841 lt!52006))))

(declare-fun lt!52356 () Unit!2587)

(declare-fun choose!30 (BitStream!1464 BitStream!1464 BitStream!1464) Unit!2587)

(assert (=> d!10284 (= lt!52356 (choose!30 thiss!1379 (_2!1841 lt!52016) (_2!1841 lt!52006)))))

(assert (=> d!10284 (isPrefixOf!0 thiss!1379 (_2!1841 lt!52016))))

(assert (=> d!10284 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1841 lt!52016) (_2!1841 lt!52006)) lt!52356)))

(declare-fun bs!2782 () Bool)

(assert (= bs!2782 d!10284))

(assert (=> bs!2782 m!52447))

(declare-fun m!52827 () Bool)

(assert (=> bs!2782 m!52827))

(assert (=> bs!2782 m!52469))

(assert (=> b!35003 d!10284))

(declare-fun b!35246 () Bool)

(declare-fun e!23297 () Unit!2587)

(declare-fun Unit!2611 () Unit!2587)

(assert (=> b!35246 (= e!23297 Unit!2611)))

(declare-fun b!35247 () Bool)

(declare-fun res!30093 () Bool)

(declare-fun e!23298 () Bool)

(assert (=> b!35247 (=> (not res!30093) (not e!23298))))

(declare-fun lt!52407 () tuple2!3506)

(assert (=> b!35247 (= res!30093 (isPrefixOf!0 (_2!1840 lt!52407) (_2!1841 lt!52016)))))

(declare-fun b!35248 () Bool)

(declare-fun res!30092 () Bool)

(assert (=> b!35248 (=> (not res!30092) (not e!23298))))

(assert (=> b!35248 (= res!30092 (isPrefixOf!0 (_1!1840 lt!52407) thiss!1379))))

(declare-fun d!10286 () Bool)

(assert (=> d!10286 e!23298))

(declare-fun res!30094 () Bool)

(assert (=> d!10286 (=> (not res!30094) (not e!23298))))

(assert (=> d!10286 (= res!30094 (isPrefixOf!0 (_1!1840 lt!52407) (_2!1840 lt!52407)))))

(declare-fun lt!52416 () BitStream!1464)

(assert (=> d!10286 (= lt!52407 (tuple2!3507 lt!52416 (_2!1841 lt!52016)))))

(declare-fun lt!52400 () Unit!2587)

(declare-fun lt!52397 () Unit!2587)

(assert (=> d!10286 (= lt!52400 lt!52397)))

(assert (=> d!10286 (isPrefixOf!0 lt!52416 (_2!1841 lt!52016))))

(assert (=> d!10286 (= lt!52397 (lemmaIsPrefixTransitive!0 lt!52416 (_2!1841 lt!52016) (_2!1841 lt!52016)))))

(declare-fun lt!52415 () Unit!2587)

(declare-fun lt!52413 () Unit!2587)

(assert (=> d!10286 (= lt!52415 lt!52413)))

(assert (=> d!10286 (isPrefixOf!0 lt!52416 (_2!1841 lt!52016))))

(assert (=> d!10286 (= lt!52413 (lemmaIsPrefixTransitive!0 lt!52416 thiss!1379 (_2!1841 lt!52016)))))

(declare-fun lt!52406 () Unit!2587)

(assert (=> d!10286 (= lt!52406 e!23297)))

(declare-fun c!2377 () Bool)

(assert (=> d!10286 (= c!2377 (not (= (size!842 (buf!1170 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!52402 () Unit!2587)

(declare-fun lt!52404 () Unit!2587)

(assert (=> d!10286 (= lt!52402 lt!52404)))

(assert (=> d!10286 (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52016))))

(assert (=> d!10286 (= lt!52404 (lemmaIsPrefixRefl!0 (_2!1841 lt!52016)))))

(declare-fun lt!52401 () Unit!2587)

(declare-fun lt!52405 () Unit!2587)

(assert (=> d!10286 (= lt!52401 lt!52405)))

(assert (=> d!10286 (= lt!52405 (lemmaIsPrefixRefl!0 (_2!1841 lt!52016)))))

(declare-fun lt!52398 () Unit!2587)

(declare-fun lt!52411 () Unit!2587)

(assert (=> d!10286 (= lt!52398 lt!52411)))

(assert (=> d!10286 (isPrefixOf!0 lt!52416 lt!52416)))

(assert (=> d!10286 (= lt!52411 (lemmaIsPrefixRefl!0 lt!52416))))

(declare-fun lt!52412 () Unit!2587)

(declare-fun lt!52410 () Unit!2587)

(assert (=> d!10286 (= lt!52412 lt!52410)))

(assert (=> d!10286 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10286 (= lt!52410 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10286 (= lt!52416 (BitStream!1465 (buf!1170 (_2!1841 lt!52016)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(assert (=> d!10286 (isPrefixOf!0 thiss!1379 (_2!1841 lt!52016))))

(assert (=> d!10286 (= (reader!0 thiss!1379 (_2!1841 lt!52016)) lt!52407)))

(declare-fun b!35249 () Bool)

(declare-fun lt!52399 () (_ BitVec 64))

(declare-fun lt!52414 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1464 (_ BitVec 64)) BitStream!1464)

(assert (=> b!35249 (= e!23298 (= (_1!1840 lt!52407) (withMovedBitIndex!0 (_2!1840 lt!52407) (bvsub lt!52414 lt!52399))))))

(assert (=> b!35249 (or (= (bvand lt!52414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52399 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52414 lt!52399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35249 (= lt!52399 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))))))

(assert (=> b!35249 (= lt!52414 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(declare-fun b!35250 () Bool)

(declare-fun lt!52403 () Unit!2587)

(assert (=> b!35250 (= e!23297 lt!52403)))

(declare-fun lt!52409 () (_ BitVec 64))

(assert (=> b!35250 (= lt!52409 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52408 () (_ BitVec 64))

(assert (=> b!35250 (= lt!52408 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1894 array!1894 (_ BitVec 64) (_ BitVec 64)) Unit!2587)

(assert (=> b!35250 (= lt!52403 (arrayBitRangesEqSymmetric!0 (buf!1170 thiss!1379) (buf!1170 (_2!1841 lt!52016)) lt!52409 lt!52408))))

(declare-fun arrayBitRangesEq!0 (array!1894 array!1894 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35250 (arrayBitRangesEq!0 (buf!1170 (_2!1841 lt!52016)) (buf!1170 thiss!1379) lt!52409 lt!52408)))

(assert (= (and d!10286 c!2377) b!35250))

(assert (= (and d!10286 (not c!2377)) b!35246))

(assert (= (and d!10286 res!30094) b!35248))

(assert (= (and b!35248 res!30092) b!35247))

(assert (= (and b!35247 res!30093) b!35249))

(declare-fun m!52829 () Bool)

(assert (=> b!35248 m!52829))

(declare-fun m!52831 () Bool)

(assert (=> b!35247 m!52831))

(assert (=> b!35250 m!52415))

(declare-fun m!52833 () Bool)

(assert (=> b!35250 m!52833))

(declare-fun m!52835 () Bool)

(assert (=> b!35250 m!52835))

(declare-fun m!52837 () Bool)

(assert (=> b!35249 m!52837))

(assert (=> b!35249 m!52425))

(assert (=> b!35249 m!52415))

(assert (=> d!10286 m!52413))

(assert (=> d!10286 m!52411))

(declare-fun m!52839 () Bool)

(assert (=> d!10286 m!52839))

(declare-fun m!52841 () Bool)

(assert (=> d!10286 m!52841))

(declare-fun m!52843 () Bool)

(assert (=> d!10286 m!52843))

(declare-fun m!52845 () Bool)

(assert (=> d!10286 m!52845))

(declare-fun m!52847 () Bool)

(assert (=> d!10286 m!52847))

(declare-fun m!52849 () Bool)

(assert (=> d!10286 m!52849))

(assert (=> d!10286 m!52469))

(declare-fun m!52851 () Bool)

(assert (=> d!10286 m!52851))

(declare-fun m!52853 () Bool)

(assert (=> d!10286 m!52853))

(assert (=> b!35003 d!10286))

(declare-fun d!10288 () Bool)

(assert (=> d!10288 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52419 () Unit!2587)

(declare-fun choose!9 (BitStream!1464 array!1894 (_ BitVec 64) BitStream!1464) Unit!2587)

(assert (=> d!10288 (= lt!52419 (choose!9 thiss!1379 (buf!1170 (_2!1841 lt!52016)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1465 (buf!1170 (_2!1841 lt!52016)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379))))))

(assert (=> d!10288 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1170 (_2!1841 lt!52016)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52419)))

(declare-fun bs!2783 () Bool)

(assert (= bs!2783 d!10288))

(assert (=> bs!2783 m!52457))

(declare-fun m!52855 () Bool)

(assert (=> bs!2783 m!52855))

(assert (=> b!35003 d!10288))

(declare-fun d!10290 () Bool)

(declare-fun res!30102 () Bool)

(declare-fun e!23303 () Bool)

(assert (=> d!10290 (=> (not res!30102) (not e!23303))))

(assert (=> d!10290 (= res!30102 (= (size!842 (buf!1170 (_2!1841 lt!52016))) (size!842 (buf!1170 (_2!1841 lt!52006)))))))

(assert (=> d!10290 (= (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52006)) e!23303)))

(declare-fun b!35257 () Bool)

(declare-fun res!30103 () Bool)

(assert (=> b!35257 (=> (not res!30103) (not e!23303))))

(assert (=> b!35257 (= res!30103 (bvsle (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))) (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52006))) (currentByte!2549 (_2!1841 lt!52006)) (currentBit!2544 (_2!1841 lt!52006)))))))

(declare-fun b!35258 () Bool)

(declare-fun e!23304 () Bool)

(assert (=> b!35258 (= e!23303 e!23304)))

(declare-fun res!30101 () Bool)

(assert (=> b!35258 (=> res!30101 e!23304)))

(assert (=> b!35258 (= res!30101 (= (size!842 (buf!1170 (_2!1841 lt!52016))) #b00000000000000000000000000000000))))

(declare-fun b!35259 () Bool)

(assert (=> b!35259 (= e!23304 (arrayBitRangesEq!0 (buf!1170 (_2!1841 lt!52016)) (buf!1170 (_2!1841 lt!52006)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016)))))))

(assert (= (and d!10290 res!30102) b!35257))

(assert (= (and b!35257 res!30103) b!35258))

(assert (= (and b!35258 (not res!30101)) b!35259))

(assert (=> b!35257 m!52425))

(assert (=> b!35257 m!52417))

(assert (=> b!35259 m!52425))

(assert (=> b!35259 m!52425))

(declare-fun m!52857 () Bool)

(assert (=> b!35259 m!52857))

(assert (=> b!35003 d!10290))

(declare-fun b!35399 () Bool)

(declare-fun e!23369 () tuple2!3508)

(declare-fun Unit!2612 () Unit!2587)

(assert (=> b!35399 (= e!23369 (tuple2!3509 Unit!2612 (_2!1841 lt!52016)))))

(assert (=> b!35399 (= (size!842 (buf!1170 (_2!1841 lt!52016))) (size!842 (buf!1170 (_2!1841 lt!52016))))))

(declare-fun lt!52981 () Unit!2587)

(declare-fun Unit!2613 () Unit!2587)

(assert (=> b!35399 (= lt!52981 Unit!2613)))

(declare-fun call!445 () tuple2!3506)

(declare-fun checkByteArrayBitContent!0 (BitStream!1464 array!1894 array!1894 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3530 0))(
  ( (tuple2!3531 (_1!1852 array!1894) (_2!1852 BitStream!1464)) )
))
(declare-fun readBits!0 (BitStream!1464 (_ BitVec 64)) tuple2!3530)

(assert (=> b!35399 (checkByteArrayBitContent!0 (_2!1841 lt!52016) srcBuffer!2 (_1!1852 (readBits!0 (_1!1840 call!445) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!35401 () Bool)

(declare-fun res!30193 () Bool)

(declare-fun e!23368 () Bool)

(assert (=> b!35401 (=> (not res!30193) (not e!23368))))

(declare-fun lt!52957 () tuple2!3508)

(assert (=> b!35401 (= res!30193 (= (size!842 (buf!1170 (_2!1841 lt!52016))) (size!842 (buf!1170 (_2!1841 lt!52957)))))))

(declare-fun b!35402 () Bool)

(declare-fun e!23367 () Bool)

(declare-fun lt!52945 () (_ BitVec 64))

(assert (=> b!35402 (= e!23367 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52945))))

(declare-fun c!2405 () Bool)

(declare-fun lt!52965 () tuple2!3508)

(declare-fun lt!52964 () tuple2!3508)

(declare-fun bm!442 () Bool)

(assert (=> bm!442 (= call!445 (reader!0 (ite c!2405 (_2!1841 lt!52964) (_2!1841 lt!52016)) (ite c!2405 (_2!1841 lt!52965) (_2!1841 lt!52016))))))

(declare-fun b!35403 () Bool)

(declare-fun res!30189 () Bool)

(assert (=> b!35403 (=> (not res!30189) (not e!23368))))

(assert (=> b!35403 (= res!30189 (invariant!0 (currentBit!2544 (_2!1841 lt!52957)) (currentByte!2549 (_2!1841 lt!52957)) (size!842 (buf!1170 (_2!1841 lt!52957)))))))

(declare-fun lt!52954 () tuple2!3506)

(declare-fun b!35404 () Bool)

(assert (=> b!35404 (= e!23368 (= (bitStreamReadBitsIntoList!0 (_2!1841 lt!52957) (_1!1840 lt!52954) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1841 lt!52957) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!35404 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35404 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!52947 () Unit!2587)

(declare-fun lt!52950 () Unit!2587)

(assert (=> b!35404 (= lt!52947 lt!52950)))

(assert (=> b!35404 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52957)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52945)))

(assert (=> b!35404 (= lt!52950 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1841 lt!52016) (buf!1170 (_2!1841 lt!52957)) lt!52945))))

(assert (=> b!35404 e!23367))

(declare-fun res!30191 () Bool)

(assert (=> b!35404 (=> (not res!30191) (not e!23367))))

(assert (=> b!35404 (= res!30191 (and (= (size!842 (buf!1170 (_2!1841 lt!52016))) (size!842 (buf!1170 (_2!1841 lt!52957)))) (bvsge lt!52945 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35404 (= lt!52945 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!35404 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35404 (= lt!52954 (reader!0 (_2!1841 lt!52016) (_2!1841 lt!52957)))))

(declare-fun d!10292 () Bool)

(assert (=> d!10292 e!23368))

(declare-fun res!30194 () Bool)

(assert (=> d!10292 (=> (not res!30194) (not e!23368))))

(declare-fun lt!52976 () (_ BitVec 64))

(assert (=> d!10292 (= res!30194 (= (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52957))) (currentByte!2549 (_2!1841 lt!52957)) (currentBit!2544 (_2!1841 lt!52957))) (bvsub lt!52976 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10292 (or (= (bvand lt!52976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52976 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!52960 () (_ BitVec 64))

(assert (=> d!10292 (= lt!52976 (bvadd lt!52960 to!314))))

(assert (=> d!10292 (or (not (= (bvand lt!52960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!52960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!52960 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10292 (= lt!52960 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))))))

(assert (=> d!10292 (= lt!52957 e!23369)))

(assert (=> d!10292 (= c!2405 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!52953 () Unit!2587)

(declare-fun lt!52939 () Unit!2587)

(assert (=> d!10292 (= lt!52953 lt!52939)))

(assert (=> d!10292 (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52016))))

(assert (=> d!10292 (= lt!52939 (lemmaIsPrefixRefl!0 (_2!1841 lt!52016)))))

(declare-fun lt!52968 () (_ BitVec 64))

(assert (=> d!10292 (= lt!52968 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))))))

(assert (=> d!10292 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10292 (= (appendBitsMSBFirstLoop!0 (_2!1841 lt!52016) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!52957)))

(declare-fun b!35400 () Bool)

(declare-fun res!30190 () Bool)

(assert (=> b!35400 (=> (not res!30190) (not e!23368))))

(assert (=> b!35400 (= res!30190 (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52957)))))

(declare-fun b!35405 () Bool)

(declare-fun Unit!2614 () Unit!2587)

(assert (=> b!35405 (= e!23369 (tuple2!3509 Unit!2614 (_2!1841 lt!52965)))))

(assert (=> b!35405 (= lt!52964 (appendBitFromByte!0 (_2!1841 lt!52016) (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!52974 () (_ BitVec 64))

(assert (=> b!35405 (= lt!52974 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52978 () (_ BitVec 64))

(assert (=> b!35405 (= lt!52978 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52958 () Unit!2587)

(assert (=> b!35405 (= lt!52958 (validateOffsetBitsIneqLemma!0 (_2!1841 lt!52016) (_2!1841 lt!52964) lt!52974 lt!52978))))

(assert (=> b!35405 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52964)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52964))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52964))) (bvsub lt!52974 lt!52978))))

(declare-fun lt!52975 () Unit!2587)

(assert (=> b!35405 (= lt!52975 lt!52958)))

(declare-fun lt!52973 () tuple2!3506)

(assert (=> b!35405 (= lt!52973 (reader!0 (_2!1841 lt!52016) (_2!1841 lt!52964)))))

(declare-fun lt!52969 () (_ BitVec 64))

(assert (=> b!35405 (= lt!52969 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52951 () Unit!2587)

(assert (=> b!35405 (= lt!52951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1841 lt!52016) (buf!1170 (_2!1841 lt!52964)) lt!52969))))

(assert (=> b!35405 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52964)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52969)))

(declare-fun lt!52942 () Unit!2587)

(assert (=> b!35405 (= lt!52942 lt!52951)))

(assert (=> b!35405 (= (head!270 (byteArrayBitContentToList!0 (_2!1841 lt!52964) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!270 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52964) (_1!1840 lt!52973) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52948 () Unit!2587)

(declare-fun Unit!2615 () Unit!2587)

(assert (=> b!35405 (= lt!52948 Unit!2615)))

(assert (=> b!35405 (= lt!52965 (appendBitsMSBFirstLoop!0 (_2!1841 lt!52964) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!52967 () Unit!2587)

(assert (=> b!35405 (= lt!52967 (lemmaIsPrefixTransitive!0 (_2!1841 lt!52016) (_2!1841 lt!52964) (_2!1841 lt!52965)))))

(assert (=> b!35405 (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52965))))

(declare-fun lt!52970 () Unit!2587)

(assert (=> b!35405 (= lt!52970 lt!52967)))

(assert (=> b!35405 (= (size!842 (buf!1170 (_2!1841 lt!52965))) (size!842 (buf!1170 (_2!1841 lt!52016))))))

(declare-fun lt!52949 () Unit!2587)

(declare-fun Unit!2616 () Unit!2587)

(assert (=> b!35405 (= lt!52949 Unit!2616)))

(assert (=> b!35405 (= (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52965))) (currentByte!2549 (_2!1841 lt!52965)) (currentBit!2544 (_2!1841 lt!52965))) (bvsub (bvadd (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52955 () Unit!2587)

(declare-fun Unit!2617 () Unit!2587)

(assert (=> b!35405 (= lt!52955 Unit!2617)))

(assert (=> b!35405 (= (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52965))) (currentByte!2549 (_2!1841 lt!52965)) (currentBit!2544 (_2!1841 lt!52965))) (bvsub (bvsub (bvadd (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52964))) (currentByte!2549 (_2!1841 lt!52964)) (currentBit!2544 (_2!1841 lt!52964))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52971 () Unit!2587)

(declare-fun Unit!2618 () Unit!2587)

(assert (=> b!35405 (= lt!52971 Unit!2618)))

(declare-fun lt!52959 () tuple2!3506)

(assert (=> b!35405 (= lt!52959 (reader!0 (_2!1841 lt!52016) (_2!1841 lt!52965)))))

(declare-fun lt!52938 () (_ BitVec 64))

(assert (=> b!35405 (= lt!52938 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52966 () Unit!2587)

(assert (=> b!35405 (= lt!52966 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1841 lt!52016) (buf!1170 (_2!1841 lt!52965)) lt!52938))))

(assert (=> b!35405 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52965)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52938)))

(declare-fun lt!52956 () Unit!2587)

(assert (=> b!35405 (= lt!52956 lt!52966)))

(declare-fun lt!52963 () tuple2!3506)

(assert (=> b!35405 (= lt!52963 call!445)))

(declare-fun lt!52946 () (_ BitVec 64))

(assert (=> b!35405 (= lt!52946 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52940 () Unit!2587)

(assert (=> b!35405 (= lt!52940 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1841 lt!52964) (buf!1170 (_2!1841 lt!52965)) lt!52946))))

(assert (=> b!35405 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52965)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52964))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52964))) lt!52946)))

(declare-fun lt!52952 () Unit!2587)

(assert (=> b!35405 (= lt!52952 lt!52940)))

(declare-fun lt!52962 () List!433)

(assert (=> b!35405 (= lt!52962 (byteArrayBitContentToList!0 (_2!1841 lt!52965) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!52980 () List!433)

(assert (=> b!35405 (= lt!52980 (byteArrayBitContentToList!0 (_2!1841 lt!52965) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52979 () List!433)

(assert (=> b!35405 (= lt!52979 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52965) (_1!1840 lt!52959) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!52972 () List!433)

(assert (=> b!35405 (= lt!52972 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52965) (_1!1840 lt!52963) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52961 () (_ BitVec 64))

(assert (=> b!35405 (= lt!52961 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52943 () Unit!2587)

(assert (=> b!35405 (= lt!52943 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1841 lt!52965) (_2!1841 lt!52965) (_1!1840 lt!52959) (_1!1840 lt!52963) lt!52961 lt!52979))))

(assert (=> b!35405 (= (bitStreamReadBitsIntoList!0 (_2!1841 lt!52965) (_1!1840 lt!52963) (bvsub lt!52961 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!150 lt!52979))))

(declare-fun lt!52941 () Unit!2587)

(assert (=> b!35405 (= lt!52941 lt!52943)))

(declare-fun lt!52977 () Unit!2587)

(assert (=> b!35405 (= lt!52977 (arrayBitRangesEqImpliesEq!0 (buf!1170 (_2!1841 lt!52964)) (buf!1170 (_2!1841 lt!52965)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52968 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52964))) (currentByte!2549 (_2!1841 lt!52964)) (currentBit!2544 (_2!1841 lt!52964)))))))

(assert (=> b!35405 (= (bitAt!0 (buf!1170 (_2!1841 lt!52964)) lt!52968) (bitAt!0 (buf!1170 (_2!1841 lt!52965)) lt!52968))))

(declare-fun lt!52944 () Unit!2587)

(assert (=> b!35405 (= lt!52944 lt!52977)))

(declare-fun b!35406 () Bool)

(declare-fun res!30192 () Bool)

(assert (=> b!35406 (=> (not res!30192) (not e!23368))))

(assert (=> b!35406 (= res!30192 (= (size!842 (buf!1170 (_2!1841 lt!52957))) (size!842 (buf!1170 (_2!1841 lt!52016)))))))

(assert (= (and d!10292 c!2405) b!35405))

(assert (= (and d!10292 (not c!2405)) b!35399))

(assert (= (or b!35405 b!35399) bm!442))

(assert (= (and d!10292 res!30194) b!35403))

(assert (= (and b!35403 res!30189) b!35401))

(assert (= (and b!35401 res!30193) b!35400))

(assert (= (and b!35400 res!30190) b!35406))

(assert (= (and b!35406 res!30192) b!35404))

(assert (= (and b!35404 res!30191) b!35402))

(declare-fun m!53171 () Bool)

(assert (=> b!35405 m!53171))

(declare-fun m!53173 () Bool)

(assert (=> b!35405 m!53173))

(declare-fun m!53175 () Bool)

(assert (=> b!35405 m!53175))

(declare-fun m!53177 () Bool)

(assert (=> b!35405 m!53177))

(declare-fun m!53179 () Bool)

(assert (=> b!35405 m!53179))

(declare-fun m!53181 () Bool)

(assert (=> b!35405 m!53181))

(declare-fun m!53183 () Bool)

(assert (=> b!35405 m!53183))

(declare-fun m!53185 () Bool)

(assert (=> b!35405 m!53185))

(declare-fun m!53187 () Bool)

(assert (=> b!35405 m!53187))

(declare-fun m!53189 () Bool)

(assert (=> b!35405 m!53189))

(declare-fun m!53191 () Bool)

(assert (=> b!35405 m!53191))

(declare-fun m!53193 () Bool)

(assert (=> b!35405 m!53193))

(declare-fun m!53195 () Bool)

(assert (=> b!35405 m!53195))

(declare-fun m!53197 () Bool)

(assert (=> b!35405 m!53197))

(declare-fun m!53199 () Bool)

(assert (=> b!35405 m!53199))

(declare-fun m!53201 () Bool)

(assert (=> b!35405 m!53201))

(declare-fun m!53203 () Bool)

(assert (=> b!35405 m!53203))

(declare-fun m!53205 () Bool)

(assert (=> b!35405 m!53205))

(declare-fun m!53207 () Bool)

(assert (=> b!35405 m!53207))

(declare-fun m!53209 () Bool)

(assert (=> b!35405 m!53209))

(assert (=> b!35405 m!53203))

(declare-fun m!53211 () Bool)

(assert (=> b!35405 m!53211))

(declare-fun m!53213 () Bool)

(assert (=> b!35405 m!53213))

(declare-fun m!53215 () Bool)

(assert (=> b!35405 m!53215))

(declare-fun m!53217 () Bool)

(assert (=> b!35405 m!53217))

(assert (=> b!35405 m!52425))

(declare-fun m!53219 () Bool)

(assert (=> b!35405 m!53219))

(assert (=> b!35405 m!53207))

(declare-fun m!53221 () Bool)

(assert (=> b!35405 m!53221))

(declare-fun m!53223 () Bool)

(assert (=> b!35405 m!53223))

(assert (=> b!35405 m!53217))

(declare-fun m!53225 () Bool)

(assert (=> b!35405 m!53225))

(declare-fun m!53227 () Bool)

(assert (=> b!35405 m!53227))

(declare-fun m!53229 () Bool)

(assert (=> b!35405 m!53229))

(assert (=> b!35405 m!53205))

(declare-fun m!53231 () Bool)

(assert (=> b!35405 m!53231))

(declare-fun m!53233 () Bool)

(assert (=> b!35402 m!53233))

(declare-fun m!53235 () Bool)

(assert (=> b!35403 m!53235))

(declare-fun m!53237 () Bool)

(assert (=> bm!442 m!53237))

(declare-fun m!53239 () Bool)

(assert (=> b!35404 m!53239))

(declare-fun m!53241 () Bool)

(assert (=> b!35404 m!53241))

(declare-fun m!53243 () Bool)

(assert (=> b!35404 m!53243))

(declare-fun m!53245 () Bool)

(assert (=> b!35404 m!53245))

(declare-fun m!53247 () Bool)

(assert (=> b!35404 m!53247))

(declare-fun m!53249 () Bool)

(assert (=> b!35399 m!53249))

(declare-fun m!53251 () Bool)

(assert (=> b!35399 m!53251))

(declare-fun m!53253 () Bool)

(assert (=> d!10292 m!53253))

(assert (=> d!10292 m!52425))

(assert (=> d!10292 m!52851))

(assert (=> d!10292 m!52849))

(declare-fun m!53255 () Bool)

(assert (=> b!35400 m!53255))

(assert (=> b!35003 d!10292))

(declare-fun d!10366 () Bool)

(assert (=> d!10366 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2799 () Bool)

(assert (= bs!2799 d!10366))

(declare-fun m!53257 () Bool)

(assert (=> bs!2799 m!53257))

(assert (=> b!35003 d!10366))

(declare-fun d!10368 () Bool)

(declare-fun res!30196 () Bool)

(declare-fun e!23370 () Bool)

(assert (=> d!10368 (=> (not res!30196) (not e!23370))))

(assert (=> d!10368 (= res!30196 (= (size!842 (buf!1170 thiss!1379)) (size!842 (buf!1170 (_2!1841 lt!52006)))))))

(assert (=> d!10368 (= (isPrefixOf!0 thiss!1379 (_2!1841 lt!52006)) e!23370)))

(declare-fun b!35407 () Bool)

(declare-fun res!30197 () Bool)

(assert (=> b!35407 (=> (not res!30197) (not e!23370))))

(assert (=> b!35407 (= res!30197 (bvsle (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)) (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52006))) (currentByte!2549 (_2!1841 lt!52006)) (currentBit!2544 (_2!1841 lt!52006)))))))

(declare-fun b!35408 () Bool)

(declare-fun e!23371 () Bool)

(assert (=> b!35408 (= e!23370 e!23371)))

(declare-fun res!30195 () Bool)

(assert (=> b!35408 (=> res!30195 e!23371)))

(assert (=> b!35408 (= res!30195 (= (size!842 (buf!1170 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35409 () Bool)

(assert (=> b!35409 (= e!23371 (arrayBitRangesEq!0 (buf!1170 thiss!1379) (buf!1170 (_2!1841 lt!52006)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379))))))

(assert (= (and d!10368 res!30196) b!35407))

(assert (= (and b!35407 res!30197) b!35408))

(assert (= (and b!35408 (not res!30195)) b!35409))

(assert (=> b!35407 m!52415))

(assert (=> b!35407 m!52417))

(assert (=> b!35409 m!52415))

(assert (=> b!35409 m!52415))

(declare-fun m!53259 () Bool)

(assert (=> b!35409 m!53259))

(assert (=> b!35003 d!10368))

(declare-fun d!10370 () Bool)

(assert (=> d!10370 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 thiss!1379))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 thiss!1379))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2800 () Bool)

(assert (= bs!2800 d!10370))

(declare-fun m!53261 () Bool)

(assert (=> bs!2800 m!53261))

(assert (=> b!35016 d!10370))

(declare-fun d!10372 () Bool)

(assert (=> d!10372 (= (bitAt!0 (buf!1170 (_2!1841 lt!52016)) lt!52017) (not (= (bvand ((_ sign_extend 24) (select (arr!1323 (buf!1170 (_2!1841 lt!52016))) ((_ extract 31 0) (bvsdiv lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2801 () Bool)

(assert (= bs!2801 d!10372))

(declare-fun m!53263 () Bool)

(assert (=> bs!2801 m!53263))

(declare-fun m!53265 () Bool)

(assert (=> bs!2801 m!53265))

(assert (=> b!35005 d!10372))

(declare-fun d!10374 () Bool)

(assert (=> d!10374 (= (invariant!0 (currentBit!2544 (_2!1841 lt!52016)) (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52006)))) (and (bvsge (currentBit!2544 (_2!1841 lt!52016)) #b00000000000000000000000000000000) (bvslt (currentBit!2544 (_2!1841 lt!52016)) #b00000000000000000000000000001000) (bvsge (currentByte!2549 (_2!1841 lt!52016)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52006)))) (and (= (currentBit!2544 (_2!1841 lt!52016)) #b00000000000000000000000000000000) (= (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52006))))))))))

(assert (=> b!35015 d!10374))

(declare-fun d!10376 () Bool)

(assert (=> d!10376 (= (head!270 lt!52000) (h!548 lt!52000))))

(assert (=> b!35017 d!10376))

(declare-fun d!10378 () Bool)

(assert (=> d!10378 (= (head!270 (byteArrayBitContentToList!0 (_2!1841 lt!52016) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!548 (byteArrayBitContentToList!0 (_2!1841 lt!52016) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35006 d!10378))

(declare-fun d!10380 () Bool)

(declare-fun c!2408 () Bool)

(assert (=> d!10380 (= c!2408 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23374 () List!433)

(assert (=> d!10380 (= (byteArrayBitContentToList!0 (_2!1841 lt!52016) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23374)))

(declare-fun b!35414 () Bool)

(assert (=> b!35414 (= e!23374 Nil!430)))

(declare-fun b!35415 () Bool)

(assert (=> b!35415 (= e!23374 (Cons!429 (not (= (bvand ((_ sign_extend 24) (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1841 lt!52016) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10380 c!2408) b!35414))

(assert (= (and d!10380 (not c!2408)) b!35415))

(assert (=> b!35415 m!52467))

(declare-fun m!53267 () Bool)

(assert (=> b!35415 m!53267))

(declare-fun m!53269 () Bool)

(assert (=> b!35415 m!53269))

(assert (=> b!35006 d!10380))

(declare-fun d!10382 () Bool)

(assert (=> d!10382 (= (head!270 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52016) (_1!1840 lt!52001) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!548 (bitStreamReadBitsIntoList!0 (_2!1841 lt!52016) (_1!1840 lt!52001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35006 d!10382))

(declare-fun b!35427 () Bool)

(declare-fun e!23379 () Bool)

(declare-fun lt!52990 () List!433)

(assert (=> b!35427 (= e!23379 (> (length!159 lt!52990) 0))))

(declare-fun d!10384 () Bool)

(assert (=> d!10384 e!23379))

(declare-fun c!2414 () Bool)

(assert (=> d!10384 (= c!2414 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3532 0))(
  ( (tuple2!3533 (_1!1853 List!433) (_2!1853 BitStream!1464)) )
))
(declare-fun e!23380 () tuple2!3532)

(assert (=> d!10384 (= lt!52990 (_1!1853 e!23380))))

(declare-fun c!2413 () Bool)

(assert (=> d!10384 (= c!2413 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10384 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10384 (= (bitStreamReadBitsIntoList!0 (_2!1841 lt!52016) (_1!1840 lt!52001) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52990)))

(declare-datatypes ((tuple2!3534 0))(
  ( (tuple2!3535 (_1!1854 Bool) (_2!1854 BitStream!1464)) )
))
(declare-fun lt!52989 () tuple2!3534)

(declare-fun b!35425 () Bool)

(declare-fun lt!52988 () (_ BitVec 64))

(assert (=> b!35425 (= e!23380 (tuple2!3533 (Cons!429 (_1!1854 lt!52989) (bitStreamReadBitsIntoList!0 (_2!1841 lt!52016) (_2!1854 lt!52989) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!52988))) (_2!1854 lt!52989)))))

(declare-fun readBit!0 (BitStream!1464) tuple2!3534)

(assert (=> b!35425 (= lt!52989 (readBit!0 (_1!1840 lt!52001)))))

(assert (=> b!35425 (= lt!52988 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!35424 () Bool)

(assert (=> b!35424 (= e!23380 (tuple2!3533 Nil!430 (_1!1840 lt!52001)))))

(declare-fun b!35426 () Bool)

(declare-fun isEmpty!98 (List!433) Bool)

(assert (=> b!35426 (= e!23379 (isEmpty!98 lt!52990))))

(assert (= (and d!10384 c!2413) b!35424))

(assert (= (and d!10384 (not c!2413)) b!35425))

(assert (= (and d!10384 c!2414) b!35426))

(assert (= (and d!10384 (not c!2414)) b!35427))

(declare-fun m!53271 () Bool)

(assert (=> b!35427 m!53271))

(declare-fun m!53273 () Bool)

(assert (=> b!35425 m!53273))

(declare-fun m!53275 () Bool)

(assert (=> b!35425 m!53275))

(declare-fun m!53277 () Bool)

(assert (=> b!35426 m!53277))

(assert (=> b!35006 d!10384))

(declare-fun d!10386 () Bool)

(assert (=> d!10386 (= (bitAt!0 (buf!1170 (_2!1841 lt!52006)) lt!52017) (not (= (bvand ((_ sign_extend 24) (select (arr!1323 (buf!1170 (_2!1841 lt!52006))) ((_ extract 31 0) (bvsdiv lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2802 () Bool)

(assert (= bs!2802 d!10386))

(declare-fun m!53279 () Bool)

(assert (=> bs!2802 m!53279))

(assert (=> bs!2802 m!53265))

(assert (=> b!35008 d!10386))

(declare-fun d!10388 () Bool)

(assert (=> d!10388 (= (bitAt!0 (buf!1170 (_2!1841 lt!52016)) lt!52017) (bitAt!0 (buf!1170 (_2!1841 lt!52006)) lt!52017))))

(declare-fun lt!52993 () Unit!2587)

(declare-fun choose!31 (array!1894 array!1894 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2587)

(assert (=> d!10388 (= lt!52993 (choose!31 (buf!1170 (_2!1841 lt!52016)) (buf!1170 (_2!1841 lt!52006)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52017 lt!52018))))

(assert (=> d!10388 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52018))))

(assert (=> d!10388 (= (arrayBitRangesEqImpliesEq!0 (buf!1170 (_2!1841 lt!52016)) (buf!1170 (_2!1841 lt!52006)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52017 lt!52018) lt!52993)))

(declare-fun bs!2803 () Bool)

(assert (= bs!2803 d!10388))

(assert (=> bs!2803 m!52475))

(assert (=> bs!2803 m!52427))

(declare-fun m!53281 () Bool)

(assert (=> bs!2803 m!53281))

(assert (=> b!35008 d!10388))

(declare-fun d!10390 () Bool)

(declare-fun res!30199 () Bool)

(declare-fun e!23381 () Bool)

(assert (=> d!10390 (=> (not res!30199) (not e!23381))))

(assert (=> d!10390 (= res!30199 (= (size!842 (buf!1170 thiss!1379)) (size!842 (buf!1170 thiss!1379))))))

(assert (=> d!10390 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!23381)))

(declare-fun b!35428 () Bool)

(declare-fun res!30200 () Bool)

(assert (=> b!35428 (=> (not res!30200) (not e!23381))))

(assert (=> b!35428 (= res!30200 (bvsle (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)) (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379))))))

(declare-fun b!35429 () Bool)

(declare-fun e!23382 () Bool)

(assert (=> b!35429 (= e!23381 e!23382)))

(declare-fun res!30198 () Bool)

(assert (=> b!35429 (=> res!30198 e!23382)))

(assert (=> b!35429 (= res!30198 (= (size!842 (buf!1170 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35430 () Bool)

(assert (=> b!35430 (= e!23382 (arrayBitRangesEq!0 (buf!1170 thiss!1379) (buf!1170 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379))))))

(assert (= (and d!10390 res!30199) b!35428))

(assert (= (and b!35428 res!30200) b!35429))

(assert (= (and b!35429 (not res!30198)) b!35430))

(assert (=> b!35428 m!52415))

(assert (=> b!35428 m!52415))

(assert (=> b!35430 m!52415))

(assert (=> b!35430 m!52415))

(declare-fun m!53283 () Bool)

(assert (=> b!35430 m!53283))

(assert (=> b!35007 d!10390))

(declare-fun d!10392 () Bool)

(assert (=> d!10392 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!52996 () Unit!2587)

(declare-fun choose!11 (BitStream!1464) Unit!2587)

(assert (=> d!10392 (= lt!52996 (choose!11 thiss!1379))))

(assert (=> d!10392 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!52996)))

(declare-fun bs!2805 () Bool)

(assert (= bs!2805 d!10392))

(assert (=> bs!2805 m!52411))

(declare-fun m!53285 () Bool)

(assert (=> bs!2805 m!53285))

(assert (=> b!35007 d!10392))

(declare-fun d!10394 () Bool)

(declare-fun e!23383 () Bool)

(assert (=> d!10394 e!23383))

(declare-fun res!30201 () Bool)

(assert (=> d!10394 (=> (not res!30201) (not e!23383))))

(declare-fun lt!52997 () (_ BitVec 64))

(declare-fun lt!52999 () (_ BitVec 64))

(declare-fun lt!53001 () (_ BitVec 64))

(assert (=> d!10394 (= res!30201 (= lt!52997 (bvsub lt!53001 lt!52999)))))

(assert (=> d!10394 (or (= (bvand lt!53001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53001 lt!52999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10394 (= lt!52999 (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 thiss!1379))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379))))))

(declare-fun lt!53002 () (_ BitVec 64))

(declare-fun lt!53000 () (_ BitVec 64))

(assert (=> d!10394 (= lt!53001 (bvmul lt!53002 lt!53000))))

(assert (=> d!10394 (or (= lt!53002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!53000 (bvsdiv (bvmul lt!53002 lt!53000) lt!53002)))))

(assert (=> d!10394 (= lt!53000 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10394 (= lt!53002 ((_ sign_extend 32) (size!842 (buf!1170 thiss!1379))))))

(assert (=> d!10394 (= lt!52997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2549 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2544 thiss!1379))))))

(assert (=> d!10394 (invariant!0 (currentBit!2544 thiss!1379) (currentByte!2549 thiss!1379) (size!842 (buf!1170 thiss!1379)))))

(assert (=> d!10394 (= (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)) lt!52997)))

(declare-fun b!35431 () Bool)

(declare-fun res!30202 () Bool)

(assert (=> b!35431 (=> (not res!30202) (not e!23383))))

(assert (=> b!35431 (= res!30202 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52997))))

(declare-fun b!35432 () Bool)

(declare-fun lt!52998 () (_ BitVec 64))

(assert (=> b!35432 (= e!23383 (bvsle lt!52997 (bvmul lt!52998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35432 (or (= lt!52998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52998)))))

(assert (=> b!35432 (= lt!52998 ((_ sign_extend 32) (size!842 (buf!1170 thiss!1379))))))

(assert (= (and d!10394 res!30201) b!35431))

(assert (= (and b!35431 res!30202) b!35432))

(assert (=> d!10394 m!53261))

(declare-fun m!53287 () Bool)

(assert (=> d!10394 m!53287))

(assert (=> b!35007 d!10394))

(declare-fun d!10396 () Bool)

(declare-fun size!846 (List!433) Int)

(assert (=> d!10396 (= (length!159 lt!52000) (size!846 lt!52000))))

(declare-fun bs!2806 () Bool)

(assert (= bs!2806 d!10396))

(declare-fun m!53289 () Bool)

(assert (=> bs!2806 m!53289))

(assert (=> b!35009 d!10396))

(declare-fun d!10398 () Bool)

(assert (=> d!10398 (= (invariant!0 (currentBit!2544 (_2!1841 lt!52006)) (currentByte!2549 (_2!1841 lt!52006)) (size!842 (buf!1170 (_2!1841 lt!52006)))) (and (bvsge (currentBit!2544 (_2!1841 lt!52006)) #b00000000000000000000000000000000) (bvslt (currentBit!2544 (_2!1841 lt!52006)) #b00000000000000000000000000001000) (bvsge (currentByte!2549 (_2!1841 lt!52006)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2549 (_2!1841 lt!52006)) (size!842 (buf!1170 (_2!1841 lt!52006)))) (and (= (currentBit!2544 (_2!1841 lt!52006)) #b00000000000000000000000000000000) (= (currentByte!2549 (_2!1841 lt!52006)) (size!842 (buf!1170 (_2!1841 lt!52006))))))))))

(assert (=> b!34998 d!10398))

(declare-fun d!10400 () Bool)

(assert (=> d!10400 (= (array_inv!785 (buf!1170 thiss!1379)) (bvsge (size!842 (buf!1170 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!35000 d!10400))

(declare-fun d!10402 () Bool)

(assert (=> d!10402 (= (invariant!0 (currentBit!2544 (_2!1841 lt!52016)) (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52016)))) (and (bvsge (currentBit!2544 (_2!1841 lt!52016)) #b00000000000000000000000000000000) (bvslt (currentBit!2544 (_2!1841 lt!52016)) #b00000000000000000000000000001000) (bvsge (currentByte!2549 (_2!1841 lt!52016)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52016)))) (and (= (currentBit!2544 (_2!1841 lt!52016)) #b00000000000000000000000000000000) (= (currentByte!2549 (_2!1841 lt!52016)) (size!842 (buf!1170 (_2!1841 lt!52016))))))))))

(assert (=> b!35010 d!10402))

(declare-fun d!10404 () Bool)

(assert (=> d!10404 (= (array_inv!785 srcBuffer!2) (bvsge (size!842 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7204 d!10404))

(declare-fun d!10406 () Bool)

(assert (=> d!10406 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2544 thiss!1379) (currentByte!2549 thiss!1379) (size!842 (buf!1170 thiss!1379))))))

(declare-fun bs!2807 () Bool)

(assert (= bs!2807 d!10406))

(assert (=> bs!2807 m!53287))

(assert (=> start!7204 d!10406))

(declare-fun d!10408 () Bool)

(assert (=> d!10408 (= (bitAt!0 (buf!1170 (_1!1840 lt!52013)) lt!52017) (not (= (bvand ((_ sign_extend 24) (select (arr!1323 (buf!1170 (_1!1840 lt!52013))) ((_ extract 31 0) (bvsdiv lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2808 () Bool)

(assert (= bs!2808 d!10408))

(declare-fun m!53291 () Bool)

(assert (=> bs!2808 m!53291))

(assert (=> bs!2808 m!53265))

(assert (=> b!34999 d!10408))

(declare-fun d!10410 () Bool)

(assert (=> d!10410 (= (bitAt!0 (buf!1170 (_1!1840 lt!51998)) lt!52017) (not (= (bvand ((_ sign_extend 24) (select (arr!1323 (buf!1170 (_1!1840 lt!51998))) ((_ extract 31 0) (bvsdiv lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52017 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2809 () Bool)

(assert (= bs!2809 d!10410))

(declare-fun m!53293 () Bool)

(assert (=> bs!2809 m!53293))

(assert (=> bs!2809 m!53265))

(assert (=> b!34999 d!10410))

(declare-fun d!10412 () Bool)

(assert (=> d!10412 (= (head!270 (byteArrayBitContentToList!0 (_2!1841 lt!52006) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!548 (byteArrayBitContentToList!0 (_2!1841 lt!52006) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!35001 d!10412))

(declare-fun d!10414 () Bool)

(declare-fun c!2415 () Bool)

(assert (=> d!10414 (= c!2415 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23384 () List!433)

(assert (=> d!10414 (= (byteArrayBitContentToList!0 (_2!1841 lt!52006) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!23384)))

(declare-fun b!35433 () Bool)

(assert (=> b!35433 (= e!23384 Nil!430)))

(declare-fun b!35434 () Bool)

(assert (=> b!35434 (= e!23384 (Cons!429 (not (= (bvand ((_ sign_extend 24) (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1841 lt!52006) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10414 c!2415) b!35433))

(assert (= (and d!10414 (not c!2415)) b!35434))

(assert (=> b!35434 m!52467))

(assert (=> b!35434 m!53267))

(declare-fun m!53295 () Bool)

(assert (=> b!35434 m!53295))

(assert (=> b!35001 d!10414))

(declare-fun d!10416 () Bool)

(assert (=> d!10416 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2810 () Bool)

(assert (= bs!2810 d!10416))

(assert (=> bs!2810 m!52467))

(assert (=> bs!2810 m!53267))

(assert (=> b!35001 d!10416))

(declare-fun d!10418 () Bool)

(declare-fun res!30204 () Bool)

(declare-fun e!23385 () Bool)

(assert (=> d!10418 (=> (not res!30204) (not e!23385))))

(assert (=> d!10418 (= res!30204 (= (size!842 (buf!1170 thiss!1379)) (size!842 (buf!1170 (_2!1841 lt!52016)))))))

(assert (=> d!10418 (= (isPrefixOf!0 thiss!1379 (_2!1841 lt!52016)) e!23385)))

(declare-fun b!35435 () Bool)

(declare-fun res!30205 () Bool)

(assert (=> b!35435 (=> (not res!30205) (not e!23385))))

(assert (=> b!35435 (= res!30205 (bvsle (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)) (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016)))))))

(declare-fun b!35436 () Bool)

(declare-fun e!23386 () Bool)

(assert (=> b!35436 (= e!23385 e!23386)))

(declare-fun res!30203 () Bool)

(assert (=> b!35436 (=> res!30203 e!23386)))

(assert (=> b!35436 (= res!30203 (= (size!842 (buf!1170 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35437 () Bool)

(assert (=> b!35437 (= e!23386 (arrayBitRangesEq!0 (buf!1170 thiss!1379) (buf!1170 (_2!1841 lt!52016)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379))))))

(assert (= (and d!10418 res!30204) b!35435))

(assert (= (and b!35435 res!30205) b!35436))

(assert (= (and b!35436 (not res!30203)) b!35437))

(assert (=> b!35435 m!52415))

(assert (=> b!35435 m!52425))

(assert (=> b!35437 m!52415))

(assert (=> b!35437 m!52415))

(declare-fun m!53297 () Bool)

(assert (=> b!35437 m!53297))

(assert (=> b!35011 d!10418))

(declare-fun d!10420 () Bool)

(assert (=> d!10420 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52008) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016)))) lt!52008))))

(declare-fun bs!2811 () Bool)

(assert (= bs!2811 d!10420))

(assert (=> bs!2811 m!52821))

(assert (=> b!35011 d!10420))

(declare-fun d!10422 () Bool)

(declare-fun e!23389 () Bool)

(assert (=> d!10422 e!23389))

(declare-fun res!30208 () Bool)

(assert (=> d!10422 (=> (not res!30208) (not e!23389))))

(assert (=> d!10422 (= res!30208 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!53005 () Unit!2587)

(declare-fun choose!27 (BitStream!1464 BitStream!1464 (_ BitVec 64) (_ BitVec 64)) Unit!2587)

(assert (=> d!10422 (= lt!53005 (choose!27 thiss!1379 (_2!1841 lt!52016) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10422 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10422 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1841 lt!52016) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!53005)))

(declare-fun b!35440 () Bool)

(assert (=> b!35440 (= e!23389 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52016)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10422 res!30208) b!35440))

(declare-fun m!53299 () Bool)

(assert (=> d!10422 m!53299))

(declare-fun m!53301 () Bool)

(assert (=> b!35440 m!53301))

(assert (=> b!35011 d!10422))

(declare-fun b!35458 () Bool)

(declare-fun res!30226 () Bool)

(declare-fun e!23400 () Bool)

(assert (=> b!35458 (=> (not res!30226) (not e!23400))))

(declare-fun lt!53034 () tuple2!3508)

(assert (=> b!35458 (= res!30226 (isPrefixOf!0 thiss!1379 (_2!1841 lt!53034)))))

(declare-fun b!35459 () Bool)

(declare-fun res!30232 () Bool)

(declare-fun e!23399 () Bool)

(assert (=> b!35459 (=> (not res!30232) (not e!23399))))

(declare-fun lt!53035 () tuple2!3508)

(assert (=> b!35459 (= res!30232 (= (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!53035))) (currentByte!2549 (_2!1841 lt!53035)) (currentBit!2544 (_2!1841 lt!53035))) (bvadd (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!35460 () Bool)

(declare-fun e!23398 () Bool)

(declare-datatypes ((tuple2!3536 0))(
  ( (tuple2!3537 (_1!1855 BitStream!1464) (_2!1855 Bool)) )
))
(declare-fun lt!53037 () tuple2!3536)

(assert (=> b!35460 (= e!23398 (= (bitIndex!0 (size!842 (buf!1170 (_1!1855 lt!53037))) (currentByte!2549 (_1!1855 lt!53037)) (currentBit!2544 (_1!1855 lt!53037))) (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!53034))) (currentByte!2549 (_2!1841 lt!53034)) (currentBit!2544 (_2!1841 lt!53034)))))))

(declare-fun b!35461 () Bool)

(declare-fun res!30225 () Bool)

(assert (=> b!35461 (=> (not res!30225) (not e!23400))))

(declare-fun lt!53036 () (_ BitVec 64))

(declare-fun lt!53039 () (_ BitVec 64))

(assert (=> b!35461 (= res!30225 (= (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!53034))) (currentByte!2549 (_2!1841 lt!53034)) (currentBit!2544 (_2!1841 lt!53034))) (bvadd lt!53039 lt!53036)))))

(assert (=> b!35461 (or (not (= (bvand lt!53039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53036 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!53039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!53039 lt!53036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35461 (= lt!53036 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!35461 (= lt!53039 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(declare-fun b!35462 () Bool)

(assert (=> b!35462 (= e!23400 e!23398)))

(declare-fun res!30228 () Bool)

(assert (=> b!35462 (=> (not res!30228) (not e!23398))))

(declare-fun lt!53038 () (_ BitVec 8))

(assert (=> b!35462 (= res!30228 (and (= (_2!1855 lt!53037) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!53038)) #b00000000000000000000000000000000))) (= (_1!1855 lt!53037) (_2!1841 lt!53034))))))

(declare-fun lt!53041 () tuple2!3530)

(declare-fun lt!53040 () BitStream!1464)

(assert (=> b!35462 (= lt!53041 (readBits!0 lt!53040 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1464) tuple2!3536)

(assert (=> b!35462 (= lt!53037 (readBitPure!0 lt!53040))))

(declare-fun readerFrom!0 (BitStream!1464 (_ BitVec 32) (_ BitVec 32)) BitStream!1464)

(assert (=> b!35462 (= lt!53040 (readerFrom!0 (_2!1841 lt!53034) (currentBit!2544 thiss!1379) (currentByte!2549 thiss!1379)))))

(declare-fun b!35463 () Bool)

(declare-fun e!23401 () Bool)

(declare-fun lt!53030 () tuple2!3536)

(assert (=> b!35463 (= e!23401 (= (bitIndex!0 (size!842 (buf!1170 (_1!1855 lt!53030))) (currentByte!2549 (_1!1855 lt!53030)) (currentBit!2544 (_1!1855 lt!53030))) (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!53035))) (currentByte!2549 (_2!1841 lt!53035)) (currentBit!2544 (_2!1841 lt!53035)))))))

(declare-fun b!35464 () Bool)

(assert (=> b!35464 (= e!23399 e!23401)))

(declare-fun res!30231 () Bool)

(assert (=> b!35464 (=> (not res!30231) (not e!23401))))

(declare-fun lt!53031 () Bool)

(assert (=> b!35464 (= res!30231 (and (= (_2!1855 lt!53030) lt!53031) (= (_1!1855 lt!53030) (_2!1841 lt!53035))))))

(assert (=> b!35464 (= lt!53030 (readBitPure!0 (readerFrom!0 (_2!1841 lt!53035) (currentBit!2544 thiss!1379) (currentByte!2549 thiss!1379))))))

(declare-fun d!10424 () Bool)

(assert (=> d!10424 e!23400))

(declare-fun res!30229 () Bool)

(assert (=> d!10424 (=> (not res!30229) (not e!23400))))

(assert (=> d!10424 (= res!30229 (= (size!842 (buf!1170 (_2!1841 lt!53034))) (size!842 (buf!1170 thiss!1379))))))

(declare-fun lt!53033 () array!1894)

(assert (=> d!10424 (= lt!53038 (select (arr!1323 lt!53033) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10424 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!842 lt!53033)))))

(assert (=> d!10424 (= lt!53033 (array!1895 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!53032 () tuple2!3508)

(assert (=> d!10424 (= lt!53034 (tuple2!3509 (_1!1841 lt!53032) (_2!1841 lt!53032)))))

(assert (=> d!10424 (= lt!53032 lt!53035)))

(assert (=> d!10424 e!23399))

(declare-fun res!30230 () Bool)

(assert (=> d!10424 (=> (not res!30230) (not e!23399))))

(assert (=> d!10424 (= res!30230 (= (size!842 (buf!1170 thiss!1379)) (size!842 (buf!1170 (_2!1841 lt!53035)))))))

(declare-fun appendBit!0 (BitStream!1464 Bool) tuple2!3508)

(assert (=> d!10424 (= lt!53035 (appendBit!0 thiss!1379 lt!53031))))

(assert (=> d!10424 (= lt!53031 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10424 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10424 (= (appendBitFromByte!0 thiss!1379 (select (arr!1323 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!53034)))

(declare-fun b!35465 () Bool)

(declare-fun res!30227 () Bool)

(assert (=> b!35465 (=> (not res!30227) (not e!23399))))

(assert (=> b!35465 (= res!30227 (isPrefixOf!0 thiss!1379 (_2!1841 lt!53035)))))

(assert (= (and d!10424 res!30230) b!35459))

(assert (= (and b!35459 res!30232) b!35465))

(assert (= (and b!35465 res!30227) b!35464))

(assert (= (and b!35464 res!30231) b!35463))

(assert (= (and d!10424 res!30229) b!35461))

(assert (= (and b!35461 res!30225) b!35458))

(assert (= (and b!35458 res!30226) b!35462))

(assert (= (and b!35462 res!30228) b!35460))

(declare-fun m!53303 () Bool)

(assert (=> b!35464 m!53303))

(assert (=> b!35464 m!53303))

(declare-fun m!53305 () Bool)

(assert (=> b!35464 m!53305))

(declare-fun m!53307 () Bool)

(assert (=> b!35460 m!53307))

(declare-fun m!53309 () Bool)

(assert (=> b!35460 m!53309))

(declare-fun m!53311 () Bool)

(assert (=> b!35465 m!53311))

(assert (=> b!35461 m!53309))

(assert (=> b!35461 m!52415))

(declare-fun m!53313 () Bool)

(assert (=> b!35458 m!53313))

(declare-fun m!53315 () Bool)

(assert (=> b!35463 m!53315))

(declare-fun m!53317 () Bool)

(assert (=> b!35463 m!53317))

(declare-fun m!53319 () Bool)

(assert (=> b!35462 m!53319))

(declare-fun m!53321 () Bool)

(assert (=> b!35462 m!53321))

(declare-fun m!53323 () Bool)

(assert (=> b!35462 m!53323))

(assert (=> b!35459 m!53317))

(assert (=> b!35459 m!52415))

(declare-fun m!53325 () Bool)

(assert (=> d!10424 m!53325))

(declare-fun m!53327 () Bool)

(assert (=> d!10424 m!53327))

(assert (=> d!10424 m!53267))

(assert (=> b!35011 d!10424))

(declare-fun d!10426 () Bool)

(declare-fun e!23402 () Bool)

(assert (=> d!10426 e!23402))

(declare-fun res!30233 () Bool)

(assert (=> d!10426 (=> (not res!30233) (not e!23402))))

(declare-fun lt!53042 () (_ BitVec 64))

(declare-fun lt!53046 () (_ BitVec 64))

(declare-fun lt!53044 () (_ BitVec 64))

(assert (=> d!10426 (= res!30233 (= lt!53042 (bvsub lt!53046 lt!53044)))))

(assert (=> d!10426 (or (= (bvand lt!53046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53044 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53046 lt!53044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10426 (= lt!53044 (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52006))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52006)))))))

(declare-fun lt!53047 () (_ BitVec 64))

(declare-fun lt!53045 () (_ BitVec 64))

(assert (=> d!10426 (= lt!53046 (bvmul lt!53047 lt!53045))))

(assert (=> d!10426 (or (= lt!53047 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!53045 (bvsdiv (bvmul lt!53047 lt!53045) lt!53047)))))

(assert (=> d!10426 (= lt!53045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10426 (= lt!53047 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))))))

(assert (=> d!10426 (= lt!53042 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52006))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52006)))))))

(assert (=> d!10426 (invariant!0 (currentBit!2544 (_2!1841 lt!52006)) (currentByte!2549 (_2!1841 lt!52006)) (size!842 (buf!1170 (_2!1841 lt!52006))))))

(assert (=> d!10426 (= (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52006))) (currentByte!2549 (_2!1841 lt!52006)) (currentBit!2544 (_2!1841 lt!52006))) lt!53042)))

(declare-fun b!35466 () Bool)

(declare-fun res!30234 () Bool)

(assert (=> b!35466 (=> (not res!30234) (not e!23402))))

(assert (=> b!35466 (= res!30234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53042))))

(declare-fun b!35467 () Bool)

(declare-fun lt!53043 () (_ BitVec 64))

(assert (=> b!35467 (= e!23402 (bvsle lt!53042 (bvmul lt!53043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35467 (or (= lt!53043 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!53043 #b0000000000000000000000000000000000000000000000000000000000001000) lt!53043)))))

(assert (=> b!35467 (= lt!53043 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))))))

(assert (= (and d!10426 res!30233) b!35466))

(assert (= (and b!35466 res!30234) b!35467))

(declare-fun m!53329 () Bool)

(assert (=> d!10426 m!53329))

(assert (=> d!10426 m!52423))

(assert (=> b!35013 d!10426))

(declare-fun d!10428 () Bool)

(assert (=> d!10428 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2812 () Bool)

(assert (= bs!2812 d!10428))

(declare-fun m!53331 () Bool)

(assert (=> bs!2812 m!53331))

(assert (=> b!35002 d!10428))

(declare-fun d!10430 () Bool)

(assert (=> d!10430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52008) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016)))) lt!52008))))

(declare-fun bs!2813 () Bool)

(assert (= bs!2813 d!10430))

(declare-fun m!53333 () Bool)

(assert (=> bs!2813 m!53333))

(assert (=> b!35002 d!10430))

(declare-fun d!10432 () Bool)

(assert (=> d!10432 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 thiss!1379)) ((_ sign_extend 32) (currentBit!2544 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53048 () Unit!2587)

(assert (=> d!10432 (= lt!53048 (choose!9 thiss!1379 (buf!1170 (_2!1841 lt!52006)) (bvsub to!314 i!635) (BitStream!1465 (buf!1170 (_2!1841 lt!52006)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379))))))

(assert (=> d!10432 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1170 (_2!1841 lt!52006)) (bvsub to!314 i!635)) lt!53048)))

(declare-fun bs!2814 () Bool)

(assert (= bs!2814 d!10432))

(assert (=> bs!2814 m!52481))

(declare-fun m!53335 () Bool)

(assert (=> bs!2814 m!53335))

(assert (=> b!35002 d!10432))

(declare-fun b!35468 () Bool)

(declare-fun e!23403 () Unit!2587)

(declare-fun Unit!2619 () Unit!2587)

(assert (=> b!35468 (= e!23403 Unit!2619)))

(declare-fun b!35469 () Bool)

(declare-fun res!30236 () Bool)

(declare-fun e!23404 () Bool)

(assert (=> b!35469 (=> (not res!30236) (not e!23404))))

(declare-fun lt!53059 () tuple2!3506)

(assert (=> b!35469 (= res!30236 (isPrefixOf!0 (_2!1840 lt!53059) (_2!1841 lt!52006)))))

(declare-fun b!35470 () Bool)

(declare-fun res!30235 () Bool)

(assert (=> b!35470 (=> (not res!30235) (not e!23404))))

(assert (=> b!35470 (= res!30235 (isPrefixOf!0 (_1!1840 lt!53059) (_2!1841 lt!52016)))))

(declare-fun d!10434 () Bool)

(assert (=> d!10434 e!23404))

(declare-fun res!30237 () Bool)

(assert (=> d!10434 (=> (not res!30237) (not e!23404))))

(assert (=> d!10434 (= res!30237 (isPrefixOf!0 (_1!1840 lt!53059) (_2!1840 lt!53059)))))

(declare-fun lt!53068 () BitStream!1464)

(assert (=> d!10434 (= lt!53059 (tuple2!3507 lt!53068 (_2!1841 lt!52006)))))

(declare-fun lt!53052 () Unit!2587)

(declare-fun lt!53049 () Unit!2587)

(assert (=> d!10434 (= lt!53052 lt!53049)))

(assert (=> d!10434 (isPrefixOf!0 lt!53068 (_2!1841 lt!52006))))

(assert (=> d!10434 (= lt!53049 (lemmaIsPrefixTransitive!0 lt!53068 (_2!1841 lt!52006) (_2!1841 lt!52006)))))

(declare-fun lt!53067 () Unit!2587)

(declare-fun lt!53065 () Unit!2587)

(assert (=> d!10434 (= lt!53067 lt!53065)))

(assert (=> d!10434 (isPrefixOf!0 lt!53068 (_2!1841 lt!52006))))

(assert (=> d!10434 (= lt!53065 (lemmaIsPrefixTransitive!0 lt!53068 (_2!1841 lt!52016) (_2!1841 lt!52006)))))

(declare-fun lt!53058 () Unit!2587)

(assert (=> d!10434 (= lt!53058 e!23403)))

(declare-fun c!2416 () Bool)

(assert (=> d!10434 (= c!2416 (not (= (size!842 (buf!1170 (_2!1841 lt!52016))) #b00000000000000000000000000000000)))))

(declare-fun lt!53054 () Unit!2587)

(declare-fun lt!53056 () Unit!2587)

(assert (=> d!10434 (= lt!53054 lt!53056)))

(assert (=> d!10434 (isPrefixOf!0 (_2!1841 lt!52006) (_2!1841 lt!52006))))

(assert (=> d!10434 (= lt!53056 (lemmaIsPrefixRefl!0 (_2!1841 lt!52006)))))

(declare-fun lt!53053 () Unit!2587)

(declare-fun lt!53057 () Unit!2587)

(assert (=> d!10434 (= lt!53053 lt!53057)))

(assert (=> d!10434 (= lt!53057 (lemmaIsPrefixRefl!0 (_2!1841 lt!52006)))))

(declare-fun lt!53050 () Unit!2587)

(declare-fun lt!53063 () Unit!2587)

(assert (=> d!10434 (= lt!53050 lt!53063)))

(assert (=> d!10434 (isPrefixOf!0 lt!53068 lt!53068)))

(assert (=> d!10434 (= lt!53063 (lemmaIsPrefixRefl!0 lt!53068))))

(declare-fun lt!53064 () Unit!2587)

(declare-fun lt!53062 () Unit!2587)

(assert (=> d!10434 (= lt!53064 lt!53062)))

(assert (=> d!10434 (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52016))))

(assert (=> d!10434 (= lt!53062 (lemmaIsPrefixRefl!0 (_2!1841 lt!52016)))))

(assert (=> d!10434 (= lt!53068 (BitStream!1465 (buf!1170 (_2!1841 lt!52006)) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))))))

(assert (=> d!10434 (isPrefixOf!0 (_2!1841 lt!52016) (_2!1841 lt!52006))))

(assert (=> d!10434 (= (reader!0 (_2!1841 lt!52016) (_2!1841 lt!52006)) lt!53059)))

(declare-fun b!35471 () Bool)

(declare-fun lt!53051 () (_ BitVec 64))

(declare-fun lt!53066 () (_ BitVec 64))

(assert (=> b!35471 (= e!23404 (= (_1!1840 lt!53059) (withMovedBitIndex!0 (_2!1840 lt!53059) (bvsub lt!53066 lt!53051))))))

(assert (=> b!35471 (or (= (bvand lt!53066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53051 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53066 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53066 lt!53051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35471 (= lt!53051 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52006))) (currentByte!2549 (_2!1841 lt!52006)) (currentBit!2544 (_2!1841 lt!52006))))))

(assert (=> b!35471 (= lt!53066 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))))))

(declare-fun b!35472 () Bool)

(declare-fun lt!53055 () Unit!2587)

(assert (=> b!35472 (= e!23403 lt!53055)))

(declare-fun lt!53061 () (_ BitVec 64))

(assert (=> b!35472 (= lt!53061 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53060 () (_ BitVec 64))

(assert (=> b!35472 (= lt!53060 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52016))) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016))))))

(assert (=> b!35472 (= lt!53055 (arrayBitRangesEqSymmetric!0 (buf!1170 (_2!1841 lt!52016)) (buf!1170 (_2!1841 lt!52006)) lt!53061 lt!53060))))

(assert (=> b!35472 (arrayBitRangesEq!0 (buf!1170 (_2!1841 lt!52006)) (buf!1170 (_2!1841 lt!52016)) lt!53061 lt!53060)))

(assert (= (and d!10434 c!2416) b!35472))

(assert (= (and d!10434 (not c!2416)) b!35468))

(assert (= (and d!10434 res!30237) b!35470))

(assert (= (and b!35470 res!30235) b!35469))

(assert (= (and b!35469 res!30236) b!35471))

(declare-fun m!53337 () Bool)

(assert (=> b!35470 m!53337))

(declare-fun m!53339 () Bool)

(assert (=> b!35469 m!53339))

(assert (=> b!35472 m!52425))

(declare-fun m!53341 () Bool)

(assert (=> b!35472 m!53341))

(declare-fun m!53343 () Bool)

(assert (=> b!35472 m!53343))

(declare-fun m!53345 () Bool)

(assert (=> b!35471 m!53345))

(assert (=> b!35471 m!52417))

(assert (=> b!35471 m!52425))

(assert (=> d!10434 m!52849))

(assert (=> d!10434 m!52851))

(declare-fun m!53347 () Bool)

(assert (=> d!10434 m!53347))

(declare-fun m!53349 () Bool)

(assert (=> d!10434 m!53349))

(declare-fun m!53351 () Bool)

(assert (=> d!10434 m!53351))

(declare-fun m!53353 () Bool)

(assert (=> d!10434 m!53353))

(declare-fun m!53355 () Bool)

(assert (=> d!10434 m!53355))

(declare-fun m!53357 () Bool)

(assert (=> d!10434 m!53357))

(assert (=> d!10434 m!52451))

(declare-fun m!53359 () Bool)

(assert (=> d!10434 m!53359))

(declare-fun m!53361 () Bool)

(assert (=> d!10434 m!53361))

(assert (=> b!35002 d!10434))

(declare-fun d!10436 () Bool)

(assert (=> d!10436 (validate_offset_bits!1 ((_ sign_extend 32) (size!842 (buf!1170 (_2!1841 lt!52006)))) ((_ sign_extend 32) (currentByte!2549 (_2!1841 lt!52016))) ((_ sign_extend 32) (currentBit!2544 (_2!1841 lt!52016))) lt!52008)))

(declare-fun lt!53069 () Unit!2587)

(assert (=> d!10436 (= lt!53069 (choose!9 (_2!1841 lt!52016) (buf!1170 (_2!1841 lt!52006)) lt!52008 (BitStream!1465 (buf!1170 (_2!1841 lt!52006)) (currentByte!2549 (_2!1841 lt!52016)) (currentBit!2544 (_2!1841 lt!52016)))))))

(assert (=> d!10436 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1841 lt!52016) (buf!1170 (_2!1841 lt!52006)) lt!52008) lt!53069)))

(declare-fun bs!2815 () Bool)

(assert (= bs!2815 d!10436))

(assert (=> bs!2815 m!52485))

(declare-fun m!53363 () Bool)

(assert (=> bs!2815 m!53363))

(assert (=> b!35002 d!10436))

(declare-fun b!35476 () Bool)

(declare-fun e!23405 () Bool)

(declare-fun lt!53072 () List!433)

(assert (=> b!35476 (= e!23405 (> (length!159 lt!53072) 0))))

(declare-fun d!10438 () Bool)

(assert (=> d!10438 e!23405))

(declare-fun c!2418 () Bool)

(assert (=> d!10438 (= c!2418 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23406 () tuple2!3532)

(assert (=> d!10438 (= lt!53072 (_1!1853 e!23406))))

(declare-fun c!2417 () Bool)

(assert (=> d!10438 (= c!2417 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10438 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10438 (= (bitStreamReadBitsIntoList!0 (_2!1841 lt!52006) (_1!1840 lt!51998) (bvsub to!314 i!635)) lt!53072)))

(declare-fun b!35474 () Bool)

(declare-fun lt!53070 () (_ BitVec 64))

(declare-fun lt!53071 () tuple2!3534)

(assert (=> b!35474 (= e!23406 (tuple2!3533 (Cons!429 (_1!1854 lt!53071) (bitStreamReadBitsIntoList!0 (_2!1841 lt!52006) (_2!1854 lt!53071) (bvsub (bvsub to!314 i!635) lt!53070))) (_2!1854 lt!53071)))))

(assert (=> b!35474 (= lt!53071 (readBit!0 (_1!1840 lt!51998)))))

(assert (=> b!35474 (= lt!53070 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!35473 () Bool)

(assert (=> b!35473 (= e!23406 (tuple2!3533 Nil!430 (_1!1840 lt!51998)))))

(declare-fun b!35475 () Bool)

(assert (=> b!35475 (= e!23405 (isEmpty!98 lt!53072))))

(assert (= (and d!10438 c!2417) b!35473))

(assert (= (and d!10438 (not c!2417)) b!35474))

(assert (= (and d!10438 c!2418) b!35475))

(assert (= (and d!10438 (not c!2418)) b!35476))

(declare-fun m!53365 () Bool)

(assert (=> b!35476 m!53365))

(declare-fun m!53367 () Bool)

(assert (=> b!35474 m!53367))

(declare-fun m!53369 () Bool)

(assert (=> b!35474 m!53369))

(declare-fun m!53371 () Bool)

(assert (=> b!35475 m!53371))

(assert (=> b!35002 d!10438))

(declare-fun b!35477 () Bool)

(declare-fun e!23407 () Unit!2587)

(declare-fun Unit!2620 () Unit!2587)

(assert (=> b!35477 (= e!23407 Unit!2620)))

(declare-fun b!35478 () Bool)

(declare-fun res!30239 () Bool)

(declare-fun e!23408 () Bool)

(assert (=> b!35478 (=> (not res!30239) (not e!23408))))

(declare-fun lt!53083 () tuple2!3506)

(assert (=> b!35478 (= res!30239 (isPrefixOf!0 (_2!1840 lt!53083) (_2!1841 lt!52006)))))

(declare-fun b!35479 () Bool)

(declare-fun res!30238 () Bool)

(assert (=> b!35479 (=> (not res!30238) (not e!23408))))

(assert (=> b!35479 (= res!30238 (isPrefixOf!0 (_1!1840 lt!53083) thiss!1379))))

(declare-fun d!10440 () Bool)

(assert (=> d!10440 e!23408))

(declare-fun res!30240 () Bool)

(assert (=> d!10440 (=> (not res!30240) (not e!23408))))

(assert (=> d!10440 (= res!30240 (isPrefixOf!0 (_1!1840 lt!53083) (_2!1840 lt!53083)))))

(declare-fun lt!53092 () BitStream!1464)

(assert (=> d!10440 (= lt!53083 (tuple2!3507 lt!53092 (_2!1841 lt!52006)))))

(declare-fun lt!53076 () Unit!2587)

(declare-fun lt!53073 () Unit!2587)

(assert (=> d!10440 (= lt!53076 lt!53073)))

(assert (=> d!10440 (isPrefixOf!0 lt!53092 (_2!1841 lt!52006))))

(assert (=> d!10440 (= lt!53073 (lemmaIsPrefixTransitive!0 lt!53092 (_2!1841 lt!52006) (_2!1841 lt!52006)))))

(declare-fun lt!53091 () Unit!2587)

(declare-fun lt!53089 () Unit!2587)

(assert (=> d!10440 (= lt!53091 lt!53089)))

(assert (=> d!10440 (isPrefixOf!0 lt!53092 (_2!1841 lt!52006))))

(assert (=> d!10440 (= lt!53089 (lemmaIsPrefixTransitive!0 lt!53092 thiss!1379 (_2!1841 lt!52006)))))

(declare-fun lt!53082 () Unit!2587)

(assert (=> d!10440 (= lt!53082 e!23407)))

(declare-fun c!2419 () Bool)

(assert (=> d!10440 (= c!2419 (not (= (size!842 (buf!1170 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!53078 () Unit!2587)

(declare-fun lt!53080 () Unit!2587)

(assert (=> d!10440 (= lt!53078 lt!53080)))

(assert (=> d!10440 (isPrefixOf!0 (_2!1841 lt!52006) (_2!1841 lt!52006))))

(assert (=> d!10440 (= lt!53080 (lemmaIsPrefixRefl!0 (_2!1841 lt!52006)))))

(declare-fun lt!53077 () Unit!2587)

(declare-fun lt!53081 () Unit!2587)

(assert (=> d!10440 (= lt!53077 lt!53081)))

(assert (=> d!10440 (= lt!53081 (lemmaIsPrefixRefl!0 (_2!1841 lt!52006)))))

(declare-fun lt!53074 () Unit!2587)

(declare-fun lt!53087 () Unit!2587)

(assert (=> d!10440 (= lt!53074 lt!53087)))

(assert (=> d!10440 (isPrefixOf!0 lt!53092 lt!53092)))

(assert (=> d!10440 (= lt!53087 (lemmaIsPrefixRefl!0 lt!53092))))

(declare-fun lt!53088 () Unit!2587)

(declare-fun lt!53086 () Unit!2587)

(assert (=> d!10440 (= lt!53088 lt!53086)))

(assert (=> d!10440 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10440 (= lt!53086 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10440 (= lt!53092 (BitStream!1465 (buf!1170 (_2!1841 lt!52006)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(assert (=> d!10440 (isPrefixOf!0 thiss!1379 (_2!1841 lt!52006))))

(assert (=> d!10440 (= (reader!0 thiss!1379 (_2!1841 lt!52006)) lt!53083)))

(declare-fun lt!53075 () (_ BitVec 64))

(declare-fun b!35480 () Bool)

(declare-fun lt!53090 () (_ BitVec 64))

(assert (=> b!35480 (= e!23408 (= (_1!1840 lt!53083) (withMovedBitIndex!0 (_2!1840 lt!53083) (bvsub lt!53090 lt!53075))))))

(assert (=> b!35480 (or (= (bvand lt!53090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53090 lt!53075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35480 (= lt!53075 (bitIndex!0 (size!842 (buf!1170 (_2!1841 lt!52006))) (currentByte!2549 (_2!1841 lt!52006)) (currentBit!2544 (_2!1841 lt!52006))))))

(assert (=> b!35480 (= lt!53090 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(declare-fun b!35481 () Bool)

(declare-fun lt!53079 () Unit!2587)

(assert (=> b!35481 (= e!23407 lt!53079)))

(declare-fun lt!53085 () (_ BitVec 64))

(assert (=> b!35481 (= lt!53085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53084 () (_ BitVec 64))

(assert (=> b!35481 (= lt!53084 (bitIndex!0 (size!842 (buf!1170 thiss!1379)) (currentByte!2549 thiss!1379) (currentBit!2544 thiss!1379)))))

(assert (=> b!35481 (= lt!53079 (arrayBitRangesEqSymmetric!0 (buf!1170 thiss!1379) (buf!1170 (_2!1841 lt!52006)) lt!53085 lt!53084))))

(assert (=> b!35481 (arrayBitRangesEq!0 (buf!1170 (_2!1841 lt!52006)) (buf!1170 thiss!1379) lt!53085 lt!53084)))

(assert (= (and d!10440 c!2419) b!35481))

(assert (= (and d!10440 (not c!2419)) b!35477))

(assert (= (and d!10440 res!30240) b!35479))

(assert (= (and b!35479 res!30238) b!35478))

(assert (= (and b!35478 res!30239) b!35480))

(declare-fun m!53373 () Bool)

(assert (=> b!35479 m!53373))

(declare-fun m!53375 () Bool)

(assert (=> b!35478 m!53375))

(assert (=> b!35481 m!52415))

(declare-fun m!53377 () Bool)

(assert (=> b!35481 m!53377))

(declare-fun m!53379 () Bool)

(assert (=> b!35481 m!53379))

(declare-fun m!53381 () Bool)

(assert (=> b!35480 m!53381))

(assert (=> b!35480 m!52417))

(assert (=> b!35480 m!52415))

(assert (=> d!10440 m!52413))

(assert (=> d!10440 m!52411))

(declare-fun m!53383 () Bool)

(assert (=> d!10440 m!53383))

(declare-fun m!53385 () Bool)

(assert (=> d!10440 m!53385))

(declare-fun m!53387 () Bool)

(assert (=> d!10440 m!53387))

(declare-fun m!53389 () Bool)

(assert (=> d!10440 m!53389))

(declare-fun m!53391 () Bool)

(assert (=> d!10440 m!53391))

(assert (=> d!10440 m!53357))

(assert (=> d!10440 m!52447))

(assert (=> d!10440 m!53359))

(declare-fun m!53393 () Bool)

(assert (=> d!10440 m!53393))

(assert (=> b!35002 d!10440))

(declare-fun b!35485 () Bool)

(declare-fun e!23409 () Bool)

(declare-fun lt!53095 () List!433)

(assert (=> b!35485 (= e!23409 (> (length!159 lt!53095) 0))))

(declare-fun d!10442 () Bool)

(assert (=> d!10442 e!23409))

(declare-fun c!2421 () Bool)

(assert (=> d!10442 (= c!2421 (= lt!52008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23410 () tuple2!3532)

(assert (=> d!10442 (= lt!53095 (_1!1853 e!23410))))

(declare-fun c!2420 () Bool)

(assert (=> d!10442 (= c!2420 (= lt!52008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10442 (bvsge lt!52008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10442 (= (bitStreamReadBitsIntoList!0 (_2!1841 lt!52006) (_1!1840 lt!52013) lt!52008) lt!53095)))

(declare-fun b!35483 () Bool)

(declare-fun lt!53094 () tuple2!3534)

(declare-fun lt!53093 () (_ BitVec 64))

(assert (=> b!35483 (= e!23410 (tuple2!3533 (Cons!429 (_1!1854 lt!53094) (bitStreamReadBitsIntoList!0 (_2!1841 lt!52006) (_2!1854 lt!53094) (bvsub lt!52008 lt!53093))) (_2!1854 lt!53094)))))

(assert (=> b!35483 (= lt!53094 (readBit!0 (_1!1840 lt!52013)))))

(assert (=> b!35483 (= lt!53093 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!35482 () Bool)

(assert (=> b!35482 (= e!23410 (tuple2!3533 Nil!430 (_1!1840 lt!52013)))))

(declare-fun b!35484 () Bool)

(assert (=> b!35484 (= e!23409 (isEmpty!98 lt!53095))))

(assert (= (and d!10442 c!2420) b!35482))

(assert (= (and d!10442 (not c!2420)) b!35483))

(assert (= (and d!10442 c!2421) b!35484))

(assert (= (and d!10442 (not c!2421)) b!35485))

(declare-fun m!53395 () Bool)

(assert (=> b!35485 m!53395))

(declare-fun m!53397 () Bool)

(assert (=> b!35483 m!53397))

(declare-fun m!53399 () Bool)

(assert (=> b!35483 m!53399))

(declare-fun m!53401 () Bool)

(assert (=> b!35484 m!53401))

(assert (=> b!35002 d!10442))

(check-sat (not b!35259) (not b!35460) (not b!35426) (not d!10370) (not b!35471) (not b!35248) (not b!35459) (not b!35463) (not b!35485) (not b!35480) (not b!35478) (not d!10440) (not d!10366) (not b!35430) (not d!10422) (not b!35402) (not b!35250) (not b!35461) (not d!10434) (not b!35399) (not b!35235) (not b!35437) (not d!10286) (not b!35257) (not d!10428) (not b!35472) (not b!35415) (not b!35400) (not b!35405) (not d!10436) (not d!10420) (not b!35464) (not b!35425) (not b!35249) (not d!10282) (not d!10432) (not b!35462) (not b!35407) (not d!10430) (not b!35435) (not d!10392) (not b!35474) (not b!35434) (not b!35469) (not b!35458) (not d!10424) (not d!10288) (not d!10278) (not b!35427) (not bm!442) (not b!35409) (not d!10394) (not b!35404) (not b!35484) (not d!10406) (not b!35475) (not b!35465) (not d!10426) (not b!35440) (not b!35476) (not d!10284) (not d!10292) (not b!35483) (not d!10396) (not b!35403) (not b!35470) (not b!35247) (not b!35428) (not d!10388) (not b!35479) (not b!35481))
(check-sat)
