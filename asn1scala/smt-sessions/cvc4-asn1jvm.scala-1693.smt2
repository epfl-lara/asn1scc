; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47052 () Bool)

(assert start!47052)

(declare-fun b!225056 () Bool)

(declare-fun res!188881 () Bool)

(declare-fun e!153498 () Bool)

(assert (=> b!225056 (=> (not res!188881) (not e!153498))))

(declare-datatypes ((array!11140 0))(
  ( (array!11141 (arr!5844 (Array (_ BitVec 32) (_ BitVec 8))) (size!4887 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8876 0))(
  ( (BitStream!8877 (buf!5431 array!11140) (currentByte!10192 (_ BitVec 32)) (currentBit!10187 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8876)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225056 (= res!188881 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4887 (buf!5431 thiss!1870))) ((_ sign_extend 32) (currentByte!10192 thiss!1870)) ((_ sign_extend 32) (currentBit!10187 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225058 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225058 (= e!153498 (not (invariant!0 (currentBit!10187 thiss!1870) (currentByte!10192 thiss!1870) (size!4887 (buf!5431 thiss!1870)))))))

(declare-fun res!188883 () Bool)

(assert (=> start!47052 (=> (not res!188883) (not e!153498))))

(declare-fun arr!308 () array!11140)

(assert (=> start!47052 (= res!188883 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4887 arr!308))))))

(assert (=> start!47052 e!153498))

(assert (=> start!47052 true))

(declare-fun array_inv!4628 (array!11140) Bool)

(assert (=> start!47052 (array_inv!4628 arr!308)))

(declare-fun e!153497 () Bool)

(declare-fun inv!12 (BitStream!8876) Bool)

(assert (=> start!47052 (and (inv!12 thiss!1870) e!153497)))

(declare-fun b!225059 () Bool)

(assert (=> b!225059 (= e!153497 (array_inv!4628 (buf!5431 thiss!1870)))))

(declare-fun b!225057 () Bool)

(declare-fun res!188882 () Bool)

(assert (=> b!225057 (=> (not res!188882) (not e!153498))))

(assert (=> b!225057 (= res!188882 (bvsge i!761 to!496))))

(assert (= (and start!47052 res!188883) b!225056))

(assert (= (and b!225056 res!188881) b!225057))

(assert (= (and b!225057 res!188882) b!225058))

(assert (= start!47052 b!225059))

(declare-fun m!345955 () Bool)

(assert (=> b!225056 m!345955))

(declare-fun m!345957 () Bool)

(assert (=> b!225058 m!345957))

(declare-fun m!345959 () Bool)

(assert (=> start!47052 m!345959))

(declare-fun m!345961 () Bool)

(assert (=> start!47052 m!345961))

(declare-fun m!345963 () Bool)

(assert (=> b!225059 m!345963))

(push 1)

(assert (not b!225056))

(assert (not b!225059))

(assert (not b!225058))

(assert (not start!47052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

