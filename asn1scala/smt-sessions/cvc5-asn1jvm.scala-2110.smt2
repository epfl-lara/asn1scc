; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53622 () Bool)

(assert start!53622)

(declare-fun res!208428 () Bool)

(declare-fun e!172553 () Bool)

(assert (=> start!53622 (=> (not res!208428) (not e!172553))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53622 (= res!208428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53622 e!172553))

(assert (=> start!53622 true))

(declare-datatypes ((array!13552 0))(
  ( (array!13553 (arr!6928 (Array (_ BitVec 32) (_ BitVec 8))) (size!5941 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10804 0))(
  ( (BitStream!10805 (buf!6434 array!13552) (currentByte!11859 (_ BitVec 32)) (currentBit!11854 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10804)

(declare-fun e!172552 () Bool)

(declare-fun inv!12 (BitStream!10804) Bool)

(assert (=> start!53622 (and (inv!12 thiss!1005) e!172552)))

(declare-fun b!249051 () Bool)

(declare-fun res!208427 () Bool)

(assert (=> b!249051 (=> (not res!208427) (not e!172553))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249051 (= res!208427 (validate_offset_bits!1 ((_ sign_extend 32) (size!5941 (buf!6434 thiss!1005))) ((_ sign_extend 32) (currentByte!11859 thiss!1005)) ((_ sign_extend 32) (currentBit!11854 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249052 () Bool)

(assert (=> b!249052 (= e!172553 (and (not (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!249053 () Bool)

(declare-fun array_inv!5682 (array!13552) Bool)

(assert (=> b!249053 (= e!172552 (array_inv!5682 (buf!6434 thiss!1005)))))

(assert (= (and start!53622 res!208428) b!249051))

(assert (= (and b!249051 res!208427) b!249052))

(assert (= start!53622 b!249053))

(declare-fun m!375531 () Bool)

(assert (=> start!53622 m!375531))

(declare-fun m!375533 () Bool)

(assert (=> b!249051 m!375533))

(declare-fun m!375535 () Bool)

(assert (=> b!249053 m!375535))

(push 1)

(assert (not b!249051))

(assert (not start!53622))

(assert (not b!249053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

