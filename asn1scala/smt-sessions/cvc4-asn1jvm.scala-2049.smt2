; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52226 () Bool)

(assert start!52226)

(declare-fun res!200793 () Bool)

(declare-fun e!166709 () Bool)

(assert (=> start!52226 (=> (not res!200793) (not e!166709))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52226 (= res!200793 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52226 e!166709))

(assert (=> start!52226 true))

(declare-datatypes ((array!13157 0))(
  ( (array!13158 (arr!6750 (Array (_ BitVec 32) (_ BitVec 8))) (size!5763 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10448 0))(
  ( (BitStream!10449 (buf!6223 array!13157) (currentByte!11577 (_ BitVec 32)) (currentBit!11572 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10448)

(declare-fun e!166712 () Bool)

(declare-fun inv!12 (BitStream!10448) Bool)

(assert (=> start!52226 (and (inv!12 thiss!982) e!166712)))

(declare-fun b!240522 () Bool)

(declare-fun array_inv!5504 (array!13157) Bool)

(assert (=> b!240522 (= e!166712 (array_inv!5504 (buf!6223 thiss!982)))))

(declare-fun b!240523 () Bool)

(declare-fun res!200789 () Bool)

(assert (=> b!240523 (=> (not res!200789) (not e!166709))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240523 (= res!200789 (validate_offset_bits!1 ((_ sign_extend 32) (size!5763 (buf!6223 thiss!982))) ((_ sign_extend 32) (currentByte!11577 thiss!982)) ((_ sign_extend 32) (currentBit!11572 thiss!982)) nBits!288))))

(declare-fun b!240524 () Bool)

(assert (=> b!240524 (= e!166709 (not true))))

(declare-datatypes ((Unit!17627 0))(
  ( (Unit!17628) )
))
(declare-datatypes ((tuple2!20430 0))(
  ( (tuple2!20431 (_1!11137 Unit!17627) (_2!11137 BitStream!10448)) )
))
(declare-fun lt!375653 () tuple2!20430)

(assert (=> b!240524 (validate_offset_bits!1 ((_ sign_extend 32) (size!5763 (buf!6223 (_2!11137 lt!375653)))) ((_ sign_extend 32) (currentByte!11577 thiss!982)) ((_ sign_extend 32) (currentBit!11572 thiss!982)) nBits!288)))

(declare-fun lt!375655 () Unit!17627)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10448 array!13157 (_ BitVec 64)) Unit!17627)

(assert (=> b!240524 (= lt!375655 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6223 (_2!11137 lt!375653)) nBits!288))))

(declare-datatypes ((tuple2!20432 0))(
  ( (tuple2!20433 (_1!11138 BitStream!10448) (_2!11138 BitStream!10448)) )
))
(declare-fun lt!375649 () tuple2!20432)

(declare-fun reader!0 (BitStream!10448 BitStream!10448) tuple2!20432)

(assert (=> b!240524 (= lt!375649 (reader!0 thiss!982 (_2!11137 lt!375653)))))

(declare-fun lt!375657 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10448 BitStream!10448) Bool)

(assert (=> b!240524 (= lt!375657 (isPrefixOf!0 thiss!982 (_2!11137 lt!375653)))))

(declare-fun lt!375656 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240524 (= lt!375656 (bitIndex!0 (size!5763 (buf!6223 (_2!11137 lt!375653))) (currentByte!11577 (_2!11137 lt!375653)) (currentBit!11572 (_2!11137 lt!375653))))))

(declare-fun lt!375654 () (_ BitVec 64))

(assert (=> b!240524 (= lt!375654 (bitIndex!0 (size!5763 (buf!6223 thiss!982)) (currentByte!11577 thiss!982) (currentBit!11572 thiss!982)))))

(declare-fun e!166711 () Bool)

(assert (=> b!240524 e!166711))

(declare-fun res!200790 () Bool)

(assert (=> b!240524 (=> (not res!200790) (not e!166711))))

(assert (=> b!240524 (= res!200790 (= (size!5763 (buf!6223 thiss!982)) (size!5763 (buf!6223 (_2!11137 lt!375653)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10448 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20430)

(assert (=> b!240524 (= lt!375653 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240525 () Bool)

(declare-datatypes ((tuple2!20434 0))(
  ( (tuple2!20435 (_1!11139 BitStream!10448) (_2!11139 Bool)) )
))
(declare-fun lt!375652 () tuple2!20434)

(declare-fun lt!375650 () tuple2!20432)

(assert (=> b!240525 (= e!166711 (not (or (not (_2!11139 lt!375652)) (not (= (_1!11139 lt!375652) (_2!11138 lt!375650))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10448 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20434)

(assert (=> b!240525 (= lt!375652 (checkBitsLoopPure!0 (_1!11138 lt!375650) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240525 (validate_offset_bits!1 ((_ sign_extend 32) (size!5763 (buf!6223 (_2!11137 lt!375653)))) ((_ sign_extend 32) (currentByte!11577 thiss!982)) ((_ sign_extend 32) (currentBit!11572 thiss!982)) nBits!288)))

(declare-fun lt!375651 () Unit!17627)

(assert (=> b!240525 (= lt!375651 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6223 (_2!11137 lt!375653)) nBits!288))))

(assert (=> b!240525 (= lt!375650 (reader!0 thiss!982 (_2!11137 lt!375653)))))

(declare-fun b!240526 () Bool)

(declare-fun res!200792 () Bool)

(assert (=> b!240526 (=> (not res!200792) (not e!166711))))

(assert (=> b!240526 (= res!200792 (isPrefixOf!0 thiss!982 (_2!11137 lt!375653)))))

(declare-fun b!240527 () Bool)

(declare-fun res!200791 () Bool)

(assert (=> b!240527 (=> (not res!200791) (not e!166711))))

(assert (=> b!240527 (= res!200791 (= (bitIndex!0 (size!5763 (buf!6223 (_2!11137 lt!375653))) (currentByte!11577 (_2!11137 lt!375653)) (currentBit!11572 (_2!11137 lt!375653))) (bvadd (bitIndex!0 (size!5763 (buf!6223 thiss!982)) (currentByte!11577 thiss!982) (currentBit!11572 thiss!982)) nBits!288)))))

(assert (= (and start!52226 res!200793) b!240523))

(assert (= (and b!240523 res!200789) b!240524))

(assert (= (and b!240524 res!200790) b!240527))

(assert (= (and b!240527 res!200791) b!240526))

(assert (= (and b!240526 res!200792) b!240525))

(assert (= start!52226 b!240522))

(declare-fun m!363035 () Bool)

(assert (=> b!240524 m!363035))

(declare-fun m!363037 () Bool)

(assert (=> b!240524 m!363037))

(declare-fun m!363039 () Bool)

(assert (=> b!240524 m!363039))

(declare-fun m!363041 () Bool)

(assert (=> b!240524 m!363041))

(declare-fun m!363043 () Bool)

(assert (=> b!240524 m!363043))

(declare-fun m!363045 () Bool)

(assert (=> b!240524 m!363045))

(declare-fun m!363047 () Bool)

(assert (=> b!240524 m!363047))

(assert (=> b!240526 m!363035))

(assert (=> b!240527 m!363045))

(assert (=> b!240527 m!363037))

(declare-fun m!363049 () Bool)

(assert (=> b!240525 m!363049))

(assert (=> b!240525 m!363043))

(assert (=> b!240525 m!363041))

(assert (=> b!240525 m!363047))

(declare-fun m!363051 () Bool)

(assert (=> b!240522 m!363051))

(declare-fun m!363053 () Bool)

(assert (=> b!240523 m!363053))

(declare-fun m!363055 () Bool)

(assert (=> start!52226 m!363055))

(push 1)

