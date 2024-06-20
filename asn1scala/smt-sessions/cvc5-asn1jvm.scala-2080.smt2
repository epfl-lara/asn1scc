; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52640 () Bool)

(assert start!52640)

(declare-fun b!243568 () Bool)

(declare-fun e!168849 () Bool)

(declare-fun e!168848 () Bool)

(assert (=> b!243568 (= e!168849 e!168848)))

(declare-fun res!203510 () Bool)

(assert (=> b!243568 (=> (not res!203510) (not e!168848))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((array!13352 0))(
  ( (array!13353 (arr!6841 (Array (_ BitVec 32) (_ BitVec 8))) (size!5854 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10630 0))(
  ( (BitStream!10631 (buf!6323 array!13352) (currentByte!11695 (_ BitVec 32)) (currentBit!11690 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17797 0))(
  ( (Unit!17798) )
))
(declare-datatypes ((tuple2!20880 0))(
  ( (tuple2!20881 (_1!11362 Unit!17797) (_2!11362 BitStream!10630)) )
))
(declare-fun lt!379520 () tuple2!20880)

(declare-datatypes ((tuple2!20882 0))(
  ( (tuple2!20883 (_1!11363 BitStream!10630) (_2!11363 Bool)) )
))
(declare-fun lt!379523 () tuple2!20882)

(assert (=> b!243568 (= res!203510 (and (= (_2!11363 lt!379523) bit!26) (= (_1!11363 lt!379523) (_2!11362 lt!379520))))))

(declare-fun thiss!1005 () BitStream!10630)

(declare-fun readBitPure!0 (BitStream!10630) tuple2!20882)

(declare-fun readerFrom!0 (BitStream!10630 (_ BitVec 32) (_ BitVec 32)) BitStream!10630)

(assert (=> b!243568 (= lt!379523 (readBitPure!0 (readerFrom!0 (_2!11362 lt!379520) (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005))))))

(declare-fun b!243569 () Bool)

(declare-fun res!203507 () Bool)

(declare-fun e!168845 () Bool)

(assert (=> b!243569 (=> (not res!203507) (not e!168845))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!243569 (= res!203507 (bvslt from!289 nBits!297))))

(declare-fun b!243570 () Bool)

(declare-datatypes ((tuple2!20884 0))(
  ( (tuple2!20885 (_1!11364 BitStream!10630) (_2!11364 BitStream!10630)) )
))
(declare-fun lt!379525 () tuple2!20884)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243570 (= e!168845 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11364 lt!379525)))) ((_ sign_extend 32) (currentByte!11695 (_1!11364 lt!379525))) ((_ sign_extend 32) (currentBit!11690 (_1!11364 lt!379525))) (bvsub nBits!297 from!289))))))

(declare-fun lt!379526 () tuple2!20880)

(assert (=> b!243570 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379524 () Unit!17797)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10630 array!13352 (_ BitVec 64)) Unit!17797)

(assert (=> b!243570 (= lt!379524 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6323 (_2!11362 lt!379526)) (bvsub nBits!297 from!289)))))

(assert (=> b!243570 (= (_2!11363 (readBitPure!0 (_1!11364 lt!379525))) bit!26)))

(declare-fun lt!379517 () tuple2!20884)

(declare-fun reader!0 (BitStream!10630 BitStream!10630) tuple2!20884)

(assert (=> b!243570 (= lt!379517 (reader!0 (_2!11362 lt!379520) (_2!11362 lt!379526)))))

(assert (=> b!243570 (= lt!379525 (reader!0 thiss!1005 (_2!11362 lt!379526)))))

(declare-fun e!168842 () Bool)

(assert (=> b!243570 e!168842))

(declare-fun res!203509 () Bool)

(assert (=> b!243570 (=> (not res!203509) (not e!168842))))

(declare-fun lt!379521 () tuple2!20882)

(declare-fun lt!379528 () tuple2!20882)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243570 (= res!203509 (= (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379521))) (currentByte!11695 (_1!11363 lt!379521)) (currentBit!11690 (_1!11363 lt!379521))) (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379528))) (currentByte!11695 (_1!11363 lt!379528)) (currentBit!11690 (_1!11363 lt!379528)))))))

(declare-fun lt!379527 () Unit!17797)

(declare-fun lt!379515 () BitStream!10630)

(declare-fun readBitPrefixLemma!0 (BitStream!10630 BitStream!10630) Unit!17797)

(assert (=> b!243570 (= lt!379527 (readBitPrefixLemma!0 lt!379515 (_2!11362 lt!379526)))))

(assert (=> b!243570 (= lt!379528 (readBitPure!0 (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005))))))

(assert (=> b!243570 (= lt!379521 (readBitPure!0 lt!379515))))

(assert (=> b!243570 (= lt!379515 (BitStream!10631 (buf!6323 (_2!11362 lt!379520)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)))))

(declare-fun e!168851 () Bool)

(assert (=> b!243570 e!168851))

(declare-fun res!203514 () Bool)

(assert (=> b!243570 (=> (not res!203514) (not e!168851))))

(declare-fun isPrefixOf!0 (BitStream!10630 BitStream!10630) Bool)

(assert (=> b!243570 (= res!203514 (isPrefixOf!0 thiss!1005 (_2!11362 lt!379526)))))

(declare-fun lt!379514 () Unit!17797)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10630 BitStream!10630 BitStream!10630) Unit!17797)

(assert (=> b!243570 (= lt!379514 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11362 lt!379520) (_2!11362 lt!379526)))))

(declare-fun e!168847 () Bool)

(assert (=> b!243570 e!168847))

(declare-fun res!203508 () Bool)

(assert (=> b!243570 (=> (not res!203508) (not e!168847))))

(assert (=> b!243570 (= res!203508 (= (size!5854 (buf!6323 (_2!11362 lt!379520))) (size!5854 (buf!6323 (_2!11362 lt!379526)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10630 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20880)

(assert (=> b!243570 (= lt!379526 (appendNBitsLoop!0 (_2!11362 lt!379520) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243570 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379516 () Unit!17797)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10630 BitStream!10630 (_ BitVec 64) (_ BitVec 64)) Unit!17797)

(assert (=> b!243570 (= lt!379516 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11362 lt!379520) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168843 () Bool)

(assert (=> b!243570 e!168843))

(declare-fun res!203503 () Bool)

(assert (=> b!243570 (=> (not res!203503) (not e!168843))))

(assert (=> b!243570 (= res!203503 (= (size!5854 (buf!6323 thiss!1005)) (size!5854 (buf!6323 (_2!11362 lt!379520)))))))

(declare-fun appendBit!0 (BitStream!10630 Bool) tuple2!20880)

(assert (=> b!243570 (= lt!379520 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243571 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243571 (= e!168851 (invariant!0 (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379526)))))))

(declare-fun b!243572 () Bool)

(declare-fun res!203502 () Bool)

(declare-fun e!168846 () Bool)

(assert (=> b!243572 (=> (not res!203502) (not e!168846))))

(assert (=> b!243572 (= res!203502 (isPrefixOf!0 (_2!11362 lt!379520) (_2!11362 lt!379526)))))

(declare-fun b!243574 () Bool)

(declare-fun res!203512 () Bool)

(assert (=> b!243574 (=> (not res!203512) (not e!168849))))

(assert (=> b!243574 (= res!203512 (isPrefixOf!0 thiss!1005 (_2!11362 lt!379520)))))

(declare-fun b!243575 () Bool)

(declare-fun e!168844 () Bool)

(declare-fun array_inv!5595 (array!13352) Bool)

(assert (=> b!243575 (= e!168844 (array_inv!5595 (buf!6323 thiss!1005)))))

(declare-fun b!243576 () Bool)

(assert (=> b!243576 (= e!168847 e!168846)))

(declare-fun res!203513 () Bool)

(assert (=> b!243576 (=> (not res!203513) (not e!168846))))

(declare-fun lt!379519 () (_ BitVec 64))

(assert (=> b!243576 (= res!203513 (= (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379526))) (currentByte!11695 (_2!11362 lt!379526)) (currentBit!11690 (_2!11362 lt!379526))) (bvadd (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))) lt!379519)))))

(assert (=> b!243576 (= lt!379519 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243577 () Bool)

(assert (=> b!243577 (= e!168842 (= (_2!11363 lt!379521) (_2!11363 lt!379528)))))

(declare-fun b!243578 () Bool)

(assert (=> b!243578 (= e!168843 e!168849)))

(declare-fun res!203504 () Bool)

(assert (=> b!243578 (=> (not res!203504) (not e!168849))))

(declare-fun lt!379518 () (_ BitVec 64))

(declare-fun lt!379529 () (_ BitVec 64))

(assert (=> b!243578 (= res!203504 (= lt!379518 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379529)))))

(assert (=> b!243578 (= lt!379518 (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))))))

(assert (=> b!243578 (= lt!379529 (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)))))

(declare-fun b!243579 () Bool)

(declare-fun lt!379513 () tuple2!20882)

(declare-fun lt!379522 () tuple2!20884)

