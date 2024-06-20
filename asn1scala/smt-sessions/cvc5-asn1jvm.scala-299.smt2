; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5966 () Bool)

(assert start!5966)

(declare-fun b!26868 () Bool)

(declare-fun e!18197 () Bool)

(declare-fun e!18205 () Bool)

(assert (=> b!26868 (= e!18197 e!18205)))

(declare-fun res!23203 () Bool)

(assert (=> b!26868 (=> res!23203 e!18205)))

(declare-fun lt!38480 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!38482 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!26868 (= res!23203 (not (= lt!38480 (bvsub (bvadd lt!38482 to!314) i!635))))))

(declare-datatypes ((array!1703 0))(
  ( (array!1704 (arr!1196 (Array (_ BitVec 32) (_ BitVec 8))) (size!734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1300 0))(
  ( (BitStream!1301 (buf!1061 array!1703) (currentByte!2386 (_ BitVec 32)) (currentBit!2381 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2171 0))(
  ( (Unit!2172) )
))
(declare-datatypes ((tuple2!2966 0))(
  ( (tuple2!2967 (_1!1570 Unit!2171) (_2!1570 BitStream!1300)) )
))
(declare-fun lt!38474 () tuple2!2966)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26868 (= lt!38480 (bitIndex!0 (size!734 (buf!1061 (_2!1570 lt!38474))) (currentByte!2386 (_2!1570 lt!38474)) (currentBit!2381 (_2!1570 lt!38474))))))

(declare-fun b!26869 () Bool)

(declare-fun e!18198 () Bool)

(assert (=> b!26869 (= e!18198 e!18197)))

(declare-fun res!23204 () Bool)

(assert (=> b!26869 (=> res!23204 e!18197)))

(declare-fun lt!38472 () tuple2!2966)

(declare-fun isPrefixOf!0 (BitStream!1300 BitStream!1300) Bool)

(assert (=> b!26869 (= res!23204 (not (isPrefixOf!0 (_2!1570 lt!38472) (_2!1570 lt!38474))))))

(declare-fun thiss!1379 () BitStream!1300)

(assert (=> b!26869 (isPrefixOf!0 thiss!1379 (_2!1570 lt!38474))))

(declare-fun lt!38486 () Unit!2171)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1300 BitStream!1300 BitStream!1300) Unit!2171)

(assert (=> b!26869 (= lt!38486 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1570 lt!38472) (_2!1570 lt!38474)))))

(declare-fun srcBuffer!2 () array!1703)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1300 array!1703 (_ BitVec 64) (_ BitVec 64)) tuple2!2966)

