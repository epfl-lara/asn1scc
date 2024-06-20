; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3948 () Bool)

(assert start!3948)

(declare-fun res!15344 () Bool)

(declare-fun e!10784 () Bool)

(assert (=> start!3948 (=> (not res!15344) (not e!10784))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3948 (= res!15344 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3948 e!10784))

(assert (=> start!3948 true))

(declare-datatypes ((array!1000 0))(
  ( (array!1001 (arr!854 (Array (_ BitVec 32) (_ BitVec 8))) (size!425 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!810 0))(
  ( (BitStream!811 (buf!788 array!1000) (currentByte!1960 (_ BitVec 32)) (currentBit!1955 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!810)

(declare-fun e!10783 () Bool)

(declare-fun inv!12 (BitStream!810) Bool)

(assert (=> start!3948 (and (inv!12 b!162) e!10783)))

(declare-fun b!17049 () Bool)

(declare-fun res!15343 () Bool)

(assert (=> b!17049 (=> (not res!15343) (not e!10784))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17049 (= res!15343 (validate_offset_bits!1 ((_ sign_extend 32) (size!425 (buf!788 b!162))) ((_ sign_extend 32) (currentByte!1960 b!162)) ((_ sign_extend 32) (currentBit!1955 b!162)) origOffset!1))))

(declare-fun b!17050 () Bool)

(assert (=> b!17050 (= e!10784 (or (bvsgt ((_ sign_extend 32) (size!425 (buf!788 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1960 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1955 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!17051 () Bool)

(declare-fun array_inv!414 (array!1000) Bool)

(assert (=> b!17051 (= e!10783 (array_inv!414 (buf!788 b!162)))))

(assert (= (and start!3948 res!15344) b!17049))

(assert (= (and b!17049 res!15343) b!17050))

(assert (= start!3948 b!17051))

(declare-fun m!23235 () Bool)

(assert (=> start!3948 m!23235))

(declare-fun m!23237 () Bool)

(assert (=> b!17049 m!23237))

(declare-fun m!23239 () Bool)

(assert (=> b!17051 m!23239))

(check-sat (not start!3948) (not b!17049) (not b!17051))
(check-sat)