(assert (=> b!243579 (= e!168846 (not (or (not (_2!11363 lt!379513)) (not (= (_1!11363 lt!379513) (_2!11364 lt!379522))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10630 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20882)

(assert (=> b!243579 (= lt!379513 (checkBitsLoopPure!0 (_1!11364 lt!379522) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243579 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) lt!379519)))

(declare-fun lt!379530 () Unit!17797)

(assert (=> b!243579 (= lt!379530 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11362 lt!379520) (buf!6323 (_2!11362 lt!379526)) lt!379519))))

(assert (=> b!243579 (= lt!379522 (reader!0 (_2!11362 lt!379520) (_2!11362 lt!379526)))))

(declare-fun b!243580 () Bool)

(assert (=> b!243580 (= e!168848 (= (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379523))) (currentByte!11695 (_1!11363 lt!379523)) (currentBit!11690 (_1!11363 lt!379523))) lt!379518))))

(declare-fun b!243581 () Bool)

(declare-fun res!203506 () Bool)

(assert (=> b!243581 (=> (not res!203506) (not e!168851))))

(assert (=> b!243581 (= res!203506 (invariant!0 (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379520)))))))

(declare-fun b!243573 () Bool)

(declare-fun res!203505 () Bool)

(assert (=> b!243573 (=> (not res!203505) (not e!168845))))

(assert (=> b!243573 (= res!203505 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 thiss!1005))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!203511 () Bool)

(assert (=> start!52640 (=> (not res!203511) (not e!168845))))

(assert (=> start!52640 (= res!203511 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52640 e!168845))

(assert (=> start!52640 true))

(declare-fun inv!12 (BitStream!10630) Bool)

(assert (=> start!52640 (and (inv!12 thiss!1005) e!168844)))

(assert (= (and start!52640 res!203511) b!243573))

(assert (= (and b!243573 res!203505) b!243569))

(assert (= (and b!243569 res!203507) b!243570))

(assert (= (and b!243570 res!203503) b!243578))

(assert (= (and b!243578 res!203504) b!243574))

(assert (= (and b!243574 res!203512) b!243568))

(assert (= (and b!243568 res!203510) b!243580))

(assert (= (and b!243570 res!203508) b!243576))

(assert (= (and b!243576 res!203513) b!243572))

(assert (= (and b!243572 res!203502) b!243579))

(assert (= (and b!243570 res!203514) b!243581))

(assert (= (and b!243581 res!203506) b!243571))

(assert (= (and b!243570 res!203509) b!243577))

(assert (= start!52640 b!243575))

(declare-fun m!366977 () Bool)

(assert (=> b!243572 m!366977))

(declare-fun m!366979 () Bool)

(assert (=> b!243580 m!366979))

(declare-fun m!366981 () Bool)

(assert (=> b!243571 m!366981))

(declare-fun m!366983 () Bool)

(assert (=> start!52640 m!366983))

(declare-fun m!366985 () Bool)

(assert (=> b!243581 m!366985))

(declare-fun m!366987 () Bool)

(assert (=> b!243574 m!366987))

(declare-fun m!366989 () Bool)

(assert (=> b!243578 m!366989))

(declare-fun m!366991 () Bool)

(assert (=> b!243578 m!366991))

(declare-fun m!366993 () Bool)

(assert (=> b!243568 m!366993))

(assert (=> b!243568 m!366993))

(declare-fun m!366995 () Bool)

(assert (=> b!243568 m!366995))

(declare-fun m!366997 () Bool)

(assert (=> b!243573 m!366997))

(declare-fun m!366999 () Bool)

(assert (=> b!243575 m!366999))

(declare-fun m!367001 () Bool)

(assert (=> b!243570 m!367001))

(declare-fun m!367003 () Bool)

(assert (=> b!243570 m!367003))

(declare-fun m!367005 () Bool)

(assert (=> b!243570 m!367005))

(declare-fun m!367007 () Bool)

(assert (=> b!243570 m!367007))

(declare-fun m!367009 () Bool)

(assert (=> b!243570 m!367009))

(declare-fun m!367011 () Bool)

(assert (=> b!243570 m!367011))

(declare-fun m!367013 () Bool)

(assert (=> b!243570 m!367013))

(declare-fun m!367015 () Bool)

(assert (=> b!243570 m!367015))

(declare-fun m!367017 () Bool)

(assert (=> b!243570 m!367017))

(declare-fun m!367019 () Bool)

(assert (=> b!243570 m!367019))

(declare-fun m!367021 () Bool)

(assert (=> b!243570 m!367021))

(declare-fun m!367023 () Bool)

(assert (=> b!243570 m!367023))

(declare-fun m!367025 () Bool)

(assert (=> b!243570 m!367025))

(declare-fun m!367027 () Bool)

(assert (=> b!243570 m!367027))

(declare-fun m!367029 () Bool)

(assert (=> b!243570 m!367029))

(declare-fun m!367031 () Bool)

(assert (=> b!243570 m!367031))

(declare-fun m!367033 () Bool)

(assert (=> b!243570 m!367033))

(declare-fun m!367035 () Bool)

(assert (=> b!243579 m!367035))

(declare-fun m!367037 () Bool)

(assert (=> b!243579 m!367037))

(declare-fun m!367039 () Bool)

(assert (=> b!243579 m!367039))

(assert (=> b!243579 m!367001))

(declare-fun m!367041 () Bool)

(assert (=> b!243576 m!367041))

(assert (=> b!243576 m!366989))

(push 1)

(assert (not b!243575))

(assert (not b!243579))

(assert (not b!243573))

(assert (not b!243572))

(assert (not b!243578))

(assert (not b!243576))

(assert (not start!52640))

(assert (not b!243574))

(assert (not b!243571))

(assert (not b!243581))

(assert (not b!243570))

(assert (not b!243580))

(assert (not b!243568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81780 () Bool)

(declare-fun e!168961 () Bool)

(assert (=> d!81780 e!168961))

(declare-fun res!203675 () Bool)

(assert (=> d!81780 (=> (not res!203675) (not e!168961))))

(declare-fun lt!379848 () (_ BitVec 64))

(declare-fun lt!379847 () (_ BitVec 64))

(declare-fun lt!379846 () (_ BitVec 64))

(assert (=> d!81780 (= res!203675 (= lt!379848 (bvsub lt!379847 lt!379846)))))

(assert (=> d!81780 (or (= (bvand lt!379847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379847 lt!379846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81780 (= lt!379846 (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379526))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379526)))))))

(declare-fun lt!379850 () (_ BitVec 64))

(declare-fun lt!379849 () (_ BitVec 64))

(assert (=> d!81780 (= lt!379847 (bvmul lt!379850 lt!379849))))

(assert (=> d!81780 (or (= lt!379850 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379849 (bvsdiv (bvmul lt!379850 lt!379849) lt!379850)))))

(assert (=> d!81780 (= lt!379849 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81780 (= lt!379850 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))))))

(assert (=> d!81780 (= lt!379848 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379526)))))))

(assert (=> d!81780 (invariant!0 (currentBit!11690 (_2!11362 lt!379526)) (currentByte!11695 (_2!11362 lt!379526)) (size!5854 (buf!6323 (_2!11362 lt!379526))))))

(assert (=> d!81780 (= (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379526))) (currentByte!11695 (_2!11362 lt!379526)) (currentBit!11690 (_2!11362 lt!379526))) lt!379848)))

(declare-fun b!243755 () Bool)

(declare-fun res!203674 () Bool)

(assert (=> b!243755 (=> (not res!203674) (not e!168961))))

(assert (=> b!243755 (= res!203674 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379848))))

(declare-fun b!243756 () Bool)

(declare-fun lt!379851 () (_ BitVec 64))

(assert (=> b!243756 (= e!168961 (bvsle lt!379848 (bvmul lt!379851 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243756 (or (= lt!379851 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379851 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379851)))))

(assert (=> b!243756 (= lt!379851 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))))))

(assert (= (and d!81780 res!203675) b!243755))

(assert (= (and b!243755 res!203674) b!243756))

(declare-fun m!367325 () Bool)

(assert (=> d!81780 m!367325))

(declare-fun m!367327 () Bool)

(assert (=> d!81780 m!367327))

(assert (=> b!243576 d!81780))

(declare-fun d!81782 () Bool)

(declare-fun e!168962 () Bool)

(assert (=> d!81782 e!168962))

(declare-fun res!203677 () Bool)

(assert (=> d!81782 (=> (not res!203677) (not e!168962))))

(declare-fun lt!379853 () (_ BitVec 64))

(declare-fun lt!379854 () (_ BitVec 64))

(declare-fun lt!379852 () (_ BitVec 64))

(assert (=> d!81782 (= res!203677 (= lt!379854 (bvsub lt!379853 lt!379852)))))

(assert (=> d!81782 (or (= (bvand lt!379853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379852 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379853 lt!379852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81782 (= lt!379852 (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520)))))))

(declare-fun lt!379856 () (_ BitVec 64))

(declare-fun lt!379855 () (_ BitVec 64))

(assert (=> d!81782 (= lt!379853 (bvmul lt!379856 lt!379855))))

(assert (=> d!81782 (or (= lt!379856 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379855 (bvsdiv (bvmul lt!379856 lt!379855) lt!379856)))))

(assert (=> d!81782 (= lt!379855 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81782 (= lt!379856 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))))))

(assert (=> d!81782 (= lt!379854 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520)))))))

(assert (=> d!81782 (invariant!0 (currentBit!11690 (_2!11362 lt!379520)) (currentByte!11695 (_2!11362 lt!379520)) (size!5854 (buf!6323 (_2!11362 lt!379520))))))

(assert (=> d!81782 (= (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))) lt!379854)))

(declare-fun b!243757 () Bool)

