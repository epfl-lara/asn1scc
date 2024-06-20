; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!806 () Bool)

(assert start!806)

(declare-fun b!2793 () Bool)

(declare-fun e!1940 () Bool)

(declare-datatypes ((array!252 0))(
  ( (array!253 (arr!490 (Array (_ BitVec 32) (_ BitVec 8))) (size!103 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!184 0))(
  ( (BitStream!185 (buf!415 array!252) (currentByte!1376 (_ BitVec 32)) (currentBit!1371 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!184)

(declare-fun array_inv!98 (array!252) Bool)

(assert (=> b!2793 (= e!1940 (array_inv!98 (buf!415 thiss!1486)))))

(declare-fun b!2794 () Bool)

(declare-fun e!1942 () Bool)

(declare-fun e!1939 () Bool)

(assert (=> b!2794 (= e!1942 e!1939)))

(declare-fun res!4450 () Bool)

(assert (=> b!2794 (=> (not res!4450) (not e!1939))))

(declare-datatypes ((Unit!184 0))(
  ( (Unit!185) )
))
(declare-datatypes ((tuple2!250 0))(
  ( (tuple2!251 (_1!132 Unit!184) (_2!132 BitStream!184)) )
))
(declare-fun lt!2594 () tuple2!250)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2794 (= res!4450 (invariant!0 (currentBit!1371 (_2!132 lt!2594)) (currentByte!1376 (_2!132 lt!2594)) (size!103 (buf!415 (_2!132 lt!2594)))))))

(declare-fun srcBuffer!6 () array!252)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!184 array!252 (_ BitVec 64) (_ BitVec 64)) tuple2!250)

(assert (=> b!2794 (= lt!2594 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2795 () Bool)

(declare-fun res!4449 () Bool)

(assert (=> b!2795 (=> (not res!4449) (not e!1942))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2795 (= res!4449 (validate_offset_bits!1 ((_ sign_extend 32) (size!103 (buf!415 thiss!1486))) ((_ sign_extend 32) (currentByte!1376 thiss!1486)) ((_ sign_extend 32) (currentBit!1371 thiss!1486)) nBits!460))))

(declare-fun b!2796 () Bool)

(declare-fun res!4447 () Bool)

(assert (=> b!2796 (=> (not res!4447) (not e!1939))))

(assert (=> b!2796 (= res!4447 (= (size!103 (buf!415 thiss!1486)) (size!103 (buf!415 (_2!132 lt!2594)))))))

(declare-fun b!2797 () Bool)

(declare-fun res!4446 () Bool)

(assert (=> b!2797 (=> (not res!4446) (not e!1939))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2797 (= res!4446 (= (bitIndex!0 (size!103 (buf!415 (_2!132 lt!2594))) (currentByte!1376 (_2!132 lt!2594)) (currentBit!1371 (_2!132 lt!2594))) (bvadd (bitIndex!0 (size!103 (buf!415 thiss!1486)) (currentByte!1376 thiss!1486) (currentBit!1371 thiss!1486)) nBits!460)))))

(declare-fun res!4445 () Bool)

(assert (=> start!806 (=> (not res!4445) (not e!1942))))

(assert (=> start!806 (= res!4445 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!103 srcBuffer!6))))))))

(assert (=> start!806 e!1942))

(assert (=> start!806 true))

(assert (=> start!806 (array_inv!98 srcBuffer!6)))

(declare-fun inv!12 (BitStream!184) Bool)

(assert (=> start!806 (and (inv!12 thiss!1486) e!1940)))

(declare-fun b!2798 () Bool)

(declare-fun res!4448 () Bool)

(assert (=> b!2798 (=> (not res!4448) (not e!1939))))

(declare-fun isPrefixOf!0 (BitStream!184 BitStream!184) Bool)

(assert (=> b!2798 (= res!4448 (isPrefixOf!0 thiss!1486 (_2!132 lt!2594)))))

(declare-fun b!2799 () Bool)

(assert (=> b!2799 (= e!1939 (not true))))

(declare-datatypes ((tuple2!252 0))(
  ( (tuple2!253 (_1!133 array!252) (_2!133 BitStream!184)) )
))
(declare-fun lt!2593 () tuple2!252)

(declare-datatypes ((tuple2!254 0))(
  ( (tuple2!255 (_1!134 BitStream!184) (_2!134 BitStream!184)) )
))
(declare-fun lt!2592 () tuple2!254)

(declare-fun readBits!0 (BitStream!184 (_ BitVec 64)) tuple2!252)

(assert (=> b!2799 (= lt!2593 (readBits!0 (_1!134 lt!2592) nBits!460))))

(assert (=> b!2799 (validate_offset_bits!1 ((_ sign_extend 32) (size!103 (buf!415 (_2!132 lt!2594)))) ((_ sign_extend 32) (currentByte!1376 thiss!1486)) ((_ sign_extend 32) (currentBit!1371 thiss!1486)) nBits!460)))

(declare-fun lt!2591 () Unit!184)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!184 array!252 (_ BitVec 64)) Unit!184)

(assert (=> b!2799 (= lt!2591 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!415 (_2!132 lt!2594)) nBits!460))))

(declare-fun reader!0 (BitStream!184 BitStream!184) tuple2!254)

(assert (=> b!2799 (= lt!2592 (reader!0 thiss!1486 (_2!132 lt!2594)))))

(assert (= (and start!806 res!4445) b!2795))

(assert (= (and b!2795 res!4449) b!2794))

(assert (= (and b!2794 res!4450) b!2796))

(assert (= (and b!2796 res!4447) b!2797))

(assert (= (and b!2797 res!4446) b!2798))

(assert (= (and b!2798 res!4448) b!2799))

(assert (= start!806 b!2793))

(declare-fun m!2691 () Bool)

(assert (=> b!2798 m!2691))

(declare-fun m!2693 () Bool)

(assert (=> b!2793 m!2693))

(declare-fun m!2695 () Bool)

(assert (=> b!2794 m!2695))

(declare-fun m!2697 () Bool)

(assert (=> b!2794 m!2697))

(declare-fun m!2699 () Bool)

(assert (=> b!2795 m!2699))

(declare-fun m!2701 () Bool)

(assert (=> b!2799 m!2701))

(declare-fun m!2703 () Bool)

(assert (=> b!2799 m!2703))

(declare-fun m!2705 () Bool)

(assert (=> b!2799 m!2705))

(declare-fun m!2707 () Bool)

(assert (=> b!2799 m!2707))

(declare-fun m!2709 () Bool)

(assert (=> b!2797 m!2709))

(declare-fun m!2711 () Bool)

(assert (=> b!2797 m!2711))

(declare-fun m!2713 () Bool)

(assert (=> start!806 m!2713))

(declare-fun m!2715 () Bool)

(assert (=> start!806 m!2715))

(push 1)

(assert (not b!2797))

(assert (not b!2793))

(assert (not start!806))

(assert (not b!2795))

(assert (not b!2799))

(assert (not b!2798))

(assert (not b!2794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