(assert (=> b!26869 (= lt!38474 (appendBitsMSBFirstLoop!0 (_2!1570 lt!38472) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18203 () Bool)

(assert (=> b!26869 e!18203))

(declare-fun res!23211 () Bool)

(assert (=> b!26869 (=> (not res!23211) (not e!18203))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26869 (= res!23211 (validate_offset_bits!1 ((_ sign_extend 32) (size!734 (buf!1061 (_2!1570 lt!38472)))) ((_ sign_extend 32) (currentByte!2386 thiss!1379)) ((_ sign_extend 32) (currentBit!2381 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38483 () Unit!2171)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1300 array!1703 (_ BitVec 64)) Unit!2171)

(assert (=> b!26869 (= lt!38483 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1061 (_2!1570 lt!38472)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2968 0))(
  ( (tuple2!2969 (_1!1571 BitStream!1300) (_2!1571 BitStream!1300)) )
))
(declare-fun lt!38473 () tuple2!2968)

(declare-fun reader!0 (BitStream!1300 BitStream!1300) tuple2!2968)

(assert (=> b!26869 (= lt!38473 (reader!0 thiss!1379 (_2!1570 lt!38472)))))

(declare-fun b!26870 () Bool)

(declare-fun res!23201 () Bool)

(declare-fun e!18200 () Bool)

(assert (=> b!26870 (=> res!23201 e!18200)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26870 (= res!23201 (not (invariant!0 (currentBit!2381 (_2!1570 lt!38472)) (currentByte!2386 (_2!1570 lt!38472)) (size!734 (buf!1061 (_2!1570 lt!38474))))))))

(declare-fun b!26871 () Bool)

(declare-fun res!23208 () Bool)

(declare-fun e!18202 () Bool)

(assert (=> b!26871 (=> res!23208 e!18202)))

(declare-fun lt!38485 () tuple2!2968)

(assert (=> b!26871 (= res!23208 (not (isPrefixOf!0 (_1!1571 lt!38485) (_2!1570 lt!38474))))))

(declare-fun b!26872 () Bool)

(declare-fun res!23206 () Bool)

(assert (=> b!26872 (=> res!23206 e!18202)))

(declare-fun lt!38477 () tuple2!2968)

(assert (=> b!26872 (= res!23206 (not (isPrefixOf!0 (_1!1571 lt!38477) (_2!1570 lt!38474))))))

(declare-fun b!26873 () Bool)

(declare-fun res!23202 () Bool)

(assert (=> b!26873 (=> res!23202 e!18205)))

(assert (=> b!26873 (= res!23202 (not (= (size!734 (buf!1061 thiss!1379)) (size!734 (buf!1061 (_2!1570 lt!38474))))))))

(declare-fun b!26874 () Bool)

(assert (=> b!26874 (= e!18200 e!18202)))

(declare-fun res!23200 () Bool)

(assert (=> b!26874 (=> res!23200 e!18202)))

(assert (=> b!26874 (= res!23200 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38487 () (_ BitVec 64))

(declare-datatypes ((List!351 0))(
  ( (Nil!348) (Cons!347 (h!466 Bool) (t!1101 List!351)) )
))
(declare-fun lt!38484 () List!351)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1300 BitStream!1300 (_ BitVec 64)) List!351)

(assert (=> b!26874 (= lt!38484 (bitStreamReadBitsIntoList!0 (_2!1570 lt!38474) (_1!1571 lt!38477) lt!38487))))

(declare-fun lt!38475 () List!351)

(assert (=> b!26874 (= lt!38475 (bitStreamReadBitsIntoList!0 (_2!1570 lt!38474) (_1!1571 lt!38485) (bvsub to!314 i!635)))))

(assert (=> b!26874 (validate_offset_bits!1 ((_ sign_extend 32) (size!734 (buf!1061 (_2!1570 lt!38474)))) ((_ sign_extend 32) (currentByte!2386 (_2!1570 lt!38472))) ((_ sign_extend 32) (currentBit!2381 (_2!1570 lt!38472))) lt!38487)))

(declare-fun lt!38481 () Unit!2171)

(assert (=> b!26874 (= lt!38481 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1570 lt!38472) (buf!1061 (_2!1570 lt!38474)) lt!38487))))

(assert (=> b!26874 (= lt!38477 (reader!0 (_2!1570 lt!38472) (_2!1570 lt!38474)))))

(assert (=> b!26874 (validate_offset_bits!1 ((_ sign_extend 32) (size!734 (buf!1061 (_2!1570 lt!38474)))) ((_ sign_extend 32) (currentByte!2386 thiss!1379)) ((_ sign_extend 32) (currentBit!2381 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38488 () Unit!2171)

(assert (=> b!26874 (= lt!38488 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1061 (_2!1570 lt!38474)) (bvsub to!314 i!635)))))

(assert (=> b!26874 (= lt!38485 (reader!0 thiss!1379 (_2!1570 lt!38474)))))

(declare-fun res!23197 () Bool)

(declare-fun e!18204 () Bool)

(assert (=> start!5966 (=> (not res!23197) (not e!18204))))

(assert (=> start!5966 (= res!23197 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!734 srcBuffer!2))))))))

(assert (=> start!5966 e!18204))

(assert (=> start!5966 true))

(declare-fun array_inv!703 (array!1703) Bool)

(assert (=> start!5966 (array_inv!703 srcBuffer!2)))

(declare-fun e!18208 () Bool)

(declare-fun inv!12 (BitStream!1300) Bool)

(assert (=> start!5966 (and (inv!12 thiss!1379) e!18208)))

(declare-fun b!26875 () Bool)

(declare-fun head!188 (List!351) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1300 array!1703 (_ BitVec 64) (_ BitVec 64)) List!351)