(declare-fun res!203676 () Bool)

(assert (=> b!243757 (=> (not res!203676) (not e!168962))))

(assert (=> b!243757 (= res!203676 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379854))))

(declare-fun b!243758 () Bool)

(declare-fun lt!379857 () (_ BitVec 64))

(assert (=> b!243758 (= e!168962 (bvsle lt!379854 (bvmul lt!379857 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243758 (or (= lt!379857 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379857 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379857)))))

(assert (=> b!243758 (= lt!379857 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))))))

(assert (= (and d!81782 res!203677) b!243757))

(assert (= (and b!243757 res!203676) b!243758))

(declare-fun m!367329 () Bool)

(assert (=> d!81782 m!367329))

(declare-fun m!367331 () Bool)

(assert (=> d!81782 m!367331))

(assert (=> b!243576 d!81782))

(declare-fun d!81784 () Bool)

(assert (=> d!81784 (= (array_inv!5595 (buf!6323 thiss!1005)) (bvsge (size!5854 (buf!6323 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!243575 d!81784))

(declare-fun d!81786 () Bool)

(assert (=> d!81786 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005) (size!5854 (buf!6323 thiss!1005))))))

(declare-fun bs!20687 () Bool)

(assert (= bs!20687 d!81786))

(declare-fun m!367333 () Bool)

(assert (=> bs!20687 m!367333))

(assert (=> start!52640 d!81786))

(declare-fun d!81788 () Bool)

(declare-fun res!203684 () Bool)

(declare-fun e!168968 () Bool)

(assert (=> d!81788 (=> (not res!203684) (not e!168968))))

(assert (=> d!81788 (= res!203684 (= (size!5854 (buf!6323 thiss!1005)) (size!5854 (buf!6323 (_2!11362 lt!379520)))))))

(assert (=> d!81788 (= (isPrefixOf!0 thiss!1005 (_2!11362 lt!379520)) e!168968)))

(declare-fun b!243765 () Bool)

(declare-fun res!203686 () Bool)

(assert (=> b!243765 (=> (not res!203686) (not e!168968))))

(assert (=> b!243765 (= res!203686 (bvsle (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)) (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520)))))))

(declare-fun b!243766 () Bool)

(declare-fun e!168967 () Bool)

(assert (=> b!243766 (= e!168968 e!168967)))

(declare-fun res!203685 () Bool)

(assert (=> b!243766 (=> res!203685 e!168967)))

(assert (=> b!243766 (= res!203685 (= (size!5854 (buf!6323 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!243767 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13352 array!13352 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243767 (= e!168967 (arrayBitRangesEq!0 (buf!6323 thiss!1005) (buf!6323 (_2!11362 lt!379520)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005))))))

(assert (= (and d!81788 res!203684) b!243765))

(assert (= (and b!243765 res!203686) b!243766))

(assert (= (and b!243766 (not res!203685)) b!243767))

(assert (=> b!243765 m!366991))

(assert (=> b!243765 m!366989))

(assert (=> b!243767 m!366991))

(assert (=> b!243767 m!366991))

(declare-fun m!367335 () Bool)

(assert (=> b!243767 m!367335))

(assert (=> b!243574 d!81788))

(declare-fun d!81790 () Bool)

(declare-datatypes ((tuple2!20900 0))(
  ( (tuple2!20901 (_1!11372 Bool) (_2!11372 BitStream!10630)) )
))
(declare-fun lt!379860 () tuple2!20900)

(declare-fun readBit!0 (BitStream!10630) tuple2!20900)

(assert (=> d!81790 (= lt!379860 (readBit!0 (readerFrom!0 (_2!11362 lt!379520) (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005))))))

(assert (=> d!81790 (= (readBitPure!0 (readerFrom!0 (_2!11362 lt!379520) (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005))) (tuple2!20883 (_2!11372 lt!379860) (_1!11372 lt!379860)))))

(declare-fun bs!20688 () Bool)

(assert (= bs!20688 d!81790))

(assert (=> bs!20688 m!366993))

(declare-fun m!367337 () Bool)

(assert (=> bs!20688 m!367337))

(assert (=> b!243568 d!81790))

(declare-fun d!81792 () Bool)

(declare-fun e!168971 () Bool)

(assert (=> d!81792 e!168971))

(declare-fun res!203690 () Bool)

(assert (=> d!81792 (=> (not res!203690) (not e!168971))))

(assert (=> d!81792 (= res!203690 (invariant!0 (currentBit!11690 (_2!11362 lt!379520)) (currentByte!11695 (_2!11362 lt!379520)) (size!5854 (buf!6323 (_2!11362 lt!379520)))))))

(assert (=> d!81792 (= (readerFrom!0 (_2!11362 lt!379520) (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005)) (BitStream!10631 (buf!6323 (_2!11362 lt!379520)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)))))

(declare-fun b!243770 () Bool)

(assert (=> b!243770 (= e!168971 (invariant!0 (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379520)))))))

(assert (= (and d!81792 res!203690) b!243770))

(assert (=> d!81792 m!367331))

(assert (=> b!243770 m!366985))

(assert (=> b!243568 d!81792))

(assert (=> b!243578 d!81782))

(declare-fun d!81794 () Bool)

(declare-fun e!168972 () Bool)

(assert (=> d!81794 e!168972))

(declare-fun res!203692 () Bool)

(assert (=> d!81794 (=> (not res!203692) (not e!168972))))

(declare-fun lt!379861 () (_ BitVec 64))

(declare-fun lt!379862 () (_ BitVec 64))

(declare-fun lt!379863 () (_ BitVec 64))

(assert (=> d!81794 (= res!203692 (= lt!379863 (bvsub lt!379862 lt!379861)))))

(assert (=> d!81794 (or (= (bvand lt!379862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379861 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379862 lt!379861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81794 (= lt!379861 (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 thiss!1005))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005))))))

(declare-fun lt!379865 () (_ BitVec 64))

(declare-fun lt!379864 () (_ BitVec 64))

(assert (=> d!81794 (= lt!379862 (bvmul lt!379865 lt!379864))))

(assert (=> d!81794 (or (= lt!379865 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379864 (bvsdiv (bvmul lt!379865 lt!379864) lt!379865)))))

(assert (=> d!81794 (= lt!379864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81794 (= lt!379865 ((_ sign_extend 32) (size!5854 (buf!6323 thiss!1005))))))

(assert (=> d!81794 (= lt!379863 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11695 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11690 thiss!1005))))))

(assert (=> d!81794 (invariant!0 (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005) (size!5854 (buf!6323 thiss!1005)))))

(assert (=> d!81794 (= (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)) lt!379863)))

(declare-fun b!243771 () Bool)

(declare-fun res!203691 () Bool)

(assert (=> b!243771 (=> (not res!203691) (not e!168972))))

(assert (=> b!243771 (= res!203691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379863))))

(declare-fun b!243772 () Bool)

(declare-fun lt!379866 () (_ BitVec 64))

(assert (=> b!243772 (= e!168972 (bvsle lt!379863 (bvmul lt!379866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243772 (or (= lt!379866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379866)))))

(assert (=> b!243772 (= lt!379866 ((_ sign_extend 32) (size!5854 (buf!6323 thiss!1005))))))

(assert (= (and d!81794 res!203692) b!243771))

(assert (= (and b!243771 res!203691) b!243772))

(declare-fun m!367339 () Bool)

(assert (=> d!81794 m!367339))

(assert (=> d!81794 m!367333))

(assert (=> b!243578 d!81794))

(declare-fun d!81796 () Bool)

(assert (=> d!81796 (= (invariant!0 (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379520)))) (and (bvsge (currentBit!11690 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11690 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11695 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379520)))) (and (= (currentBit!11690 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379520))))))))))

(assert (=> b!243581 d!81796))

(declare-fun d!81798 () Bool)

(assert (=> d!81798 (isPrefixOf!0 thiss!1005 (_2!11362 lt!379526))))

(declare-fun lt!379869 () Unit!17797)

(declare-fun choose!30 (BitStream!10630 BitStream!10630 BitStream!10630) Unit!17797)

(assert (=> d!81798 (= lt!379869 (choose!30 thiss!1005 (_2!11362 lt!379520) (_2!11362 lt!379526)))))

(assert (=> d!81798 (isPrefixOf!0 thiss!1005 (_2!11362 lt!379520))))

(assert (=> d!81798 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11362 lt!379520) (_2!11362 lt!379526)) lt!379869)))

(declare-fun bs!20689 () Bool)

(assert (= bs!20689 d!81798))

(assert (=> bs!20689 m!367009))

(declare-fun m!367341 () Bool)

(assert (=> bs!20689 m!367341))

(assert (=> bs!20689 m!366987))

(assert (=> b!243570 d!81798))

(declare-fun b!243782 () Bool)

(declare-fun res!203704 () Bool)

(declare-fun e!168977 () Bool)

(assert (=> b!243782 (=> (not res!203704) (not e!168977))))

(declare-fun lt!379893 () tuple2!20880)

(assert (=> b!243782 (= res!203704 (isPrefixOf!0 (_2!11362 lt!379520) (_2!11362 lt!379893)))))

(declare-fun d!81800 () Bool)

(assert (=> d!81800 e!168977))

(declare-fun res!203703 () Bool)

(assert (=> d!81800 (=> (not res!203703) (not e!168977))))

