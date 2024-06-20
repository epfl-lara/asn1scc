; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39354 () Bool)

(assert start!39354)

(declare-fun b!176860 () Bool)

(declare-fun res!146564 () Bool)

(declare-fun e!123258 () Bool)

(assert (=> b!176860 (=> (not res!146564) (not e!123258))))

(declare-datatypes ((array!9546 0))(
  ( (array!9547 (arr!5139 (Array (_ BitVec 32) (_ BitVec 8))) (size!4209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7526 0))(
  ( (BitStream!7527 (buf!4652 array!9546) (currentByte!8823 (_ BitVec 32)) (currentBit!8818 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7526)

(declare-datatypes ((Unit!12732 0))(
  ( (Unit!12733) )
))
(declare-datatypes ((tuple2!15226 0))(
  ( (tuple2!15227 (_1!8258 Unit!12732) (_2!8258 BitStream!7526)) )
))
(declare-fun lt!272066 () tuple2!15226)

(declare-fun isPrefixOf!0 (BitStream!7526 BitStream!7526) Bool)

(assert (=> b!176860 (= res!146564 (isPrefixOf!0 thiss!1204 (_2!8258 lt!272066)))))

(declare-fun b!176861 () Bool)

(declare-fun e!123262 () Bool)

(declare-fun array_inv!3950 (array!9546) Bool)

(assert (=> b!176861 (= e!123262 (array_inv!3950 (buf!4652 thiss!1204)))))

(declare-fun b!176862 () Bool)

(declare-fun res!146565 () Bool)

(declare-fun e!123259 () Bool)

(assert (=> b!176862 (=> (not res!146565) (not e!123259))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176862 (= res!146565 (not (= i!590 nBits!348)))))

(declare-fun b!176863 () Bool)

(declare-fun res!146561 () Bool)

(assert (=> b!176863 (=> (not res!146561) (not e!123259))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176863 (= res!146561 (validate_offset_bits!1 ((_ sign_extend 32) (size!4209 (buf!4652 thiss!1204))) ((_ sign_extend 32) (currentByte!8823 thiss!1204)) ((_ sign_extend 32) (currentBit!8818 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!146568 () Bool)

(assert (=> start!39354 (=> (not res!146568) (not e!123259))))

(assert (=> start!39354 (= res!146568 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39354 e!123259))

(assert (=> start!39354 true))

(declare-fun inv!12 (BitStream!7526) Bool)

(assert (=> start!39354 (and (inv!12 thiss!1204) e!123262)))

(declare-fun b!176864 () Bool)

(declare-fun e!123260 () Bool)

(declare-datatypes ((tuple2!15228 0))(
  ( (tuple2!15229 (_1!8259 BitStream!7526) (_2!8259 Bool)) )
))
(declare-fun lt!272064 () tuple2!15228)

(declare-fun lt!272060 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176864 (= e!123260 (= (bitIndex!0 (size!4209 (buf!4652 (_1!8259 lt!272064))) (currentByte!8823 (_1!8259 lt!272064)) (currentBit!8818 (_1!8259 lt!272064))) lt!272060))))

(declare-fun b!176865 () Bool)

(declare-fun res!146562 () Bool)

(assert (=> b!176865 (=> (not res!146562) (not e!123259))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176865 (= res!146562 (invariant!0 (currentBit!8818 thiss!1204) (currentByte!8823 thiss!1204) (size!4209 (buf!4652 thiss!1204))))))

(declare-fun b!176866 () Bool)

(assert (=> b!176866 (= e!123259 (not true))))

(declare-fun lt!272062 () (_ BitVec 64))

(assert (=> b!176866 (= lt!272062 (bitIndex!0 (size!4209 (buf!4652 (_2!8258 lt!272066))) (currentByte!8823 (_2!8258 lt!272066)) (currentBit!8818 (_2!8258 lt!272066))))))

(declare-fun lt!272061 () (_ BitVec 64))

(assert (=> b!176866 (= lt!272061 (bitIndex!0 (size!4209 (buf!4652 thiss!1204)) (currentByte!8823 thiss!1204) (currentBit!8818 thiss!1204)))))

(declare-fun e!123261 () Bool)

(assert (=> b!176866 e!123261))

(declare-fun res!146563 () Bool)

(assert (=> b!176866 (=> (not res!146563) (not e!123261))))

(assert (=> b!176866 (= res!146563 (= (size!4209 (buf!4652 thiss!1204)) (size!4209 (buf!4652 (_2!8258 lt!272066)))))))

(declare-fun lt!272063 () Bool)

(declare-fun appendBit!0 (BitStream!7526 Bool) tuple2!15226)

(assert (=> b!176866 (= lt!272066 (appendBit!0 thiss!1204 lt!272063))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176866 (= lt!272063 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176867 () Bool)

(assert (=> b!176867 (= e!123261 e!123258)))

(declare-fun res!146566 () Bool)

(assert (=> b!176867 (=> (not res!146566) (not e!123258))))

(declare-fun lt!272065 () (_ BitVec 64))

(assert (=> b!176867 (= res!146566 (= lt!272060 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272065)))))

(assert (=> b!176867 (= lt!272060 (bitIndex!0 (size!4209 (buf!4652 (_2!8258 lt!272066))) (currentByte!8823 (_2!8258 lt!272066)) (currentBit!8818 (_2!8258 lt!272066))))))

(assert (=> b!176867 (= lt!272065 (bitIndex!0 (size!4209 (buf!4652 thiss!1204)) (currentByte!8823 thiss!1204) (currentBit!8818 thiss!1204)))))

(declare-fun b!176868 () Bool)

(assert (=> b!176868 (= e!123258 e!123260)))

(declare-fun res!146567 () Bool)

(assert (=> b!176868 (=> (not res!146567) (not e!123260))))

(assert (=> b!176868 (= res!146567 (and (= (_2!8259 lt!272064) lt!272063) (= (_1!8259 lt!272064) (_2!8258 lt!272066))))))

(declare-fun readBitPure!0 (BitStream!7526) tuple2!15228)

(declare-fun readerFrom!0 (BitStream!7526 (_ BitVec 32) (_ BitVec 32)) BitStream!7526)

(assert (=> b!176868 (= lt!272064 (readBitPure!0 (readerFrom!0 (_2!8258 lt!272066) (currentBit!8818 thiss!1204) (currentByte!8823 thiss!1204))))))

(assert (= (and start!39354 res!146568) b!176863))

(assert (= (and b!176863 res!146561) b!176865))

(assert (= (and b!176865 res!146562) b!176862))

(assert (= (and b!176862 res!146565) b!176866))

(assert (= (and b!176866 res!146563) b!176867))

(assert (= (and b!176867 res!146566) b!176860))

(assert (= (and b!176860 res!146564) b!176868))

(assert (= (and b!176868 res!146567) b!176864))

(assert (= start!39354 b!176861))

(declare-fun m!276885 () Bool)

(assert (=> b!176866 m!276885))

(declare-fun m!276887 () Bool)

(assert (=> b!176866 m!276887))

(declare-fun m!276889 () Bool)

(assert (=> b!176866 m!276889))

(declare-fun m!276891 () Bool)

(assert (=> b!176864 m!276891))

(declare-fun m!276893 () Bool)

(assert (=> start!39354 m!276893))

(declare-fun m!276895 () Bool)

(assert (=> b!176868 m!276895))

(assert (=> b!176868 m!276895))

(declare-fun m!276897 () Bool)

(assert (=> b!176868 m!276897))

(declare-fun m!276899 () Bool)

(assert (=> b!176860 m!276899))

(declare-fun m!276901 () Bool)

(assert (=> b!176865 m!276901))

(assert (=> b!176867 m!276885))

(assert (=> b!176867 m!276887))

(declare-fun m!276903 () Bool)

(assert (=> b!176861 m!276903))

(declare-fun m!276905 () Bool)

(assert (=> b!176863 m!276905))

(push 1)

(assert (not b!176864))

(assert (not b!176868))

(assert (not b!176866))

(assert (not b!176865))

(assert (not start!39354))

(assert (not b!176863))

(assert (not b!176867))

(assert (not b!176860))

(assert (not b!176861))

(check-sat)

(pop 1)

