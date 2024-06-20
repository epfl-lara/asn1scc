; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47240 () Bool)

(assert start!47240)

(declare-fun res!189269 () Bool)

(declare-fun e!153983 () Bool)

(assert (=> start!47240 (=> (not res!189269) (not e!153983))))

(declare-datatypes ((array!11222 0))(
  ( (array!11223 (arr!5881 (Array (_ BitVec 32) (_ BitVec 8))) (size!4924 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11222)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47240 (= res!189269 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4924 arr!308))))))

(assert (=> start!47240 e!153983))

(assert (=> start!47240 true))

(declare-fun array_inv!4665 (array!11222) Bool)

(assert (=> start!47240 (array_inv!4665 arr!308)))

(declare-datatypes ((BitStream!8944 0))(
  ( (BitStream!8945 (buf!5465 array!11222) (currentByte!10249 (_ BitVec 32)) (currentBit!10244 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8944)

(declare-fun e!153981 () Bool)

(declare-fun inv!12 (BitStream!8944) Bool)

(assert (=> start!47240 (and (inv!12 thiss!1870) e!153981)))

(declare-fun b!225546 () Bool)

(declare-fun res!189270 () Bool)

(assert (=> b!225546 (=> (not res!189270) (not e!153983))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225546 (= res!189270 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4924 (buf!5465 thiss!1870))) ((_ sign_extend 32) (currentByte!10249 thiss!1870)) ((_ sign_extend 32) (currentBit!10244 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225547 () Bool)

(assert (=> b!225547 (= e!153983 (and (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-fun b!225548 () Bool)

(assert (=> b!225548 (= e!153981 (array_inv!4665 (buf!5465 thiss!1870)))))

(assert (= (and start!47240 res!189269) b!225546))

(assert (= (and b!225546 res!189270) b!225547))

(assert (= start!47240 b!225548))

(declare-fun m!346593 () Bool)

(assert (=> start!47240 m!346593))

(declare-fun m!346595 () Bool)

(assert (=> start!47240 m!346595))

(declare-fun m!346597 () Bool)

(assert (=> b!225546 m!346597))

(declare-fun m!346599 () Bool)

(assert (=> b!225548 m!346599))

(push 1)

(assert (not b!225548))

(assert (not start!47240))

(assert (not b!225546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

