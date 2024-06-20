; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48092 () Bool)

(assert start!48092)

(declare-fun b!228414 () Bool)

(declare-fun e!156513 () Bool)

(declare-datatypes ((array!11519 0))(
  ( (array!11520 (arr!6040 (Array (_ BitVec 32) (_ BitVec 8))) (size!5053 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9202 0))(
  ( (BitStream!9203 (buf!5594 array!11519) (currentByte!10456 (_ BitVec 32)) (currentBit!10451 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9202)

(declare-fun array_inv!4794 (array!11519) Bool)

(assert (=> b!228414 (= e!156513 (array_inv!4794 (buf!5594 thiss!1870)))))

(declare-fun b!228411 () Bool)

(declare-fun res!191608 () Bool)

(declare-fun e!156512 () Bool)

(assert (=> b!228411 (=> (not res!191608) (not e!156512))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228411 (= res!191608 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5053 (buf!5594 thiss!1870))) ((_ sign_extend 32) (currentByte!10456 thiss!1870)) ((_ sign_extend 32) (currentBit!10451 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228412 () Bool)

(declare-fun res!191607 () Bool)

(assert (=> b!228412 (=> (not res!191607) (not e!156512))))

(assert (=> b!228412 (= res!191607 (bvsge i!761 to!496))))

(declare-fun res!191606 () Bool)

(assert (=> start!48092 (=> (not res!191606) (not e!156512))))

(declare-fun arr!308 () array!11519)

(assert (=> start!48092 (= res!191606 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5053 arr!308))))))

(assert (=> start!48092 e!156512))

(assert (=> start!48092 true))

(assert (=> start!48092 (array_inv!4794 arr!308)))

(declare-fun inv!12 (BitStream!9202) Bool)

(assert (=> start!48092 (and (inv!12 thiss!1870) e!156513)))

(declare-fun b!228413 () Bool)

(assert (=> b!228413 (= e!156512 false)))

(declare-fun lt!366723 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228413 (= lt!366723 (bitIndex!0 (size!5053 (buf!5594 thiss!1870)) (currentByte!10456 thiss!1870) (currentBit!10451 thiss!1870)))))

(assert (= (and start!48092 res!191606) b!228411))

(assert (= (and b!228411 res!191608) b!228412))

(assert (= (and b!228412 res!191607) b!228413))

(assert (= start!48092 b!228414))

(declare-fun m!352093 () Bool)

(assert (=> b!228414 m!352093))

(declare-fun m!352095 () Bool)

(assert (=> b!228411 m!352095))

(declare-fun m!352097 () Bool)

(assert (=> start!48092 m!352097))

(declare-fun m!352099 () Bool)

(assert (=> start!48092 m!352099))

(declare-fun m!352101 () Bool)

(assert (=> b!228413 m!352101))

(push 1)

(assert (not b!228411))

(assert (not start!48092))

(assert (not b!228414))

(assert (not b!228413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

