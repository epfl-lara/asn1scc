; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49674 () Bool)

(assert start!49674)

(declare-fun res!195984 () Bool)

(declare-fun e!161982 () Bool)

(assert (=> start!49674 (=> (not res!195984) (not e!161982))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12270 0))(
  ( (array!12271 (arr!6378 (Array (_ BitVec 32) (_ BitVec 8))) (size!5391 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9746 0))(
  ( (BitStream!9747 (buf!5866 array!12270) (currentByte!10921 (_ BitVec 32)) (currentBit!10916 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9746)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!49674 (= res!195984 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5391 (buf!5866 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10921 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10916 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5391 (buf!5866 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10921 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10916 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49674 e!161982))

(assert (=> start!49674 true))

(declare-fun e!161984 () Bool)

(declare-fun inv!12 (BitStream!9746) Bool)

(assert (=> start!49674 (and (inv!12 bs!63) e!161984)))

(declare-fun b!234324 () Bool)

(declare-fun res!195983 () Bool)

(assert (=> b!234324 (=> (not res!195983) (not e!161982))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!234324 (= res!195983 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10916 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10921 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5391 (buf!5866 bs!63))))))))

(declare-fun b!234325 () Bool)

(assert (=> b!234325 (= e!161982 (bvslt ((_ sign_extend 32) (bvsub nBits!274 i!546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234326 () Bool)

(declare-fun array_inv!5132 (array!12270) Bool)

(assert (=> b!234326 (= e!161984 (array_inv!5132 (buf!5866 bs!63)))))

(assert (= (and start!49674 res!195984) b!234324))

(assert (= (and b!234324 res!195983) b!234325))

(assert (= start!49674 b!234326))

(declare-fun m!356965 () Bool)

(assert (=> start!49674 m!356965))

(declare-fun m!356967 () Bool)

(assert (=> b!234324 m!356967))

(declare-fun m!356969 () Bool)

(assert (=> b!234326 m!356969))

(push 1)

(assert (not b!234326))

(assert (not b!234324))

(assert (not start!49674))

(check-sat)

(pop 1)

(push 1)

(check-sat)

