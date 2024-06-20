; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3986 () Bool)

(assert start!3986)

(declare-fun b!17111 () Bool)

(declare-fun e!10838 () Bool)

(declare-datatypes ((array!1015 0))(
  ( (array!1016 (arr!860 (Array (_ BitVec 32) (_ BitVec 8))) (size!431 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!822 0))(
  ( (BitStream!823 (buf!794 array!1015) (currentByte!1973 (_ BitVec 32)) (currentBit!1968 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!822)

(declare-fun array_inv!420 (array!1015) Bool)

(assert (=> b!17111 (= e!10838 (array_inv!420 (buf!794 b!162)))))

(declare-fun res!15386 () Bool)

(declare-fun e!10839 () Bool)

(assert (=> start!3986 (=> (not res!15386) (not e!10839))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3986 (= res!15386 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3986 e!10839))

(assert (=> start!3986 true))

(declare-fun inv!12 (BitStream!822) Bool)

(assert (=> start!3986 (and (inv!12 b!162) e!10838)))

(declare-fun b!17108 () Bool)

(declare-fun res!15385 () Bool)

(assert (=> b!17108 (=> (not res!15385) (not e!10839))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17108 (= res!15385 (validate_offset_bits!1 ((_ sign_extend 32) (size!431 (buf!794 b!162))) ((_ sign_extend 32) (currentByte!1973 b!162)) ((_ sign_extend 32) (currentBit!1968 b!162)) origOffset!1))))

(declare-fun b!17109 () Bool)

(declare-fun res!15384 () Bool)

(assert (=> b!17109 (=> (not res!15384) (not e!10839))))

(assert (=> b!17109 (= res!15384 (and (bvsle ((_ sign_extend 32) (size!431 (buf!794 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1973 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1968 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!431 (buf!794 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1973 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1968 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!17110 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17110 (= e!10839 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1968 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1973 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!431 (buf!794 b!162)))))))))

(assert (= (and start!3986 res!15386) b!17108))

(assert (= (and b!17108 res!15385) b!17109))

(assert (= (and b!17109 res!15384) b!17110))

(assert (= start!3986 b!17111))

(declare-fun m!23285 () Bool)

(assert (=> b!17111 m!23285))

(declare-fun m!23287 () Bool)

(assert (=> start!3986 m!23287))

(declare-fun m!23289 () Bool)

(assert (=> b!17108 m!23289))

(declare-fun m!23291 () Bool)

(assert (=> b!17110 m!23291))

(check-sat (not b!17110) (not b!17111) (not start!3986) (not b!17108))
(check-sat)
(get-model)

