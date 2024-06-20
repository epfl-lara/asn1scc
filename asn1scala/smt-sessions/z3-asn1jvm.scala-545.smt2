; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15844 () Bool)

(assert start!15844)

(declare-fun b!79906 () Bool)

(declare-fun res!66133 () Bool)

(declare-fun e!52493 () Bool)

(assert (=> b!79906 (=> res!66133 e!52493)))

(declare-datatypes ((array!3456 0))(
  ( (array!3457 (arr!2200 (Array (_ BitVec 32) (_ BitVec 8))) (size!1593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2748 0))(
  ( (BitStream!2749 (buf!1983 array!3456) (currentByte!3875 (_ BitVec 32)) (currentBit!3870 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2748)

(declare-datatypes ((Unit!5262 0))(
  ( (Unit!5263) )
))
(declare-datatypes ((tuple3!252 0))(
  ( (tuple3!253 (_1!3711 Unit!5262) (_2!3711 BitStream!2748) (_3!147 array!3456)) )
))
(declare-fun lt!127072 () tuple3!252)

(declare-fun nBits!516 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79906 (= res!66133 (not (= (bvadd (bitIndex!0 (size!1593 (buf!1983 thiss!1716)) (currentByte!3875 thiss!1716) (currentBit!3870 thiss!1716)) nBits!516) (bitIndex!0 (size!1593 (buf!1983 (_2!3711 lt!127072))) (currentByte!3875 (_2!3711 lt!127072)) (currentBit!3870 (_2!3711 lt!127072))))))))

(declare-fun b!79907 () Bool)

(declare-fun res!66131 () Bool)

(assert (=> b!79907 (=> res!66131 e!52493)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79907 (= res!66131 (not (invariant!0 (currentBit!3870 (_2!3711 lt!127072)) (currentByte!3875 (_2!3711 lt!127072)) (size!1593 (buf!1983 (_2!3711 lt!127072))))))))

(declare-fun res!66129 () Bool)

(declare-fun e!52492 () Bool)

(assert (=> start!15844 (=> (not res!66129) (not e!52492))))

(assert (=> start!15844 (= res!66129 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15844 e!52492))

(assert (=> start!15844 true))

(declare-fun e!52491 () Bool)

(declare-fun inv!12 (BitStream!2748) Bool)

(assert (=> start!15844 (and (inv!12 thiss!1716) e!52491)))

(declare-fun b!79908 () Bool)

(declare-fun lt!127073 () (_ BitVec 32))

(assert (=> b!79908 (= e!52493 (or (not (= (size!1593 (_3!147 lt!127072)) lt!127073)) (bvsgt (currentByte!3875 thiss!1716) (currentByte!3875 (_2!3711 lt!127072)))))))

(declare-fun b!79909 () Bool)

(assert (=> b!79909 (= e!52492 false)))

(declare-fun lt!127074 () Bool)

(assert (=> b!79909 (= lt!127074 e!52493)))

(declare-fun res!66130 () Bool)

(assert (=> b!79909 (=> res!66130 e!52493)))

(assert (=> b!79909 (= res!66130 (not (= (buf!1983 (_2!3711 lt!127072)) (buf!1983 thiss!1716))))))

(declare-fun readBitsLoop!0 (BitStream!2748 (_ BitVec 64) array!3456 (_ BitVec 64) (_ BitVec 64)) tuple3!252)

(assert (=> b!79909 (= lt!127072 (readBitsLoop!0 thiss!1716 nBits!516 (array!3457 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) lt!127073) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516))))

(assert (=> b!79909 (= lt!127073 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!79910 () Bool)

(declare-fun res!66132 () Bool)

(assert (=> b!79910 (=> (not res!66132) (not e!52492))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79910 (= res!66132 (validate_offset_bits!1 ((_ sign_extend 32) (size!1593 (buf!1983 thiss!1716))) ((_ sign_extend 32) (currentByte!3875 thiss!1716)) ((_ sign_extend 32) (currentBit!3870 thiss!1716)) nBits!516))))

(declare-fun b!79911 () Bool)

(declare-fun array_inv!1439 (array!3456) Bool)

(assert (=> b!79911 (= e!52491 (array_inv!1439 (buf!1983 thiss!1716)))))

(assert (= (and start!15844 res!66129) b!79910))

(assert (= (and b!79910 res!66132) b!79909))

(assert (= (and b!79909 (not res!66130)) b!79906))

(assert (= (and b!79906 (not res!66133)) b!79907))

(assert (= (and b!79907 (not res!66131)) b!79908))

(assert (= start!15844 b!79911))

(declare-fun m!125465 () Bool)

(assert (=> b!79911 m!125465))

(declare-fun m!125467 () Bool)

(assert (=> b!79907 m!125467))

(declare-fun m!125469 () Bool)

(assert (=> b!79906 m!125469))

(declare-fun m!125471 () Bool)

(assert (=> b!79906 m!125471))

(declare-fun m!125473 () Bool)

(assert (=> start!15844 m!125473))

(declare-fun m!125475 () Bool)

(assert (=> b!79909 m!125475))

(declare-fun m!125477 () Bool)

(assert (=> b!79910 m!125477))

(check-sat (not b!79909) (not b!79911) (not b!79906) (not start!15844) (not b!79910) (not b!79907))