(assert (=> b!26875 (= e!18203 (= (head!188 (byteArrayBitContentToList!0 (_2!1570 lt!38472) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!188 (bitStreamReadBitsIntoList!0 (_2!1570 lt!38472) (_1!1571 lt!38473) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26876 () Bool)

(assert (=> b!26876 (= e!18208 (array_inv!703 (buf!1061 thiss!1379)))))

(declare-fun b!26877 () Bool)

(assert (=> b!26877 (= e!18202 true)))

(declare-fun lt!38478 () (_ BitVec 64))

(assert (=> b!26877 (= lt!38478 (bitIndex!0 (size!734 (buf!1061 (_1!1571 lt!38477))) (currentByte!2386 (_1!1571 lt!38477)) (currentBit!2381 (_1!1571 lt!38477))))))

(declare-fun lt!38479 () (_ BitVec 64))

(assert (=> b!26877 (= lt!38479 (bitIndex!0 (size!734 (buf!1061 (_1!1571 lt!38485))) (currentByte!2386 (_1!1571 lt!38485)) (currentBit!2381 (_1!1571 lt!38485))))))

(declare-fun b!26878 () Bool)

(declare-fun res!23195 () Bool)

(assert (=> b!26878 (=> res!23195 e!18205)))

(assert (=> b!26878 (= res!23195 (not (invariant!0 (currentBit!2381 (_2!1570 lt!38474)) (currentByte!2386 (_2!1570 lt!38474)) (size!734 (buf!1061 (_2!1570 lt!38474))))))))

(declare-fun b!26879 () Bool)

(declare-fun e!18207 () Bool)

(assert (=> b!26879 (= e!18207 e!18198)))

(declare-fun res!23196 () Bool)

(assert (=> b!26879 (=> res!23196 e!18198)))

(assert (=> b!26879 (= res!23196 (not (isPrefixOf!0 thiss!1379 (_2!1570 lt!38472))))))

(assert (=> b!26879 (validate_offset_bits!1 ((_ sign_extend 32) (size!734 (buf!1061 (_2!1570 lt!38472)))) ((_ sign_extend 32) (currentByte!2386 (_2!1570 lt!38472))) ((_ sign_extend 32) (currentBit!2381 (_2!1570 lt!38472))) lt!38487)))

(assert (=> b!26879 (= lt!38487 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38471 () Unit!2171)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1300 BitStream!1300 (_ BitVec 64) (_ BitVec 64)) Unit!2171)

(assert (=> b!26879 (= lt!38471 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1570 lt!38472) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1300 (_ BitVec 8) (_ BitVec 32)) tuple2!2966)

(assert (=> b!26879 (= lt!38472 (appendBitFromByte!0 thiss!1379 (select (arr!1196 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26880 () Bool)

(declare-fun res!23207 () Bool)

(assert (=> b!26880 (=> res!23207 e!18202)))

(declare-fun length!77 (List!351) Int)

(assert (=> b!26880 (= res!23207 (<= (length!77 lt!38475) 0))))

(declare-fun b!26881 () Bool)

(declare-fun e!18206 () Bool)

(assert (=> b!26881 (= e!18206 (= lt!38480 (bvsub (bvsub (bvadd (bitIndex!0 (size!734 (buf!1061 (_2!1570 lt!38472))) (currentByte!2386 (_2!1570 lt!38472)) (currentBit!2381 (_2!1570 lt!38472))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26882 () Bool)

(declare-fun res!23210 () Bool)

(assert (=> b!26882 (=> res!23210 e!18202)))

(assert (=> b!26882 (= res!23210 (not (isPrefixOf!0 (_1!1571 lt!38485) (_1!1571 lt!38477))))))

(declare-fun b!26883 () Bool)

(declare-fun res!23209 () Bool)

(assert (=> b!26883 (=> (not res!23209) (not e!18204))))

(assert (=> b!26883 (= res!23209 (validate_offset_bits!1 ((_ sign_extend 32) (size!734 (buf!1061 thiss!1379))) ((_ sign_extend 32) (currentByte!2386 thiss!1379)) ((_ sign_extend 32) (currentBit!2381 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26884 () Bool)

(assert (=> b!26884 (= e!18204 (not e!18207))))

(declare-fun res!23193 () Bool)

(assert (=> b!26884 (=> res!23193 e!18207)))

(assert (=> b!26884 (= res!23193 (bvsge i!635 to!314))))

(assert (=> b!26884 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38476 () Unit!2171)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1300) Unit!2171)

(assert (=> b!26884 (= lt!38476 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!26884 (= lt!38482 (bitIndex!0 (size!734 (buf!1061 thiss!1379)) (currentByte!2386 thiss!1379) (currentBit!2381 thiss!1379)))))

(declare-fun b!26885 () Bool)

(assert (=> b!26885 (= e!18205 e!18200)))

(declare-fun res!23198 () Bool)

(assert (=> b!26885 (=> res!23198 e!18200)))

(assert (=> b!26885 (= res!23198 (not (= (size!734 (buf!1061 (_2!1570 lt!38472))) (size!734 (buf!1061 (_2!1570 lt!38474))))))))

(assert (=> b!26885 e!18206))

(declare-fun res!23194 () Bool)

(assert (=> b!26885 (=> (not res!23194) (not e!18206))))

(assert (=> b!26885 (= res!23194 (= (size!734 (buf!1061 (_2!1570 lt!38474))) (size!734 (buf!1061 thiss!1379))))))

(declare-fun b!26886 () Bool)

(declare-fun res!23199 () Bool)

(assert (=> b!26886 (=> res!23199 e!18202)))

(assert (=> b!26886 (= res!23199 (or (not (= (buf!1061 (_1!1571 lt!38485)) (buf!1061 (_1!1571 lt!38477)))) (not (= (buf!1061 (_1!1571 lt!38485)) (buf!1061 (_2!1570 lt!38474)))) (bvsge lt!38480 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26887 () Bool)

(declare-fun res!23205 () Bool)

(assert (=> b!26887 (=> res!23205 e!18200)))

(assert (=> b!26887 (= res!23205 (not (invariant!0 (currentBit!2381 (_2!1570 lt!38472)) (currentByte!2386 (_2!1570 lt!38472)) (size!734 (buf!1061 (_2!1570 lt!38472))))))))

(assert (= (and start!5966 res!23197) b!26883))

(assert (= (and b!26883 res!23209) b!26884))

(assert (= (and b!26884 (not res!23193)) b!26879))

(assert (= (and b!26879 (not res!23196)) b!26869))

(assert (= (and b!26869 res!23211) b!26875))

(assert (= (and b!26869 (not res!23204)) b!26868))

(assert (= (and b!26868 (not res!23203)) b!26878))

(assert (= (and b!26878 (not res!23195)) b!26873))

(assert (= (and b!26873 (not res!23202)) b!26885))

(assert (= (and b!26885 res!23194) b!26881))

(assert (= (and b!26885 (not res!23198)) b!26887))

(assert (= (and b!26887 (not res!23205)) b!26870))

(assert (= (and b!26870 (not res!23201)) b!26874))

(assert (= (and b!26874 (not res!23200)) b!26880))

(assert (= (and b!26880 (not res!23207)) b!26871))

(assert (= (and b!26871 (not res!23208)) b!26872))

(assert (= (and b!26872 (not res!23206)) b!26882))

(assert (= (and b!26882 (not res!23210)) b!26886))

(assert (= (and b!26886 (not res!23199)) b!26877))

(assert (= start!5966 b!26876))

(declare-fun m!38517 () Bool)

(assert (=> b!26880 m!38517))

(declare-fun m!38519 () Bool)

(assert (=> b!26876 m!38519))

(declare-fun m!38521 () Bool)

(assert (=> b!26884 m!38521))

(declare-fun m!38523 () Bool)

(assert (=> b!26884 m!38523))

(declare-fun m!38525 () Bool)

(assert (=> b!26884 m!38525))

(declare-fun m!38527 () Bool)

(assert (=> b!26878 m!38527))

(declare-fun m!38529 () Bool)

(assert (=> b!26883 m!38529))

(declare-fun m!38531 () Bool)

(assert (=> start!5966 m!38531))

(declare-fun m!38533 () Bool)

(assert (=> start!5966 m!38533))

(declare-fun m!38535 () Bool)

(assert (=> b!26887 m!38535))

(declare-fun m!38537 () Bool)

(assert (=> b!26875 m!38537))

(assert (=> b!26875 m!38537))

(declare-fun m!38539 () Bool)

(assert (=> b!26875 m!38539))

(declare-fun m!38541 () Bool)

(assert (=> b!26875 m!38541))

(assert (=> b!26875 m!38541))

(declare-fun m!38543 () Bool)

(assert (=> b!26875 m!38543))

(declare-fun m!38545 () Bool)

(assert (=> b!26868 m!38545))

(declare-fun m!38547 () Bool)

(assert (=> b!26882 m!38547))

(declare-fun m!38549 () Bool)

(assert (=> b!26870 m!38549))

(declare-fun m!38551 () Bool)

(assert (=> b!26874 m!38551))

(declare-fun m!38553 () Bool)

(assert (=> b!26874 m!38553))

(declare-fun m!38555 () Bool)

(assert (=> b!26874 m!38555))

(declare-fun m!38557 () Bool)

(assert (=> b!26874 m!38557))

(declare-fun m!38559 () Bool)

(assert (=> b!26874 m!38559))

(declare-fun m!38561 () Bool)

(assert (=> b!26874 m!38561))

(declare-fun m!38563 () Bool)

(assert (=> b!26874 m!38563))

(declare-fun m!38565 () Bool)

(assert (=> b!26874 m!38565))

(declare-fun m!38567 () Bool)

(assert (=> b!26877 m!38567))

(declare-fun m!38569 () Bool)

(assert (=> b!26877 m!38569))

(declare-fun m!38571 () Bool)

(assert (=> b!26871 m!38571))

(declare-fun m!38573 () Bool)

(assert (=> b!26881 m!38573))

(declare-fun m!38575 () Bool)

(assert (=> b!26872 m!38575))

(declare-fun m!38577 () Bool)

(assert (=> b!26869 m!38577))

(declare-fun m!38579 () Bool)

(assert (=> b!26869 m!38579))

(declare-fun m!38581 () Bool)

(assert (=> b!26869 m!38581))

(declare-fun m!38583 () Bool)

(assert (=> b!26869 m!38583))

(declare-fun m!38585 () Bool)

(assert (=> b!26869 m!38585))

(declare-fun m!38587 () Bool)

(assert (=> b!26869 m!38587))

(declare-fun m!38589 () Bool)

(assert (=> b!26869 m!38589))

(declare-fun m!38591 () Bool)

(assert (=> b!26879 m!38591))

(declare-fun m!38593 () Bool)

(assert (=> b!26879 m!38593))

(declare-fun m!38595 () Bool)

(assert (=> b!26879 m!38595))

(assert (=> b!26879 m!38591))

(declare-fun m!38597 () Bool)

(assert (=> b!26879 m!38597))

(declare-fun m!38599 () Bool)

(assert (=> b!26879 m!38599))

(push 1)

