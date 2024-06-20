; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25342 () Bool)

(assert start!25342)

(declare-fun b!127960 () Bool)

(declare-fun e!84846 () Bool)

(declare-datatypes ((array!5892 0))(
  ( (array!5893 (arr!3281 (Array (_ BitVec 32) (_ BitVec 8))) (size!2664 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4592 0))(
  ( (BitStream!4593 (buf!3022 array!5892) (currentByte!5770 (_ BitVec 32)) (currentBit!5765 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4592)

(assert (=> b!127960 (= e!84846 (or (bvsgt ((_ sign_extend 32) (size!2664 (buf!3022 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5770 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5765 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun res!105886 () Bool)

(assert (=> start!25342 (=> (not res!105886) (not e!84846))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5892)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25342 (= res!105886 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2664 arr!237))))))

(assert (=> start!25342 e!84846))

(assert (=> start!25342 true))

(declare-fun array_inv!2453 (array!5892) Bool)

(assert (=> start!25342 (array_inv!2453 arr!237)))

(declare-fun e!84847 () Bool)

(declare-fun inv!12 (BitStream!4592) Bool)

(assert (=> start!25342 (and (inv!12 thiss!1634) e!84847)))

(declare-fun b!127961 () Bool)

(assert (=> b!127961 (= e!84847 (array_inv!2453 (buf!3022 thiss!1634)))))

(declare-fun b!127962 () Bool)

(declare-fun res!105884 () Bool)

(assert (=> b!127962 (=> (not res!105884) (not e!84846))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127962 (= res!105884 (invariant!0 (currentBit!5765 thiss!1634) (currentByte!5770 thiss!1634) (size!2664 (buf!3022 thiss!1634))))))

(declare-fun b!127963 () Bool)

(declare-fun res!105885 () Bool)

(assert (=> b!127963 (=> (not res!105885) (not e!84846))))

(assert (=> b!127963 (= res!105885 (bvslt from!447 to!404))))

(declare-fun b!127964 () Bool)

(declare-fun res!105883 () Bool)

(assert (=> b!127964 (=> (not res!105883) (not e!84846))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127964 (= res!105883 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2664 (buf!3022 thiss!1634))) ((_ sign_extend 32) (currentByte!5770 thiss!1634)) ((_ sign_extend 32) (currentBit!5765 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25342 res!105886) b!127964))

(assert (= (and b!127964 res!105883) b!127963))

(assert (= (and b!127963 res!105885) b!127962))

(assert (= (and b!127962 res!105884) b!127960))

(assert (= start!25342 b!127961))

(declare-fun m!193763 () Bool)

(assert (=> start!25342 m!193763))

(declare-fun m!193765 () Bool)

(assert (=> start!25342 m!193765))

(declare-fun m!193767 () Bool)

(assert (=> b!127961 m!193767))

(declare-fun m!193769 () Bool)

(assert (=> b!127962 m!193769))

(declare-fun m!193771 () Bool)

(assert (=> b!127964 m!193771))

(push 1)

