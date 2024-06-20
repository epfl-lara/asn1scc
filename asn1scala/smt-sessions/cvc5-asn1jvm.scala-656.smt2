; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18442 () Bool)

(assert start!18442)

(declare-fun b!91490 () Bool)

(declare-fun res!75543 () Bool)

(declare-fun e!60144 () Bool)

(assert (=> b!91490 (=> (not res!75543) (not e!60144))))

(declare-datatypes ((array!4275 0))(
  ( (array!4276 (arr!2562 (Array (_ BitVec 32) (_ BitVec 8))) (size!1925 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3412 0))(
  ( (BitStream!3413 (buf!2315 array!4275) (currentByte!4614 (_ BitVec 32)) (currentBit!4609 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3412)

(declare-datatypes ((Unit!5842 0))(
  ( (Unit!5843) )
))
(declare-datatypes ((tuple2!7606 0))(
  ( (tuple2!7607 (_1!4048 Unit!5842) (_2!4048 BitStream!3412)) )
))
(declare-fun lt!137881 () tuple2!7606)

(declare-fun isPrefixOf!0 (BitStream!3412 BitStream!3412) Bool)

(assert (=> b!91490 (= res!75543 (isPrefixOf!0 thiss!1152 (_2!4048 lt!137881)))))

(declare-fun b!91491 () Bool)

(declare-fun e!60150 () Bool)

(assert (=> b!91491 (= e!60150 (not true))))

(declare-fun e!60145 () Bool)

(assert (=> b!91491 e!60145))

(declare-fun res!75553 () Bool)

(assert (=> b!91491 (=> (not res!75553) (not e!60145))))

(assert (=> b!91491 (= res!75553 (= (size!1925 (buf!2315 thiss!1152)) (size!1925 (buf!2315 (_2!4048 lt!137881)))))))

(declare-fun lt!137886 () Bool)

(declare-fun appendBit!0 (BitStream!3412 Bool) tuple2!7606)

(assert (=> b!91491 (= lt!137881 (appendBit!0 thiss!1152 lt!137886))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!91491 (= lt!137886 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91492 () Bool)

(declare-fun res!75545 () Bool)

(declare-fun e!60147 () Bool)

(assert (=> b!91492 (=> (not res!75545) (not e!60147))))

(declare-fun thiss!1151 () BitStream!3412)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91492 (= res!75545 (invariant!0 (currentBit!4609 thiss!1151) (currentByte!4614 thiss!1151) (size!1925 (buf!2315 thiss!1151))))))

(declare-fun res!75547 () Bool)

(assert (=> start!18442 (=> (not res!75547) (not e!60147))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18442 (= res!75547 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18442 e!60147))

(declare-fun e!60142 () Bool)

(declare-fun inv!12 (BitStream!3412) Bool)

(assert (=> start!18442 (and (inv!12 thiss!1152) e!60142)))

(declare-fun e!60149 () Bool)

(assert (=> start!18442 (and (inv!12 thiss!1151) e!60149)))

(assert (=> start!18442 true))

(declare-fun b!91493 () Bool)

(declare-fun res!75541 () Bool)

(assert (=> b!91493 (=> (not res!75541) (not e!60150))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91493 (= res!75541 (validate_offset_bits!1 ((_ sign_extend 32) (size!1925 (buf!2315 thiss!1152))) ((_ sign_extend 32) (currentByte!4614 thiss!1152)) ((_ sign_extend 32) (currentBit!4609 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91494 () Bool)

(declare-fun array_inv!1771 (array!4275) Bool)

(assert (=> b!91494 (= e!60149 (array_inv!1771 (buf!2315 thiss!1151)))))

(declare-fun b!91495 () Bool)

(declare-fun res!75542 () Bool)

(assert (=> b!91495 (=> (not res!75542) (not e!60147))))

(assert (=> b!91495 (= res!75542 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91496 () Bool)

(declare-fun res!75546 () Bool)

(assert (=> b!91496 (=> (not res!75546) (not e!60147))))

(assert (=> b!91496 (= res!75546 (validate_offset_bits!1 ((_ sign_extend 32) (size!1925 (buf!2315 thiss!1151))) ((_ sign_extend 32) (currentByte!4614 thiss!1151)) ((_ sign_extend 32) (currentBit!4609 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91497 () Bool)

(assert (=> b!91497 (= e!60142 (array_inv!1771 (buf!2315 thiss!1152)))))

(declare-fun b!91498 () Bool)

(assert (=> b!91498 (= e!60147 e!60150)))

(declare-fun res!75549 () Bool)

(assert (=> b!91498 (=> (not res!75549) (not e!60150))))

(declare-fun lt!137884 () (_ BitVec 64))

(declare-fun lt!137883 () (_ BitVec 64))

(assert (=> b!91498 (= res!75549 (= lt!137884 (bvadd lt!137883 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91498 (= lt!137884 (bitIndex!0 (size!1925 (buf!2315 thiss!1152)) (currentByte!4614 thiss!1152) (currentBit!4609 thiss!1152)))))

(assert (=> b!91498 (= lt!137883 (bitIndex!0 (size!1925 (buf!2315 thiss!1151)) (currentByte!4614 thiss!1151) (currentBit!4609 thiss!1151)))))

(declare-fun b!91499 () Bool)

(declare-fun res!75551 () Bool)

(assert (=> b!91499 (=> (not res!75551) (not e!60147))))

(assert (=> b!91499 (= res!75551 (and (bvsle i!576 nBits!336) (= (size!1925 (buf!2315 thiss!1152)) (size!1925 (buf!2315 thiss!1151)))))))

(declare-fun b!91500 () Bool)

(assert (=> b!91500 (= e!60145 e!60144)))

(declare-fun res!75550 () Bool)

(assert (=> b!91500 (=> (not res!75550) (not e!60144))))

(declare-fun lt!137882 () (_ BitVec 64))

(assert (=> b!91500 (= res!75550 (= lt!137882 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137884)))))

(assert (=> b!91500 (= lt!137882 (bitIndex!0 (size!1925 (buf!2315 (_2!4048 lt!137881))) (currentByte!4614 (_2!4048 lt!137881)) (currentBit!4609 (_2!4048 lt!137881))))))

(declare-fun b!91501 () Bool)

(declare-fun e!60143 () Bool)

(declare-datatypes ((tuple2!7608 0))(
  ( (tuple2!7609 (_1!4049 BitStream!3412) (_2!4049 Bool)) )
))
(declare-fun lt!137885 () tuple2!7608)

(assert (=> b!91501 (= e!60143 (= (bitIndex!0 (size!1925 (buf!2315 (_1!4049 lt!137885))) (currentByte!4614 (_1!4049 lt!137885)) (currentBit!4609 (_1!4049 lt!137885))) lt!137882))))

(declare-fun b!91502 () Bool)

(assert (=> b!91502 (= e!60144 e!60143)))

(declare-fun res!75544 () Bool)

(assert (=> b!91502 (=> (not res!75544) (not e!60143))))

(assert (=> b!91502 (= res!75544 (and (= (_2!4049 lt!137885) lt!137886) (= (_1!4049 lt!137885) (_2!4048 lt!137881))))))

(declare-fun readBitPure!0 (BitStream!3412) tuple2!7608)

(declare-fun readerFrom!0 (BitStream!3412 (_ BitVec 32) (_ BitVec 32)) BitStream!3412)

(assert (=> b!91502 (= lt!137885 (readBitPure!0 (readerFrom!0 (_2!4048 lt!137881) (currentBit!4609 thiss!1152) (currentByte!4614 thiss!1152))))))

(declare-fun b!91503 () Bool)

(declare-fun res!75548 () Bool)

(assert (=> b!91503 (=> (not res!75548) (not e!60150))))

(assert (=> b!91503 (= res!75548 (bvslt i!576 nBits!336))))

(declare-fun b!91504 () Bool)

(declare-fun res!75552 () Bool)

(assert (=> b!91504 (=> (not res!75552) (not e!60147))))

(assert (=> b!91504 (= res!75552 (invariant!0 (currentBit!4609 thiss!1152) (currentByte!4614 thiss!1152) (size!1925 (buf!2315 thiss!1152))))))

(assert (= (and start!18442 res!75547) b!91496))

(assert (= (and b!91496 res!75546) b!91492))

(assert (= (and b!91492 res!75545) b!91495))

(assert (= (and b!91495 res!75542) b!91504))

(assert (= (and b!91504 res!75552) b!91499))

(assert (= (and b!91499 res!75551) b!91498))

(assert (= (and b!91498 res!75549) b!91493))

(assert (= (and b!91493 res!75541) b!91503))

(assert (= (and b!91503 res!75548) b!91491))

(assert (= (and b!91491 res!75553) b!91500))

(assert (= (and b!91500 res!75550) b!91490))

(assert (= (and b!91490 res!75543) b!91502))

(assert (= (and b!91502 res!75544) b!91501))

(assert (= start!18442 b!91497))

(assert (= start!18442 b!91494))

(declare-fun m!135629 () Bool)

(assert (=> b!91490 m!135629))

(declare-fun m!135631 () Bool)

(assert (=> b!91494 m!135631))

(declare-fun m!135633 () Bool)

(assert (=> b!91498 m!135633))

(declare-fun m!135635 () Bool)

(assert (=> b!91498 m!135635))

(declare-fun m!135637 () Bool)

(assert (=> b!91492 m!135637))

(declare-fun m!135639 () Bool)

(assert (=> b!91496 m!135639))

(declare-fun m!135641 () Bool)

(assert (=> b!91500 m!135641))

(declare-fun m!135643 () Bool)

(assert (=> b!91497 m!135643))

(declare-fun m!135645 () Bool)

(assert (=> b!91493 m!135645))

(declare-fun m!135647 () Bool)

(assert (=> b!91502 m!135647))

(assert (=> b!91502 m!135647))

(declare-fun m!135649 () Bool)

(assert (=> b!91502 m!135649))

(declare-fun m!135651 () Bool)

(assert (=> start!18442 m!135651))

(declare-fun m!135653 () Bool)

(assert (=> start!18442 m!135653))

(declare-fun m!135655 () Bool)

(assert (=> b!91491 m!135655))

(declare-fun m!135657 () Bool)

(assert (=> b!91501 m!135657))

(declare-fun m!135659 () Bool)

(assert (=> b!91504 m!135659))

(push 1)

(assert (not b!91491))

(assert (not b!91498))

(assert (not start!18442))

(assert (not b!91490))

(assert (not b!91504))

(assert (not b!91500))

(assert (not b!91494))

(assert (not b!91492))

(assert (not b!91502))

(assert (not b!91496))

(assert (not b!91493))

(assert (not b!91497))

(assert (not b!91501))

(check-sat)

(pop 1)

