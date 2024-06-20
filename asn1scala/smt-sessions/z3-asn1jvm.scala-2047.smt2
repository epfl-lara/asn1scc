; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52212 () Bool)

(assert start!52212)

(declare-fun b!240396 () Bool)

(declare-fun e!166628 () Bool)

(declare-datatypes ((array!13143 0))(
  ( (array!13144 (arr!6743 (Array (_ BitVec 32) (_ BitVec 8))) (size!5756 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10434 0))(
  ( (BitStream!10435 (buf!6216 array!13143) (currentByte!11570 (_ BitVec 32)) (currentBit!11565 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10434)

(declare-fun array_inv!5497 (array!13143) Bool)

(assert (=> b!240396 (= e!166628 (array_inv!5497 (buf!6216 thiss!982)))))

(declare-fun b!240397 () Bool)

(declare-fun e!166627 () Bool)

(assert (=> b!240397 (= e!166627 (not true))))

(declare-datatypes ((tuple2!20388 0))(
  ( (tuple2!20389 (_1!11116 BitStream!10434) (_2!11116 BitStream!10434)) )
))
(declare-fun lt!375465 () tuple2!20388)

(declare-datatypes ((Unit!17613 0))(
  ( (Unit!17614) )
))
(declare-datatypes ((tuple2!20390 0))(
  ( (tuple2!20391 (_1!11117 Unit!17613) (_2!11117 BitStream!10434)) )
))
(declare-fun lt!375471 () tuple2!20390)

(declare-fun reader!0 (BitStream!10434 BitStream!10434) tuple2!20388)

(assert (=> b!240397 (= lt!375465 (reader!0 thiss!982 (_2!11117 lt!375471)))))

(declare-fun lt!375467 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10434 BitStream!10434) Bool)

(assert (=> b!240397 (= lt!375467 (isPrefixOf!0 thiss!982 (_2!11117 lt!375471)))))

(declare-fun lt!375464 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240397 (= lt!375464 (bitIndex!0 (size!5756 (buf!6216 (_2!11117 lt!375471))) (currentByte!11570 (_2!11117 lt!375471)) (currentBit!11565 (_2!11117 lt!375471))))))

(declare-fun lt!375469 () (_ BitVec 64))

(assert (=> b!240397 (= lt!375469 (bitIndex!0 (size!5756 (buf!6216 thiss!982)) (currentByte!11570 thiss!982) (currentBit!11565 thiss!982)))))

(declare-fun e!166625 () Bool)

(assert (=> b!240397 e!166625))

(declare-fun res!200687 () Bool)

(assert (=> b!240397 (=> (not res!200687) (not e!166625))))

(assert (=> b!240397 (= res!200687 (= (size!5756 (buf!6216 thiss!982)) (size!5756 (buf!6216 (_2!11117 lt!375471)))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10434 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20390)

(assert (=> b!240397 (= lt!375471 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240398 () Bool)

(declare-fun res!200686 () Bool)

(assert (=> b!240398 (=> (not res!200686) (not e!166627))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240398 (= res!200686 (validate_offset_bits!1 ((_ sign_extend 32) (size!5756 (buf!6216 thiss!982))) ((_ sign_extend 32) (currentByte!11570 thiss!982)) ((_ sign_extend 32) (currentBit!11565 thiss!982)) nBits!288))))

(declare-fun res!200684 () Bool)

(assert (=> start!52212 (=> (not res!200684) (not e!166627))))

(assert (=> start!52212 (= res!200684 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52212 e!166627))

(assert (=> start!52212 true))

(declare-fun inv!12 (BitStream!10434) Bool)

(assert (=> start!52212 (and (inv!12 thiss!982) e!166628)))

(declare-fun b!240399 () Bool)

(declare-datatypes ((tuple2!20392 0))(
  ( (tuple2!20393 (_1!11118 BitStream!10434) (_2!11118 Bool)) )
))
(declare-fun lt!375470 () tuple2!20392)

(declare-fun lt!375466 () tuple2!20388)

(assert (=> b!240399 (= e!166625 (not (or (not (_2!11118 lt!375470)) (not (= (_1!11118 lt!375470) (_2!11116 lt!375466))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10434 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20392)

(assert (=> b!240399 (= lt!375470 (checkBitsLoopPure!0 (_1!11116 lt!375466) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240399 (validate_offset_bits!1 ((_ sign_extend 32) (size!5756 (buf!6216 (_2!11117 lt!375471)))) ((_ sign_extend 32) (currentByte!11570 thiss!982)) ((_ sign_extend 32) (currentBit!11565 thiss!982)) nBits!288)))

(declare-fun lt!375468 () Unit!17613)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10434 array!13143 (_ BitVec 64)) Unit!17613)

(assert (=> b!240399 (= lt!375468 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6216 (_2!11117 lt!375471)) nBits!288))))

(assert (=> b!240399 (= lt!375466 (reader!0 thiss!982 (_2!11117 lt!375471)))))

(declare-fun b!240400 () Bool)

(declare-fun res!200685 () Bool)

(assert (=> b!240400 (=> (not res!200685) (not e!166625))))

(assert (=> b!240400 (= res!200685 (isPrefixOf!0 thiss!982 (_2!11117 lt!375471)))))

(declare-fun b!240401 () Bool)

(declare-fun res!200688 () Bool)

(assert (=> b!240401 (=> (not res!200688) (not e!166625))))

(assert (=> b!240401 (= res!200688 (= (bitIndex!0 (size!5756 (buf!6216 (_2!11117 lt!375471))) (currentByte!11570 (_2!11117 lt!375471)) (currentBit!11565 (_2!11117 lt!375471))) (bvadd (bitIndex!0 (size!5756 (buf!6216 thiss!982)) (currentByte!11570 thiss!982) (currentBit!11565 thiss!982)) nBits!288)))))

(assert (= (and start!52212 res!200684) b!240398))

(assert (= (and b!240398 res!200686) b!240397))

(assert (= (and b!240397 res!200687) b!240401))

(assert (= (and b!240401 res!200688) b!240400))

(assert (= (and b!240400 res!200685) b!240399))

(assert (= start!52212 b!240396))

(declare-fun m!362881 () Bool)

(assert (=> b!240400 m!362881))

(declare-fun m!362883 () Bool)

(assert (=> b!240398 m!362883))

(declare-fun m!362885 () Bool)

(assert (=> b!240397 m!362885))

(declare-fun m!362887 () Bool)

(assert (=> b!240397 m!362887))

(declare-fun m!362889 () Bool)

(assert (=> b!240397 m!362889))

(assert (=> b!240397 m!362881))

(declare-fun m!362891 () Bool)

(assert (=> b!240397 m!362891))

(declare-fun m!362893 () Bool)

(assert (=> start!52212 m!362893))

(assert (=> b!240401 m!362885))

(assert (=> b!240401 m!362889))

(declare-fun m!362895 () Bool)

(assert (=> b!240399 m!362895))

(declare-fun m!362897 () Bool)

(assert (=> b!240399 m!362897))

(declare-fun m!362899 () Bool)

(assert (=> b!240399 m!362899))

(assert (=> b!240399 m!362887))

(declare-fun m!362901 () Bool)

(assert (=> b!240396 m!362901))

(check-sat (not start!52212) (not b!240401) (not b!240399) (not b!240397) (not b!240398) (not b!240400) (not b!240396))