(assert (=> d!81800 (= res!203703 (= (size!5854 (buf!6323 (_2!11362 lt!379520))) (size!5854 (buf!6323 (_2!11362 lt!379893)))))))

(declare-fun choose!51 (BitStream!10630 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20880)

(assert (=> d!81800 (= lt!379893 (choose!51 (_2!11362 lt!379520) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81800 (= (appendNBitsLoop!0 (_2!11362 lt!379520) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!379893)))

(declare-fun b!243781 () Bool)

(declare-fun res!203702 () Bool)

(assert (=> b!243781 (=> (not res!203702) (not e!168977))))

(declare-fun lt!379891 () (_ BitVec 64))

(declare-fun lt!379892 () (_ BitVec 64))

(assert (=> b!243781 (= res!203702 (= (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379893))) (currentByte!11695 (_2!11362 lt!379893)) (currentBit!11690 (_2!11362 lt!379893))) (bvadd lt!379892 lt!379891)))))

(assert (=> b!243781 (or (not (= (bvand lt!379892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379891 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!379892 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!379892 lt!379891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243781 (= lt!379891 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243781 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243781 (= lt!379892 (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))))))

(declare-fun b!243783 () Bool)

(declare-fun lt!379888 () tuple2!20882)

(declare-fun lt!379887 () tuple2!20884)

(assert (=> b!243783 (= e!168977 (and (_2!11363 lt!379888) (= (_1!11363 lt!379888) (_2!11364 lt!379887))))))

(assert (=> b!243783 (= lt!379888 (checkBitsLoopPure!0 (_1!11364 lt!379887) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!379886 () Unit!17797)

(declare-fun lt!379889 () Unit!17797)

(assert (=> b!243783 (= lt!379886 lt!379889)))

(declare-fun lt!379890 () (_ BitVec 64))

(assert (=> b!243783 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379893)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) lt!379890)))

(assert (=> b!243783 (= lt!379889 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11362 lt!379520) (buf!6323 (_2!11362 lt!379893)) lt!379890))))

(declare-fun e!168978 () Bool)

(assert (=> b!243783 e!168978))

(declare-fun res!203701 () Bool)

(assert (=> b!243783 (=> (not res!203701) (not e!168978))))

(assert (=> b!243783 (= res!203701 (and (= (size!5854 (buf!6323 (_2!11362 lt!379520))) (size!5854 (buf!6323 (_2!11362 lt!379893)))) (bvsge lt!379890 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243783 (= lt!379890 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243783 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243783 (= lt!379887 (reader!0 (_2!11362 lt!379520) (_2!11362 lt!379893)))))

(declare-fun b!243784 () Bool)

(assert (=> b!243784 (= e!168978 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) lt!379890))))

(assert (= (and d!81800 res!203703) b!243781))

(assert (= (and b!243781 res!203702) b!243782))

(assert (= (and b!243782 res!203704) b!243783))

(assert (= (and b!243783 res!203701) b!243784))

(declare-fun m!367343 () Bool)

(assert (=> d!81800 m!367343))

(declare-fun m!367345 () Bool)

(assert (=> b!243783 m!367345))

(declare-fun m!367347 () Bool)

(assert (=> b!243783 m!367347))

(declare-fun m!367349 () Bool)

(assert (=> b!243783 m!367349))

(declare-fun m!367351 () Bool)

(assert (=> b!243783 m!367351))

(declare-fun m!367353 () Bool)

(assert (=> b!243781 m!367353))

(assert (=> b!243781 m!366989))

(declare-fun m!367355 () Bool)

(assert (=> b!243784 m!367355))

(declare-fun m!367357 () Bool)

(assert (=> b!243782 m!367357))

(assert (=> b!243570 d!81800))

(declare-fun b!243795 () Bool)

(declare-fun res!203713 () Bool)

(declare-fun e!168983 () Bool)

(assert (=> b!243795 (=> (not res!203713) (not e!168983))))

(declare-fun lt!379946 () tuple2!20884)

(assert (=> b!243795 (= res!203713 (isPrefixOf!0 (_1!11364 lt!379946) (_2!11362 lt!379520)))))

(declare-fun d!81802 () Bool)

(assert (=> d!81802 e!168983))

(declare-fun res!203711 () Bool)

(assert (=> d!81802 (=> (not res!203711) (not e!168983))))

(assert (=> d!81802 (= res!203711 (isPrefixOf!0 (_1!11364 lt!379946) (_2!11364 lt!379946)))))

(declare-fun lt!379952 () BitStream!10630)

(assert (=> d!81802 (= lt!379946 (tuple2!20885 lt!379952 (_2!11362 lt!379526)))))

(declare-fun lt!379945 () Unit!17797)

(declare-fun lt!379940 () Unit!17797)

(assert (=> d!81802 (= lt!379945 lt!379940)))

(assert (=> d!81802 (isPrefixOf!0 lt!379952 (_2!11362 lt!379526))))

(assert (=> d!81802 (= lt!379940 (lemmaIsPrefixTransitive!0 lt!379952 (_2!11362 lt!379526) (_2!11362 lt!379526)))))

(declare-fun lt!379943 () Unit!17797)

(declare-fun lt!379942 () Unit!17797)

(assert (=> d!81802 (= lt!379943 lt!379942)))

(assert (=> d!81802 (isPrefixOf!0 lt!379952 (_2!11362 lt!379526))))

(assert (=> d!81802 (= lt!379942 (lemmaIsPrefixTransitive!0 lt!379952 (_2!11362 lt!379520) (_2!11362 lt!379526)))))

(declare-fun lt!379939 () Unit!17797)

(declare-fun e!168984 () Unit!17797)

(assert (=> d!81802 (= lt!379939 e!168984)))

(declare-fun c!11459 () Bool)

(assert (=> d!81802 (= c!11459 (not (= (size!5854 (buf!6323 (_2!11362 lt!379520))) #b00000000000000000000000000000000)))))

(declare-fun lt!379937 () Unit!17797)

(declare-fun lt!379951 () Unit!17797)

(assert (=> d!81802 (= lt!379937 lt!379951)))

(assert (=> d!81802 (isPrefixOf!0 (_2!11362 lt!379526) (_2!11362 lt!379526))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10630) Unit!17797)

(assert (=> d!81802 (= lt!379951 (lemmaIsPrefixRefl!0 (_2!11362 lt!379526)))))

(declare-fun lt!379944 () Unit!17797)

(declare-fun lt!379949 () Unit!17797)

(assert (=> d!81802 (= lt!379944 lt!379949)))

(assert (=> d!81802 (= lt!379949 (lemmaIsPrefixRefl!0 (_2!11362 lt!379526)))))

(declare-fun lt!379941 () Unit!17797)

(declare-fun lt!379935 () Unit!17797)

(assert (=> d!81802 (= lt!379941 lt!379935)))

(assert (=> d!81802 (isPrefixOf!0 lt!379952 lt!379952)))

(assert (=> d!81802 (= lt!379935 (lemmaIsPrefixRefl!0 lt!379952))))

(declare-fun lt!379938 () Unit!17797)

(declare-fun lt!379936 () Unit!17797)

(assert (=> d!81802 (= lt!379938 lt!379936)))

(assert (=> d!81802 (isPrefixOf!0 (_2!11362 lt!379520) (_2!11362 lt!379520))))

(assert (=> d!81802 (= lt!379936 (lemmaIsPrefixRefl!0 (_2!11362 lt!379520)))))

(assert (=> d!81802 (= lt!379952 (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))))))

(assert (=> d!81802 (isPrefixOf!0 (_2!11362 lt!379520) (_2!11362 lt!379526))))

(assert (=> d!81802 (= (reader!0 (_2!11362 lt!379520) (_2!11362 lt!379526)) lt!379946)))

(declare-fun b!243796 () Bool)

(declare-fun res!203712 () Bool)

(assert (=> b!243796 (=> (not res!203712) (not e!168983))))

(assert (=> b!243796 (= res!203712 (isPrefixOf!0 (_2!11364 lt!379946) (_2!11362 lt!379526)))))

(declare-fun lt!379953 () (_ BitVec 64))

(declare-fun lt!379947 () (_ BitVec 64))

(declare-fun b!243797 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10630 (_ BitVec 64)) BitStream!10630)

(assert (=> b!243797 (= e!168983 (= (_1!11364 lt!379946) (withMovedBitIndex!0 (_2!11364 lt!379946) (bvsub lt!379947 lt!379953))))))

(assert (=> b!243797 (or (= (bvand lt!379947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379947 lt!379953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243797 (= lt!379953 (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379526))) (currentByte!11695 (_2!11362 lt!379526)) (currentBit!11690 (_2!11362 lt!379526))))))

(assert (=> b!243797 (= lt!379947 (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))))))

(declare-fun b!243798 () Bool)

(declare-fun lt!379950 () Unit!17797)

(assert (=> b!243798 (= e!168984 lt!379950)))

(declare-fun lt!379934 () (_ BitVec 64))

(assert (=> b!243798 (= lt!379934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!379948 () (_ BitVec 64))

(assert (=> b!243798 (= lt!379948 (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13352 array!13352 (_ BitVec 64) (_ BitVec 64)) Unit!17797)

(assert (=> b!243798 (= lt!379950 (arrayBitRangesEqSymmetric!0 (buf!6323 (_2!11362 lt!379520)) (buf!6323 (_2!11362 lt!379526)) lt!379934 lt!379948))))

(assert (=> b!243798 (arrayBitRangesEq!0 (buf!6323 (_2!11362 lt!379526)) (buf!6323 (_2!11362 lt!379520)) lt!379934 lt!379948)))

(declare-fun b!243799 () Bool)

(declare-fun Unit!17805 () Unit!17797)

(assert (=> b!243799 (= e!168984 Unit!17805)))

(assert (= (and d!81802 c!11459) b!243798))

(assert (= (and d!81802 (not c!11459)) b!243799))

(assert (= (and d!81802 res!203711) b!243795))

(assert (= (and b!243795 res!203713) b!243796))

(assert (= (and b!243796 res!203712) b!243797))

(declare-fun m!367359 () Bool)

(assert (=> b!243795 m!367359))

(declare-fun m!367361 () Bool)

(assert (=> d!81802 m!367361))

(declare-fun m!367363 () Bool)

(assert (=> d!81802 m!367363))

(declare-fun m!367365 () Bool)

(assert (=> d!81802 m!367365))

(declare-fun m!367367 () Bool)

(assert (=> d!81802 m!367367))

(declare-fun m!367369 () Bool)

(assert (=> d!81802 m!367369))

(declare-fun m!367371 () Bool)

(assert (=> d!81802 m!367371))

(assert (=> d!81802 m!366977))

(declare-fun m!367373 () Bool)

(assert (=> d!81802 m!367373))

(declare-fun m!367375 () Bool)

(assert (=> d!81802 m!367375))

(declare-fun m!367377 () Bool)

(assert (=> d!81802 m!367377))

(declare-fun m!367379 () Bool)

(assert (=> d!81802 m!367379))

(assert (=> b!243798 m!366989))

(declare-fun m!367381 () Bool)

(assert (=> b!243798 m!367381))

(declare-fun m!367383 () Bool)

(assert (=> b!243798 m!367383))

(declare-fun m!367385 () Bool)

(assert (=> b!243797 m!367385))

(assert (=> b!243797 m!367041))

(assert (=> b!243797 m!366989))

(declare-fun m!367387 () Bool)

(assert (=> b!243796 m!367387))

(assert (=> b!243570 d!81802))

(declare-fun d!81804 () Bool)

(declare-fun lt!379954 () tuple2!20900)

(assert (=> d!81804 (= lt!379954 (readBit!0 lt!379515))))

(assert (=> d!81804 (= (readBitPure!0 lt!379515) (tuple2!20883 (_2!11372 lt!379954) (_1!11372 lt!379954)))))

(declare-fun bs!20690 () Bool)

(assert (= bs!20690 d!81804))

(declare-fun m!367389 () Bool)

(assert (=> bs!20690 m!367389))

(assert (=> b!243570 d!81804))

(declare-fun d!81806 () Bool)

(declare-fun e!168987 () Bool)

(assert (=> d!81806 e!168987))

(declare-fun res!203716 () Bool)

(assert (=> d!81806 (=> (not res!203716) (not e!168987))))

(declare-fun lt!379966 () tuple2!20882)

(declare-fun lt!379965 () tuple2!20882)

(assert (=> d!81806 (= res!203716 (= (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379966))) (currentByte!11695 (_1!11363 lt!379966)) (currentBit!11690 (_1!11363 lt!379966))) (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379965))) (currentByte!11695 (_1!11363 lt!379965)) (currentBit!11690 (_1!11363 lt!379965)))))))

(declare-fun lt!379964 () Unit!17797)

(declare-fun lt!379963 () BitStream!10630)

(declare-fun choose!50 (BitStream!10630 BitStream!10630 BitStream!10630 tuple2!20882 tuple2!20882 BitStream!10630 Bool tuple2!20882 tuple2!20882 BitStream!10630 Bool) Unit!17797)

(assert (=> d!81806 (= lt!379964 (choose!50 lt!379515 (_2!11362 lt!379526) lt!379963 lt!379966 (tuple2!20883 (_1!11363 lt!379966) (_2!11363 lt!379966)) (_1!11363 lt!379966) (_2!11363 lt!379966) lt!379965 (tuple2!20883 (_1!11363 lt!379965) (_2!11363 lt!379965)) (_1!11363 lt!379965) (_2!11363 lt!379965)))))

(assert (=> d!81806 (= lt!379965 (readBitPure!0 lt!379963))))

(assert (=> d!81806 (= lt!379966 (readBitPure!0 lt!379515))))

(assert (=> d!81806 (= lt!379963 (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 lt!379515) (currentBit!11690 lt!379515)))))

(assert (=> d!81806 (invariant!0 (currentBit!11690 lt!379515) (currentByte!11695 lt!379515) (size!5854 (buf!6323 (_2!11362 lt!379526))))))

(assert (=> d!81806 (= (readBitPrefixLemma!0 lt!379515 (_2!11362 lt!379526)) lt!379964)))

(declare-fun b!243802 () Bool)

(assert (=> b!243802 (= e!168987 (= (_2!11363 lt!379966) (_2!11363 lt!379965)))))

(assert (= (and d!81806 res!203716) b!243802))

(declare-fun m!367391 () Bool)

(assert (=> d!81806 m!367391))

(declare-fun m!367393 () Bool)

(assert (=> d!81806 m!367393))

(assert (=> d!81806 m!367007))

(declare-fun m!367395 () Bool)

(assert (=> d!81806 m!367395))

(declare-fun m!367397 () Bool)

(assert (=> d!81806 m!367397))

(declare-fun m!367399 () Bool)

(assert (=> d!81806 m!367399))

(assert (=> b!243570 d!81806))

(declare-fun d!81808 () Bool)

(assert (=> d!81808 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379969 () Unit!17797)

(declare-fun choose!9 (BitStream!10630 array!13352 (_ BitVec 64) BitStream!10630) Unit!17797)

(assert (=> d!81808 (= lt!379969 (choose!9 thiss!1005 (buf!6323 (_2!11362 lt!379526)) (bvsub nBits!297 from!289) (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005))))))

(assert (=> d!81808 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6323 (_2!11362 lt!379526)) (bvsub nBits!297 from!289)) lt!379969)))

