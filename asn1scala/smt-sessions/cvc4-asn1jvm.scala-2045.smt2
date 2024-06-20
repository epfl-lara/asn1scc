; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52202 () Bool)

(assert start!52202)

(declare-fun b!240306 () Bool)

(declare-fun e!166568 () Bool)

(declare-datatypes ((array!13133 0))(
  ( (array!13134 (arr!6738 (Array (_ BitVec 32) (_ BitVec 8))) (size!5751 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10424 0))(
  ( (BitStream!10425 (buf!6211 array!13133) (currentByte!11565 (_ BitVec 32)) (currentBit!11560 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20358 0))(
  ( (tuple2!20359 (_1!11101 BitStream!10424) (_2!11101 Bool)) )
))
(declare-fun lt!375345 () tuple2!20358)

(declare-datatypes ((tuple2!20360 0))(
  ( (tuple2!20361 (_1!11102 BitStream!10424) (_2!11102 BitStream!10424)) )
))
(declare-fun lt!375348 () tuple2!20360)

(assert (=> b!240306 (= e!166568 (not (or (not (_2!11101 lt!375345)) (not (= (_1!11101 lt!375345) (_2!11102 lt!375348))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10424 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20358)

(assert (=> b!240306 (= lt!375345 (checkBitsLoopPure!0 (_1!11102 lt!375348) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17603 0))(
  ( (Unit!17604) )
))
(declare-datatypes ((tuple2!20362 0))(
  ( (tuple2!20363 (_1!11103 Unit!17603) (_2!11103 BitStream!10424)) )
))
(declare-fun lt!375347 () tuple2!20362)

(declare-fun thiss!982 () BitStream!10424)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240306 (validate_offset_bits!1 ((_ sign_extend 32) (size!5751 (buf!6211 (_2!11103 lt!375347)))) ((_ sign_extend 32) (currentByte!11565 thiss!982)) ((_ sign_extend 32) (currentBit!11560 thiss!982)) nBits!288)))

(declare-fun lt!375346 () Unit!17603)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10424 array!13133 (_ BitVec 64)) Unit!17603)

(assert (=> b!240306 (= lt!375346 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6211 (_2!11103 lt!375347)) nBits!288))))

(declare-fun reader!0 (BitStream!10424 BitStream!10424) tuple2!20360)

(assert (=> b!240306 (= lt!375348 (reader!0 thiss!982 (_2!11103 lt!375347)))))

(declare-fun b!240307 () Bool)

(declare-fun res!200610 () Bool)

(assert (=> b!240307 (=> (not res!200610) (not e!166568))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240307 (= res!200610 (= (bitIndex!0 (size!5751 (buf!6211 (_2!11103 lt!375347))) (currentByte!11565 (_2!11103 lt!375347)) (currentBit!11560 (_2!11103 lt!375347))) (bvadd (bitIndex!0 (size!5751 (buf!6211 thiss!982)) (currentByte!11565 thiss!982) (currentBit!11560 thiss!982)) nBits!288)))))

(declare-fun b!240308 () Bool)

(declare-fun e!166565 () Bool)

(declare-fun array_inv!5492 (array!13133) Bool)

(assert (=> b!240308 (= e!166565 (array_inv!5492 (buf!6211 thiss!982)))))

(declare-fun b!240309 () Bool)

(declare-fun res!200609 () Bool)

(assert (=> b!240309 (=> (not res!200609) (not e!166568))))

(declare-fun isPrefixOf!0 (BitStream!10424 BitStream!10424) Bool)

(assert (=> b!240309 (= res!200609 (isPrefixOf!0 thiss!982 (_2!11103 lt!375347)))))

(declare-fun b!240310 () Bool)

(declare-fun e!166567 () Bool)

(assert (=> b!240310 (= e!166567 (not true))))

(declare-fun lt!375350 () tuple2!20360)

(assert (=> b!240310 (= lt!375350 (reader!0 thiss!982 (_2!11103 lt!375347)))))

(declare-fun lt!375351 () Bool)

(assert (=> b!240310 (= lt!375351 (isPrefixOf!0 thiss!982 (_2!11103 lt!375347)))))

(declare-fun lt!375349 () (_ BitVec 64))

(assert (=> b!240310 (= lt!375349 (bitIndex!0 (size!5751 (buf!6211 (_2!11103 lt!375347))) (currentByte!11565 (_2!11103 lt!375347)) (currentBit!11560 (_2!11103 lt!375347))))))

(declare-fun lt!375344 () (_ BitVec 64))

(assert (=> b!240310 (= lt!375344 (bitIndex!0 (size!5751 (buf!6211 thiss!982)) (currentByte!11565 thiss!982) (currentBit!11560 thiss!982)))))

(assert (=> b!240310 e!166568))

(declare-fun res!200613 () Bool)

(assert (=> b!240310 (=> (not res!200613) (not e!166568))))

(assert (=> b!240310 (= res!200613 (= (size!5751 (buf!6211 thiss!982)) (size!5751 (buf!6211 (_2!11103 lt!375347)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10424 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20362)

(assert (=> b!240310 (= lt!375347 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!200611 () Bool)

(assert (=> start!52202 (=> (not res!200611) (not e!166567))))

(assert (=> start!52202 (= res!200611 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52202 e!166567))

(assert (=> start!52202 true))

(declare-fun inv!12 (BitStream!10424) Bool)

(assert (=> start!52202 (and (inv!12 thiss!982) e!166565)))

(declare-fun b!240311 () Bool)

(declare-fun res!200612 () Bool)

(assert (=> b!240311 (=> (not res!200612) (not e!166567))))

(assert (=> b!240311 (= res!200612 (validate_offset_bits!1 ((_ sign_extend 32) (size!5751 (buf!6211 thiss!982))) ((_ sign_extend 32) (currentByte!11565 thiss!982)) ((_ sign_extend 32) (currentBit!11560 thiss!982)) nBits!288))))

(assert (= (and start!52202 res!200611) b!240311))

(assert (= (and b!240311 res!200612) b!240310))

(assert (= (and b!240310 res!200613) b!240307))

(assert (= (and b!240307 res!200610) b!240309))

(assert (= (and b!240309 res!200609) b!240306))

(assert (= start!52202 b!240308))

(declare-fun m!362771 () Bool)

(assert (=> b!240311 m!362771))

(declare-fun m!362773 () Bool)

(assert (=> b!240307 m!362773))

(declare-fun m!362775 () Bool)

(assert (=> b!240307 m!362775))

(declare-fun m!362777 () Bool)

(assert (=> b!240308 m!362777))

(assert (=> b!240310 m!362773))

(declare-fun m!362779 () Bool)

(assert (=> b!240310 m!362779))

(assert (=> b!240310 m!362775))

(declare-fun m!362781 () Bool)

(assert (=> b!240310 m!362781))

(declare-fun m!362783 () Bool)

(assert (=> b!240310 m!362783))

(assert (=> b!240309 m!362783))

(declare-fun m!362785 () Bool)

(assert (=> b!240306 m!362785))

(declare-fun m!362787 () Bool)

(assert (=> b!240306 m!362787))

(declare-fun m!362789 () Bool)

(assert (=> b!240306 m!362789))

(assert (=> b!240306 m!362779))

(declare-fun m!362791 () Bool)

(assert (=> start!52202 m!362791))

(push 1)

