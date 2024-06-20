; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46278 () Bool)

(assert start!46278)

(declare-fun b!222901 () Bool)

(declare-fun res!187130 () Bool)

(declare-fun e!151637 () Bool)

(assert (=> b!222901 (=> (not res!187130) (not e!151637))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222901 (= res!187130 (bvslt i!761 to!496))))

(declare-fun b!222900 () Bool)

(declare-fun res!187129 () Bool)

(assert (=> b!222900 (=> (not res!187129) (not e!151637))))

(declare-datatypes ((array!10936 0))(
  ( (array!10937 (arr!5730 (Array (_ BitVec 32) (_ BitVec 8))) (size!4800 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8702 0))(
  ( (BitStream!8703 (buf!5344 array!10936) (currentByte!10014 (_ BitVec 32)) (currentBit!10009 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8702)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222900 (= res!187129 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4800 (buf!5344 thiss!1870))) ((_ sign_extend 32) (currentByte!10014 thiss!1870)) ((_ sign_extend 32) (currentBit!10009 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!187131 () Bool)

(assert (=> start!46278 (=> (not res!187131) (not e!151637))))

(declare-fun arr!308 () array!10936)

(assert (=> start!46278 (= res!187131 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4800 arr!308))))))

(assert (=> start!46278 e!151637))

(assert (=> start!46278 true))

(declare-fun array_inv!4541 (array!10936) Bool)

(assert (=> start!46278 (array_inv!4541 arr!308)))

(declare-fun e!151635 () Bool)

(declare-fun inv!12 (BitStream!8702) Bool)

(assert (=> start!46278 (and (inv!12 thiss!1870) e!151635)))

(declare-fun b!222902 () Bool)

(assert (=> b!222902 (= e!151637 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-datatypes ((tuple2!19020 0))(
  ( (tuple2!19021 (_1!10219 (_ BitVec 8)) (_2!10219 BitStream!8702)) )
))
(declare-fun lt!351476 () tuple2!19020)

(assert (=> b!222902 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4800 (buf!5344 (_2!10219 lt!351476)))) ((_ sign_extend 32) (currentByte!10014 (_2!10219 lt!351476))) ((_ sign_extend 32) (currentBit!10009 (_2!10219 lt!351476))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!16037 0))(
  ( (Unit!16038) )
))
(declare-fun lt!351475 () Unit!16037)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8702 BitStream!8702 (_ BitVec 64) (_ BitVec 32)) Unit!16037)

(assert (=> b!222902 (= lt!351475 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10219 lt!351476) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8702) tuple2!19020)

(assert (=> b!222902 (= lt!351476 (readByte!0 thiss!1870))))

(declare-fun b!222903 () Bool)

(assert (=> b!222903 (= e!151635 (array_inv!4541 (buf!5344 thiss!1870)))))

(assert (= (and start!46278 res!187131) b!222900))

(assert (= (and b!222900 res!187129) b!222901))

(assert (= (and b!222901 res!187130) b!222902))

(assert (= start!46278 b!222903))

(declare-fun m!341147 () Bool)

(assert (=> b!222900 m!341147))

(declare-fun m!341149 () Bool)

(assert (=> start!46278 m!341149))

(declare-fun m!341151 () Bool)

(assert (=> start!46278 m!341151))

(declare-fun m!341153 () Bool)

(assert (=> b!222902 m!341153))

(declare-fun m!341155 () Bool)

(assert (=> b!222902 m!341155))

(declare-fun m!341157 () Bool)

(assert (=> b!222902 m!341157))

(declare-fun m!341159 () Bool)

(assert (=> b!222903 m!341159))

(push 1)

(assert (not b!222900))

(assert (not b!222903))

(assert (not b!222902))

(assert (not start!46278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

