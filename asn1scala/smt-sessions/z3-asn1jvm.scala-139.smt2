; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3298 () Bool)

(assert start!3298)

(declare-fun res!13709 () Bool)

(declare-fun e!9125 () Bool)

(assert (=> start!3298 (=> (not res!13709) (not e!9125))))

(declare-fun nBytes!1 () (_ BitVec 32))

(assert (=> start!3298 (= res!13709 (bvsge nBytes!1 #b00000000000000000000000000000000))))

(assert (=> start!3298 e!9125))

(assert (=> start!3298 true))

(declare-datatypes ((array!845 0))(
  ( (array!846 (arr!788 (Array (_ BitVec 32) (_ BitVec 8))) (size!359 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!678 0))(
  ( (BitStream!679 (buf!710 array!845) (currentByte!1856 (_ BitVec 32)) (currentBit!1851 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!678)

(declare-fun e!9124 () Bool)

(declare-fun inv!12 (BitStream!678) Bool)

(assert (=> start!3298 (and (inv!12 thiss!1862) e!9124)))

(declare-fun b!14631 () Bool)

(declare-fun res!13708 () Bool)

(assert (=> b!14631 (=> (not res!13708) (not e!9125))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!14631 (= res!13708 (validate_offset_bytes!0 ((_ sign_extend 32) (size!359 (buf!710 thiss!1862))) ((_ sign_extend 32) (currentByte!1856 thiss!1862)) ((_ sign_extend 32) (currentBit!1851 thiss!1862)) nBytes!1))))

(declare-fun b!14632 () Bool)

(assert (=> b!14632 (= e!9125 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!359 (buf!710 thiss!1862))) ((_ sign_extend 32) (currentByte!1856 thiss!1862)) ((_ sign_extend 32) (currentBit!1851 thiss!1862)) nBytes!1)))))

(declare-fun b!14633 () Bool)

(declare-fun array_inv!348 (array!845) Bool)

(assert (=> b!14633 (= e!9124 (array_inv!348 (buf!710 thiss!1862)))))

(assert (= (and start!3298 res!13709) b!14631))

(assert (= (and b!14631 res!13708) b!14632))

(assert (= start!3298 b!14633))

(declare-fun m!21065 () Bool)

(assert (=> start!3298 m!21065))

(declare-fun m!21067 () Bool)

(assert (=> b!14631 m!21067))

(assert (=> b!14632 m!21067))

(declare-fun m!21069 () Bool)

(assert (=> b!14633 m!21069))

(check-sat (not b!14633) (not b!14632) (not b!14631) (not start!3298))
