; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42596 () Bool)

(assert start!42596)

(declare-fun res!168172 () Bool)

(declare-fun e!137758 () Bool)

(assert (=> start!42596 (=> (not res!168172) (not e!137758))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42596 (= res!168172 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42596 e!137758))

(assert (=> start!42596 true))

(declare-datatypes ((array!10178 0))(
  ( (array!10179 (arr!5410 (Array (_ BitVec 32) (_ BitVec 8))) (size!4480 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8068 0))(
  ( (BitStream!8069 (buf!4981 array!10178) (currentByte!9379 (_ BitVec 32)) (currentBit!9374 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8068)

(declare-fun e!137757 () Bool)

(declare-fun inv!12 (BitStream!8068) Bool)

(assert (=> start!42596 (and (inv!12 thiss!1204) e!137757)))

(declare-fun b!200856 () Bool)

(declare-fun res!168170 () Bool)

(assert (=> b!200856 (=> (not res!168170) (not e!137758))))

(assert (=> b!200856 (= res!168170 (= i!590 nBits!348))))

(declare-fun b!200857 () Bool)

(declare-fun e!137756 () Bool)

(assert (=> b!200857 (= e!137758 e!137756)))

(declare-fun res!168173 () Bool)

(assert (=> b!200857 (=> (not res!168173) (not e!137756))))

(declare-fun lt!313840 () (_ BitVec 64))

(assert (=> b!200857 (= res!168173 (= lt!313840 (bvsub (bvadd lt!313840 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200857 (= lt!313840 (bitIndex!0 (size!4480 (buf!4981 thiss!1204)) (currentByte!9379 thiss!1204) (currentBit!9374 thiss!1204)))))

(declare-fun b!200858 () Bool)

(declare-fun res!168174 () Bool)

(assert (=> b!200858 (=> (not res!168174) (not e!137758))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200858 (= res!168174 (invariant!0 (currentBit!9374 thiss!1204) (currentByte!9379 thiss!1204) (size!4480 (buf!4981 thiss!1204))))))

(declare-fun b!200859 () Bool)

(declare-fun res!168171 () Bool)

(assert (=> b!200859 (=> (not res!168171) (not e!137758))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200859 (= res!168171 (validate_offset_bits!1 ((_ sign_extend 32) (size!4480 (buf!4981 thiss!1204))) ((_ sign_extend 32) (currentByte!9379 thiss!1204)) ((_ sign_extend 32) (currentBit!9374 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200860 () Bool)

(declare-fun array_inv!4221 (array!10178) Bool)

(assert (=> b!200860 (= e!137757 (array_inv!4221 (buf!4981 thiss!1204)))))

(declare-fun b!200861 () Bool)

(assert (=> b!200861 (= e!137756 (not true))))

(declare-datatypes ((tuple2!17186 0))(
  ( (tuple2!17187 (_1!9244 BitStream!8068) (_2!9244 BitStream!8068)) )
))
(declare-fun lt!313838 () tuple2!17186)

(declare-fun reader!0 (BitStream!8068 BitStream!8068) tuple2!17186)

(assert (=> b!200861 (= lt!313838 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8068 BitStream!8068) Bool)

(assert (=> b!200861 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14262 0))(
  ( (Unit!14263) )
))
(declare-fun lt!313839 () Unit!14262)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8068) Unit!14262)

(assert (=> b!200861 (= lt!313839 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!42596 res!168172) b!200859))

(assert (= (and b!200859 res!168171) b!200858))

(assert (= (and b!200858 res!168174) b!200856))

(assert (= (and b!200856 res!168170) b!200857))

(assert (= (and b!200857 res!168173) b!200861))

(assert (= start!42596 b!200860))

(declare-fun m!311527 () Bool)

(assert (=> b!200861 m!311527))

(declare-fun m!311529 () Bool)

(assert (=> b!200861 m!311529))

(declare-fun m!311531 () Bool)

(assert (=> b!200861 m!311531))

(declare-fun m!311533 () Bool)

(assert (=> b!200860 m!311533))

(declare-fun m!311535 () Bool)

(assert (=> b!200859 m!311535))

(declare-fun m!311537 () Bool)

(assert (=> start!42596 m!311537))

(declare-fun m!311539 () Bool)

(assert (=> b!200858 m!311539))

(declare-fun m!311541 () Bool)

(assert (=> b!200857 m!311541))

(push 1)

(assert (not b!200859))

(assert (not b!200860))

(assert (not b!200861))

(assert (not start!42596))

(assert (not b!200857))

(assert (not b!200858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