(declare-fun bs!20691 () Bool)

(assert (= bs!20691 d!81808))

(assert (=> bs!20691 m!367027))

(declare-fun m!367401 () Bool)

(assert (=> bs!20691 m!367401))

(assert (=> b!243570 d!81808))

(declare-fun d!81810 () Bool)

(assert (=> d!81810 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20692 () Bool)

(assert (= bs!20692 d!81810))

(declare-fun m!367403 () Bool)

(assert (=> bs!20692 m!367403))

(assert (=> b!243570 d!81810))

(declare-fun d!81812 () Bool)

(declare-fun lt!379970 () tuple2!20900)

(assert (=> d!81812 (= lt!379970 (readBit!0 (_1!11364 lt!379525)))))

(assert (=> d!81812 (= (readBitPure!0 (_1!11364 lt!379525)) (tuple2!20883 (_2!11372 lt!379970) (_1!11372 lt!379970)))))

(declare-fun bs!20693 () Bool)

(assert (= bs!20693 d!81812))

(declare-fun m!367405 () Bool)

(assert (=> bs!20693 m!367405))

(assert (=> b!243570 d!81812))

(declare-fun d!81814 () Bool)

(assert (=> d!81814 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11364 lt!379525)))) ((_ sign_extend 32) (currentByte!11695 (_1!11364 lt!379525))) ((_ sign_extend 32) (currentBit!11690 (_1!11364 lt!379525))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11364 lt!379525)))) ((_ sign_extend 32) (currentByte!11695 (_1!11364 lt!379525))) ((_ sign_extend 32) (currentBit!11690 (_1!11364 lt!379525)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20694 () Bool)

(assert (= bs!20694 d!81814))

(declare-fun m!367407 () Bool)

(assert (=> bs!20694 m!367407))

(assert (=> b!243570 d!81814))

(declare-fun d!81816 () Bool)

(declare-fun res!203717 () Bool)

(declare-fun e!168989 () Bool)

(assert (=> d!81816 (=> (not res!203717) (not e!168989))))

(assert (=> d!81816 (= res!203717 (= (size!5854 (buf!6323 thiss!1005)) (size!5854 (buf!6323 (_2!11362 lt!379526)))))))

(assert (=> d!81816 (= (isPrefixOf!0 thiss!1005 (_2!11362 lt!379526)) e!168989)))

(declare-fun b!243803 () Bool)

(declare-fun res!203719 () Bool)

(assert (=> b!243803 (=> (not res!203719) (not e!168989))))

(assert (=> b!243803 (= res!203719 (bvsle (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)) (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379526))) (currentByte!11695 (_2!11362 lt!379526)) (currentBit!11690 (_2!11362 lt!379526)))))))

(declare-fun b!243804 () Bool)

(declare-fun e!168988 () Bool)

(assert (=> b!243804 (= e!168989 e!168988)))

(declare-fun res!203718 () Bool)

(assert (=> b!243804 (=> res!203718 e!168988)))

