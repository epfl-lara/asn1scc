; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48094 () Bool)

(assert start!48094)

(declare-fun res!191616 () Bool)

(declare-fun e!156525 () Bool)

(assert (=> start!48094 (=> (not res!191616) (not e!156525))))

(declare-datatypes ((array!11521 0))(
  ( (array!11522 (arr!6041 (Array (_ BitVec 32) (_ BitVec 8))) (size!5054 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11521)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48094 (= res!191616 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5054 arr!308))))))

(assert (=> start!48094 e!156525))

(assert (=> start!48094 true))

(declare-fun array_inv!4795 (array!11521) Bool)

(assert (=> start!48094 (array_inv!4795 arr!308)))

(declare-datatypes ((BitStream!9204 0))(
  ( (BitStream!9205 (buf!5595 array!11521) (currentByte!10457 (_ BitVec 32)) (currentBit!10452 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9204)

(declare-fun e!156526 () Bool)

(declare-fun inv!12 (BitStream!9204) Bool)

(assert (=> start!48094 (and (inv!12 thiss!1870) e!156526)))

(declare-fun b!228425 () Bool)

(assert (=> b!228425 (= e!156525 false)))

(declare-fun lt!366726 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228425 (= lt!366726 (bitIndex!0 (size!5054 (buf!5595 thiss!1870)) (currentByte!10457 thiss!1870) (currentBit!10452 thiss!1870)))))

(declare-fun b!228424 () Bool)

(declare-fun res!191617 () Bool)

(assert (=> b!228424 (=> (not res!191617) (not e!156525))))

(assert (=> b!228424 (= res!191617 (bvsge i!761 to!496))))

(declare-fun b!228426 () Bool)

(assert (=> b!228426 (= e!156526 (array_inv!4795 (buf!5595 thiss!1870)))))

(declare-fun b!228423 () Bool)

(declare-fun res!191615 () Bool)

(assert (=> b!228423 (=> (not res!191615) (not e!156525))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228423 (= res!191615 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5054 (buf!5595 thiss!1870))) ((_ sign_extend 32) (currentByte!10457 thiss!1870)) ((_ sign_extend 32) (currentBit!10452 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!48094 res!191616) b!228423))

(assert (= (and b!228423 res!191615) b!228424))

(assert (= (and b!228424 res!191617) b!228425))

(assert (= start!48094 b!228426))

(declare-fun m!352103 () Bool)

(assert (=> start!48094 m!352103))

(declare-fun m!352105 () Bool)

(assert (=> start!48094 m!352105))

(declare-fun m!352107 () Bool)

(assert (=> b!228425 m!352107))

(declare-fun m!352109 () Bool)

(assert (=> b!228426 m!352109))

(declare-fun m!352111 () Bool)

(assert (=> b!228423 m!352111))

(check-sat (not b!228423) (not start!48094) (not b!228426) (not b!228425))
