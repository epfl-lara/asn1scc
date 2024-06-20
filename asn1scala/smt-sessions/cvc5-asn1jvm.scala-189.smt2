; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3946 () Bool)

(assert start!3946)

(declare-fun res!15337 () Bool)

(declare-fun e!10775 () Bool)

(assert (=> start!3946 (=> (not res!15337) (not e!10775))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3946 (= res!15337 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3946 e!10775))

(assert (=> start!3946 true))

(declare-datatypes ((array!998 0))(
  ( (array!999 (arr!853 (Array (_ BitVec 32) (_ BitVec 8))) (size!424 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!808 0))(
  ( (BitStream!809 (buf!787 array!998) (currentByte!1959 (_ BitVec 32)) (currentBit!1954 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!808)

(declare-fun e!10774 () Bool)

(declare-fun inv!12 (BitStream!808) Bool)

(assert (=> start!3946 (and (inv!12 b!162) e!10774)))

(declare-fun b!17040 () Bool)

(declare-fun res!15338 () Bool)

(assert (=> b!17040 (=> (not res!15338) (not e!10775))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17040 (= res!15338 (validate_offset_bits!1 ((_ sign_extend 32) (size!424 (buf!787 b!162))) ((_ sign_extend 32) (currentByte!1959 b!162)) ((_ sign_extend 32) (currentBit!1954 b!162)) origOffset!1))))

(declare-fun b!17041 () Bool)

(assert (=> b!17041 (= e!10775 (or (bvsgt ((_ sign_extend 32) (size!424 (buf!787 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1959 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1954 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!17042 () Bool)

(declare-fun array_inv!413 (array!998) Bool)

(assert (=> b!17042 (= e!10774 (array_inv!413 (buf!787 b!162)))))

(assert (= (and start!3946 res!15337) b!17040))

(assert (= (and b!17040 res!15338) b!17041))

(assert (= start!3946 b!17042))

(declare-fun m!23229 () Bool)

(assert (=> start!3946 m!23229))

(declare-fun m!23231 () Bool)

(assert (=> b!17040 m!23231))

(declare-fun m!23233 () Bool)

(assert (=> b!17042 m!23233))

(push 1)

(assert (not b!17042))

(assert (not b!17040))

(assert (not start!3946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