(assert (=> b!243804 (= res!203718 (= (size!5854 (buf!6323 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!243805 () Bool)

(assert (=> b!243805 (= e!168988 (arrayBitRangesEq!0 (buf!6323 thiss!1005) (buf!6323 (_2!11362 lt!379526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005))))))

(assert (= (and d!81816 res!203717) b!243803))

(assert (= (and b!243803 res!203719) b!243804))

(assert (= (and b!243804 (not res!203718)) b!243805))

(assert (=> b!243803 m!366991))

(assert (=> b!243803 m!367041))

(assert (=> b!243805 m!366991))

(assert (=> b!243805 m!366991))

(declare-fun m!367409 () Bool)

(assert (=> b!243805 m!367409))

(assert (=> b!243570 d!81816))

(declare-fun d!81818 () Bool)

(declare-fun lt!379971 () tuple2!20900)

(assert (=> d!81818 (= lt!379971 (readBit!0 (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005))))))

(assert (=> d!81818 (= (readBitPure!0 (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005))) (tuple2!20883 (_2!11372 lt!379971) (_1!11372 lt!379971)))))

(declare-fun bs!20695 () Bool)

(assert (= bs!20695 d!81818))

(declare-fun m!367411 () Bool)

(assert (=> bs!20695 m!367411))

(assert (=> b!243570 d!81818))

(declare-fun d!81820 () Bool)

(declare-fun e!168992 () Bool)

(assert (=> d!81820 e!168992))

(declare-fun res!203722 () Bool)

(assert (=> d!81820 (=> (not res!203722) (not e!168992))))

(assert (=> d!81820 (= res!203722 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!379974 () Unit!17797)

(declare-fun choose!27 (BitStream!10630 BitStream!10630 (_ BitVec 64) (_ BitVec 64)) Unit!17797)

(assert (=> d!81820 (= lt!379974 (choose!27 thiss!1005 (_2!11362 lt!379520) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!81820 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!81820 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11362 lt!379520) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!379974)))

(declare-fun b!243808 () Bool)

(assert (=> b!243808 (= e!168992 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!81820 res!203722) b!243808))

(declare-fun m!367413 () Bool)

(assert (=> d!81820 m!367413))

(assert (=> b!243808 m!367023))

(assert (=> b!243570 d!81820))

(declare-fun d!81822 () Bool)

(declare-fun e!168993 () Bool)

(assert (=> d!81822 e!168993))

(declare-fun res!203724 () Bool)

(assert (=> d!81822 (=> (not res!203724) (not e!168993))))

(declare-fun lt!379975 () (_ BitVec 64))

(declare-fun lt!379977 () (_ BitVec 64))

(declare-fun lt!379976 () (_ BitVec 64))

(assert (=> d!81822 (= res!203724 (= lt!379977 (bvsub lt!379976 lt!379975)))))

(assert (=> d!81822 (or (= (bvand lt!379976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!379975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379976 lt!379975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81822 (= lt!379975 (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379528)))) ((_ sign_extend 32) (currentByte!11695 (_1!11363 lt!379528))) ((_ sign_extend 32) (currentBit!11690 (_1!11363 lt!379528)))))))

(declare-fun lt!379979 () (_ BitVec 64))

(declare-fun lt!379978 () (_ BitVec 64))

(assert (=> d!81822 (= lt!379976 (bvmul lt!379979 lt!379978))))

(assert (=> d!81822 (or (= lt!379979 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!379978 (bvsdiv (bvmul lt!379979 lt!379978) lt!379979)))))

(assert (=> d!81822 (= lt!379978 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81822 (= lt!379979 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379528)))))))

(assert (=> d!81822 (= lt!379977 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11695 (_1!11363 lt!379528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11690 (_1!11363 lt!379528)))))))

(assert (=> d!81822 (invariant!0 (currentBit!11690 (_1!11363 lt!379528)) (currentByte!11695 (_1!11363 lt!379528)) (size!5854 (buf!6323 (_1!11363 lt!379528))))))

(assert (=> d!81822 (= (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379528))) (currentByte!11695 (_1!11363 lt!379528)) (currentBit!11690 (_1!11363 lt!379528))) lt!379977)))

(declare-fun b!243809 () Bool)

(declare-fun res!203723 () Bool)

(assert (=> b!243809 (=> (not res!203723) (not e!168993))))

(assert (=> b!243809 (= res!203723 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!379977))))

(declare-fun b!243810 () Bool)

(declare-fun lt!379980 () (_ BitVec 64))

(assert (=> b!243810 (= e!168993 (bvsle lt!379977 (bvmul lt!379980 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243810 (or (= lt!379980 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!379980 #b0000000000000000000000000000000000000000000000000000000000001000) lt!379980)))))

(assert (=> b!243810 (= lt!379980 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379528)))))))

(assert (= (and d!81822 res!203724) b!243809))

(assert (= (and b!243809 res!203723) b!243810))

(declare-fun m!367415 () Bool)

(assert (=> d!81822 m!367415))

(declare-fun m!367417 () Bool)

(assert (=> d!81822 m!367417))

(assert (=> b!243570 d!81822))

(declare-fun b!243811 () Bool)

(declare-fun res!203727 () Bool)

(declare-fun e!168994 () Bool)

(assert (=> b!243811 (=> (not res!203727) (not e!168994))))

(declare-fun lt!379993 () tuple2!20884)

(assert (=> b!243811 (= res!203727 (isPrefixOf!0 (_1!11364 lt!379993) thiss!1005))))

(declare-fun d!81824 () Bool)

(assert (=> d!81824 e!168994))

(declare-fun res!203725 () Bool)

(assert (=> d!81824 (=> (not res!203725) (not e!168994))))

(assert (=> d!81824 (= res!203725 (isPrefixOf!0 (_1!11364 lt!379993) (_2!11364 lt!379993)))))

(declare-fun lt!379999 () BitStream!10630)

(assert (=> d!81824 (= lt!379993 (tuple2!20885 lt!379999 (_2!11362 lt!379526)))))

(declare-fun lt!379992 () Unit!17797)

(declare-fun lt!379987 () Unit!17797)

(assert (=> d!81824 (= lt!379992 lt!379987)))

(assert (=> d!81824 (isPrefixOf!0 lt!379999 (_2!11362 lt!379526))))

(assert (=> d!81824 (= lt!379987 (lemmaIsPrefixTransitive!0 lt!379999 (_2!11362 lt!379526) (_2!11362 lt!379526)))))

(declare-fun lt!379990 () Unit!17797)

(declare-fun lt!379989 () Unit!17797)

(assert (=> d!81824 (= lt!379990 lt!379989)))

(assert (=> d!81824 (isPrefixOf!0 lt!379999 (_2!11362 lt!379526))))

(assert (=> d!81824 (= lt!379989 (lemmaIsPrefixTransitive!0 lt!379999 thiss!1005 (_2!11362 lt!379526)))))

(declare-fun lt!379986 () Unit!17797)

(declare-fun e!168995 () Unit!17797)

(assert (=> d!81824 (= lt!379986 e!168995)))

(declare-fun c!11460 () Bool)

(assert (=> d!81824 (= c!11460 (not (= (size!5854 (buf!6323 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!379984 () Unit!17797)

(declare-fun lt!379998 () Unit!17797)

(assert (=> d!81824 (= lt!379984 lt!379998)))

(assert (=> d!81824 (isPrefixOf!0 (_2!11362 lt!379526) (_2!11362 lt!379526))))

(assert (=> d!81824 (= lt!379998 (lemmaIsPrefixRefl!0 (_2!11362 lt!379526)))))

(declare-fun lt!379991 () Unit!17797)

(declare-fun lt!379996 () Unit!17797)

(assert (=> d!81824 (= lt!379991 lt!379996)))

(assert (=> d!81824 (= lt!379996 (lemmaIsPrefixRefl!0 (_2!11362 lt!379526)))))

(declare-fun lt!379988 () Unit!17797)

(declare-fun lt!379982 () Unit!17797)

(assert (=> d!81824 (= lt!379988 lt!379982)))

(assert (=> d!81824 (isPrefixOf!0 lt!379999 lt!379999)))

(assert (=> d!81824 (= lt!379982 (lemmaIsPrefixRefl!0 lt!379999))))

(declare-fun lt!379985 () Unit!17797)

(declare-fun lt!379983 () Unit!17797)

(assert (=> d!81824 (= lt!379985 lt!379983)))

(assert (=> d!81824 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!81824 (= lt!379983 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!81824 (= lt!379999 (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)))))

(assert (=> d!81824 (isPrefixOf!0 thiss!1005 (_2!11362 lt!379526))))

(assert (=> d!81824 (= (reader!0 thiss!1005 (_2!11362 lt!379526)) lt!379993)))

(declare-fun b!243812 () Bool)

(declare-fun res!203726 () Bool)

(assert (=> b!243812 (=> (not res!203726) (not e!168994))))

(assert (=> b!243812 (= res!203726 (isPrefixOf!0 (_2!11364 lt!379993) (_2!11362 lt!379526)))))

(declare-fun b!243813 () Bool)

(declare-fun lt!380000 () (_ BitVec 64))

(declare-fun lt!379994 () (_ BitVec 64))

(assert (=> b!243813 (= e!168994 (= (_1!11364 lt!379993) (withMovedBitIndex!0 (_2!11364 lt!379993) (bvsub lt!379994 lt!380000))))))

(assert (=> b!243813 (or (= (bvand lt!379994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!379994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!379994 lt!380000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243813 (= lt!380000 (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379526))) (currentByte!11695 (_2!11362 lt!379526)) (currentBit!11690 (_2!11362 lt!379526))))))

(assert (=> b!243813 (= lt!379994 (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)))))

(declare-fun b!243814 () Bool)

(declare-fun lt!379997 () Unit!17797)

(assert (=> b!243814 (= e!168995 lt!379997)))

(declare-fun lt!379981 () (_ BitVec 64))

(assert (=> b!243814 (= lt!379981 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!379995 () (_ BitVec 64))

(assert (=> b!243814 (= lt!379995 (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)))))

(assert (=> b!243814 (= lt!379997 (arrayBitRangesEqSymmetric!0 (buf!6323 thiss!1005) (buf!6323 (_2!11362 lt!379526)) lt!379981 lt!379995))))

(assert (=> b!243814 (arrayBitRangesEq!0 (buf!6323 (_2!11362 lt!379526)) (buf!6323 thiss!1005) lt!379981 lt!379995)))

(declare-fun b!243815 () Bool)

(declare-fun Unit!17806 () Unit!17797)

(assert (=> b!243815 (= e!168995 Unit!17806)))

(assert (= (and d!81824 c!11460) b!243814))

(assert (= (and d!81824 (not c!11460)) b!243815))

(assert (= (and d!81824 res!203725) b!243811))

(assert (= (and b!243811 res!203727) b!243812))

(assert (= (and b!243812 res!203726) b!243813))

(declare-fun m!367419 () Bool)

(assert (=> b!243811 m!367419))

(declare-fun m!367421 () Bool)

(assert (=> d!81824 m!367421))

(declare-fun m!367423 () Bool)

(assert (=> d!81824 m!367423))

(declare-fun m!367425 () Bool)

(assert (=> d!81824 m!367425))

(declare-fun m!367427 () Bool)

(assert (=> d!81824 m!367427))

(assert (=> d!81824 m!367369))

(declare-fun m!367429 () Bool)

(assert (=> d!81824 m!367429))

(assert (=> d!81824 m!367009))

(declare-fun m!367431 () Bool)

(assert (=> d!81824 m!367431))

(declare-fun m!367433 () Bool)

(assert (=> d!81824 m!367433))

(declare-fun m!367435 () Bool)

(assert (=> d!81824 m!367435))

(assert (=> d!81824 m!367379))

(assert (=> b!243814 m!366991))

(declare-fun m!367437 () Bool)

(assert (=> b!243814 m!367437))

(declare-fun m!367439 () Bool)

(assert (=> b!243814 m!367439))

(declare-fun m!367441 () Bool)

(assert (=> b!243813 m!367441))

(assert (=> b!243813 m!367041))

(assert (=> b!243813 m!366991))

(declare-fun m!367443 () Bool)

(assert (=> b!243812 m!367443))

(assert (=> b!243570 d!81824))

(declare-fun d!81826 () Bool)

(assert (=> d!81826 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379520)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!20696 () Bool)

(assert (= bs!20696 d!81826))

(assert (=> bs!20696 m!367329))

(assert (=> b!243570 d!81826))

(declare-fun b!243826 () Bool)

(declare-fun res!203737 () Bool)

(declare-fun e!169000 () Bool)

(assert (=> b!243826 (=> (not res!203737) (not e!169000))))

(declare-fun lt!380010 () tuple2!20880)

(assert (=> b!243826 (= res!203737 (isPrefixOf!0 thiss!1005 (_2!11362 lt!380010)))))

(declare-fun b!243827 () Bool)

(declare-fun e!169001 () Bool)

(assert (=> b!243827 (= e!169000 e!169001)))

(declare-fun res!203738 () Bool)

(assert (=> b!243827 (=> (not res!203738) (not e!169001))))

(declare-fun lt!380012 () tuple2!20882)

(assert (=> b!243827 (= res!203738 (and (= (_2!11363 lt!380012) bit!26) (= (_1!11363 lt!380012) (_2!11362 lt!380010))))))

(assert (=> b!243827 (= lt!380012 (readBitPure!0 (readerFrom!0 (_2!11362 lt!380010) (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005))))))

(declare-fun b!243825 () Bool)

(declare-fun res!203739 () Bool)

(assert (=> b!243825 (=> (not res!203739) (not e!169000))))

(declare-fun lt!380011 () (_ BitVec 64))

(declare-fun lt!380009 () (_ BitVec 64))

(assert (=> b!243825 (= res!203739 (= (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!380010))) (currentByte!11695 (_2!11362 lt!380010)) (currentBit!11690 (_2!11362 lt!380010))) (bvadd lt!380009 lt!380011)))))

(assert (=> b!243825 (or (not (= (bvand lt!380009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380011 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!380009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!380009 lt!380011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243825 (= lt!380011 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!243825 (= lt!380009 (bitIndex!0 (size!5854 (buf!6323 thiss!1005)) (currentByte!11695 thiss!1005) (currentBit!11690 thiss!1005)))))

(declare-fun b!243828 () Bool)

(assert (=> b!243828 (= e!169001 (= (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!380012))) (currentByte!11695 (_1!11363 lt!380012)) (currentBit!11690 (_1!11363 lt!380012))) (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!380010))) (currentByte!11695 (_2!11362 lt!380010)) (currentBit!11690 (_2!11362 lt!380010)))))))

(declare-fun d!81828 () Bool)

(assert (=> d!81828 e!169000))

(declare-fun res!203736 () Bool)

(assert (=> d!81828 (=> (not res!203736) (not e!169000))))

(assert (=> d!81828 (= res!203736 (= (size!5854 (buf!6323 thiss!1005)) (size!5854 (buf!6323 (_2!11362 lt!380010)))))))

(declare-fun choose!16 (BitStream!10630 Bool) tuple2!20880)

(assert (=> d!81828 (= lt!380010 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!81828 (validate_offset_bit!0 ((_ sign_extend 32) (size!5854 (buf!6323 thiss!1005))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005)))))

(assert (=> d!81828 (= (appendBit!0 thiss!1005 bit!26) lt!380010)))

(assert (= (and d!81828 res!203736) b!243825))

(assert (= (and b!243825 res!203739) b!243826))

(assert (= (and b!243826 res!203737) b!243827))

(assert (= (and b!243827 res!203738) b!243828))

(declare-fun m!367445 () Bool)

(assert (=> b!243828 m!367445))

(declare-fun m!367447 () Bool)

(assert (=> b!243828 m!367447))

(declare-fun m!367449 () Bool)

(assert (=> d!81828 m!367449))

(declare-fun m!367451 () Bool)

(assert (=> d!81828 m!367451))

(declare-fun m!367453 () Bool)

(assert (=> b!243827 m!367453))

(assert (=> b!243827 m!367453))

(declare-fun m!367455 () Bool)

(assert (=> b!243827 m!367455))

(declare-fun m!367457 () Bool)

(assert (=> b!243826 m!367457))

(assert (=> b!243825 m!367447))

(assert (=> b!243825 m!366991))

(assert (=> b!243570 d!81828))

(declare-fun d!81830 () Bool)

(declare-fun e!169002 () Bool)

(assert (=> d!81830 e!169002))

(declare-fun res!203741 () Bool)

(assert (=> d!81830 (=> (not res!203741) (not e!169002))))

(declare-fun lt!380013 () (_ BitVec 64))

(declare-fun lt!380015 () (_ BitVec 64))

(declare-fun lt!380014 () (_ BitVec 64))

(assert (=> d!81830 (= res!203741 (= lt!380015 (bvsub lt!380014 lt!380013)))))

(assert (=> d!81830 (or (= (bvand lt!380014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380014 lt!380013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81830 (= lt!380013 (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379521)))) ((_ sign_extend 32) (currentByte!11695 (_1!11363 lt!379521))) ((_ sign_extend 32) (currentBit!11690 (_1!11363 lt!379521)))))))

(declare-fun lt!380017 () (_ BitVec 64))

(declare-fun lt!380016 () (_ BitVec 64))

(assert (=> d!81830 (= lt!380014 (bvmul lt!380017 lt!380016))))

(assert (=> d!81830 (or (= lt!380017 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380016 (bvsdiv (bvmul lt!380017 lt!380016) lt!380017)))))

(assert (=> d!81830 (= lt!380016 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81830 (= lt!380017 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379521)))))))

(assert (=> d!81830 (= lt!380015 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11695 (_1!11363 lt!379521))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11690 (_1!11363 lt!379521)))))))

(assert (=> d!81830 (invariant!0 (currentBit!11690 (_1!11363 lt!379521)) (currentByte!11695 (_1!11363 lt!379521)) (size!5854 (buf!6323 (_1!11363 lt!379521))))))

(assert (=> d!81830 (= (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379521))) (currentByte!11695 (_1!11363 lt!379521)) (currentBit!11690 (_1!11363 lt!379521))) lt!380015)))

(declare-fun b!243829 () Bool)

(declare-fun res!203740 () Bool)

(assert (=> b!243829 (=> (not res!203740) (not e!169002))))

(assert (=> b!243829 (= res!203740 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380015))))

(declare-fun b!243830 () Bool)

(declare-fun lt!380018 () (_ BitVec 64))

(assert (=> b!243830 (= e!169002 (bvsle lt!380015 (bvmul lt!380018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243830 (or (= lt!380018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380018)))))

(assert (=> b!243830 (= lt!380018 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379521)))))))

(assert (= (and d!81830 res!203741) b!243829))

(assert (= (and b!243829 res!203740) b!243830))

(declare-fun m!367459 () Bool)

(assert (=> d!81830 m!367459))

(declare-fun m!367461 () Bool)

(assert (=> d!81830 m!367461))

(assert (=> b!243570 d!81830))

(declare-fun d!81832 () Bool)

(declare-fun e!169003 () Bool)

(assert (=> d!81832 e!169003))

(declare-fun res!203743 () Bool)

(assert (=> d!81832 (=> (not res!203743) (not e!169003))))

(declare-fun lt!380021 () (_ BitVec 64))

(declare-fun lt!380020 () (_ BitVec 64))

(declare-fun lt!380019 () (_ BitVec 64))

(assert (=> d!81832 (= res!203743 (= lt!380021 (bvsub lt!380020 lt!380019)))))

(assert (=> d!81832 (or (= (bvand lt!380020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380020 lt!380019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81832 (= lt!380019 (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379523)))) ((_ sign_extend 32) (currentByte!11695 (_1!11363 lt!379523))) ((_ sign_extend 32) (currentBit!11690 (_1!11363 lt!379523)))))))

(declare-fun lt!380023 () (_ BitVec 64))

(declare-fun lt!380022 () (_ BitVec 64))

(assert (=> d!81832 (= lt!380020 (bvmul lt!380023 lt!380022))))

(assert (=> d!81832 (or (= lt!380023 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380022 (bvsdiv (bvmul lt!380023 lt!380022) lt!380023)))))

(assert (=> d!81832 (= lt!380022 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81832 (= lt!380023 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379523)))))))

(assert (=> d!81832 (= lt!380021 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11695 (_1!11363 lt!379523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11690 (_1!11363 lt!379523)))))))

(assert (=> d!81832 (invariant!0 (currentBit!11690 (_1!11363 lt!379523)) (currentByte!11695 (_1!11363 lt!379523)) (size!5854 (buf!6323 (_1!11363 lt!379523))))))

(assert (=> d!81832 (= (bitIndex!0 (size!5854 (buf!6323 (_1!11363 lt!379523))) (currentByte!11695 (_1!11363 lt!379523)) (currentBit!11690 (_1!11363 lt!379523))) lt!380021)))

(declare-fun b!243831 () Bool)

(declare-fun res!203742 () Bool)

(assert (=> b!243831 (=> (not res!203742) (not e!169003))))

(assert (=> b!243831 (= res!203742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380021))))

(declare-fun b!243832 () Bool)

(declare-fun lt!380024 () (_ BitVec 64))

(assert (=> b!243832 (= e!169003 (bvsle lt!380021 (bvmul lt!380024 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243832 (or (= lt!380024 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380024 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380024)))))

(assert (=> b!243832 (= lt!380024 ((_ sign_extend 32) (size!5854 (buf!6323 (_1!11363 lt!379523)))))))

(assert (= (and d!81832 res!203743) b!243831))

(assert (= (and b!243831 res!203742) b!243832))

(declare-fun m!367463 () Bool)

(assert (=> d!81832 m!367463))

(declare-fun m!367465 () Bool)

(assert (=> d!81832 m!367465))

(assert (=> b!243580 d!81832))

(declare-fun d!81834 () Bool)

(declare-fun lt!380027 () tuple2!20900)

(declare-fun checkBitsLoop!0 (BitStream!10630 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20900)

(assert (=> d!81834 (= lt!380027 (checkBitsLoop!0 (_1!11364 lt!379522) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81834 (= (checkBitsLoopPure!0 (_1!11364 lt!379522) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!20883 (_2!11372 lt!380027) (_1!11372 lt!380027)))))

(declare-fun bs!20697 () Bool)

(assert (= bs!20697 d!81834))

(declare-fun m!367467 () Bool)

(assert (=> bs!20697 m!367467))

(assert (=> b!243579 d!81834))

(declare-fun d!81836 () Bool)

(assert (=> d!81836 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) lt!379519) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520)))) lt!379519))))

(declare-fun bs!20698 () Bool)

(assert (= bs!20698 d!81836))

(declare-fun m!367469 () Bool)

(assert (=> bs!20698 m!367469))

(assert (=> b!243579 d!81836))

(declare-fun d!81838 () Bool)

(assert (=> d!81838 (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 (_2!11362 lt!379526)))) ((_ sign_extend 32) (currentByte!11695 (_2!11362 lt!379520))) ((_ sign_extend 32) (currentBit!11690 (_2!11362 lt!379520))) lt!379519)))

(declare-fun lt!380028 () Unit!17797)

(assert (=> d!81838 (= lt!380028 (choose!9 (_2!11362 lt!379520) (buf!6323 (_2!11362 lt!379526)) lt!379519 (BitStream!10631 (buf!6323 (_2!11362 lt!379526)) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520)))))))

(assert (=> d!81838 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11362 lt!379520) (buf!6323 (_2!11362 lt!379526)) lt!379519) lt!380028)))

(declare-fun bs!20699 () Bool)

(assert (= bs!20699 d!81838))

(assert (=> bs!20699 m!367037))

(declare-fun m!367471 () Bool)

(assert (=> bs!20699 m!367471))

(assert (=> b!243579 d!81838))

(assert (=> b!243579 d!81802))

(declare-fun d!81840 () Bool)

(assert (=> d!81840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5854 (buf!6323 thiss!1005))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5854 (buf!6323 thiss!1005))) ((_ sign_extend 32) (currentByte!11695 thiss!1005)) ((_ sign_extend 32) (currentBit!11690 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20700 () Bool)

(assert (= bs!20700 d!81840))

(assert (=> bs!20700 m!367339))

(assert (=> b!243573 d!81840))

(declare-fun d!81842 () Bool)

(declare-fun res!203744 () Bool)

(declare-fun e!169005 () Bool)

(assert (=> d!81842 (=> (not res!203744) (not e!169005))))

(assert (=> d!81842 (= res!203744 (= (size!5854 (buf!6323 (_2!11362 lt!379520))) (size!5854 (buf!6323 (_2!11362 lt!379526)))))))

(assert (=> d!81842 (= (isPrefixOf!0 (_2!11362 lt!379520) (_2!11362 lt!379526)) e!169005)))

(declare-fun b!243833 () Bool)

(declare-fun res!203746 () Bool)

(assert (=> b!243833 (=> (not res!203746) (not e!169005))))

(assert (=> b!243833 (= res!203746 (bvsle (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520))) (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379526))) (currentByte!11695 (_2!11362 lt!379526)) (currentBit!11690 (_2!11362 lt!379526)))))))

(declare-fun b!243834 () Bool)

(declare-fun e!169004 () Bool)

(assert (=> b!243834 (= e!169005 e!169004)))

(declare-fun res!203745 () Bool)

(assert (=> b!243834 (=> res!203745 e!169004)))

(assert (=> b!243834 (= res!203745 (= (size!5854 (buf!6323 (_2!11362 lt!379520))) #b00000000000000000000000000000000))))

(declare-fun b!243835 () Bool)

(assert (=> b!243835 (= e!169004 (arrayBitRangesEq!0 (buf!6323 (_2!11362 lt!379520)) (buf!6323 (_2!11362 lt!379526)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5854 (buf!6323 (_2!11362 lt!379520))) (currentByte!11695 (_2!11362 lt!379520)) (currentBit!11690 (_2!11362 lt!379520)))))))

(assert (= (and d!81842 res!203744) b!243833))

(assert (= (and b!243833 res!203746) b!243834))

(assert (= (and b!243834 (not res!203745)) b!243835))

(assert (=> b!243833 m!366989))

(assert (=> b!243833 m!367041))

(assert (=> b!243835 m!366989))

(assert (=> b!243835 m!366989))

(declare-fun m!367473 () Bool)

(assert (=> b!243835 m!367473))

(assert (=> b!243572 d!81842))

(declare-fun d!81844 () Bool)

(assert (=> d!81844 (= (invariant!0 (currentBit!11690 thiss!1005) (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379526)))) (and (bvsge (currentBit!11690 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11690 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11695 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379526)))) (and (= (currentBit!11690 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11695 thiss!1005) (size!5854 (buf!6323 (_2!11362 lt!379526))))))))))

(assert (=> b!243571 d!81844))

(push 1)

(assert (not d!81838))

(assert (not d!81780))

(assert (not d!81782))

(assert (not b!243770))

(assert (not b!243781))

(assert (not d!81820))

(assert (not d!81800))

(assert (not d!81812))

(assert (not d!81824))

(assert (not d!81786))

(assert (not d!81828))

(assert (not b!243783))

(assert (not b!243767))

(assert (not d!81806))

(assert (not b!243765))

(assert (not d!81832))

(assert (not d!81822))

(assert (not b!243784))

(assert (not b!243835))

(assert (not b!243795))

(assert (not b!243813))

(assert (not d!81802))

(assert (not d!81830))

(assert (not b!243833))

(assert (not b!243825))

(assert (not d!81792))

(assert (not d!81840))

(assert (not b!243803))

(assert (not d!81798))

(assert (not b!243811))

(assert (not d!81834))

(assert (not d!81836))

(assert (not b!243828))

(assert (not b!243797))

(assert (not d!81814))

(assert (not d!81790))

(assert (not d!81818))

(assert (not d!81794))

(assert (not d!81808))

(assert (not b!243827))

(assert (not b!243796))

(assert (not b!243812))

(assert (not b!243808))

(assert (not d!81810))

(assert (not b!243805))

(assert (not b!243798))

(assert (not b!243782))

(assert (not b!243814))

(assert (not d!81804))

(assert (not d!81826))

(assert (not b!243826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

