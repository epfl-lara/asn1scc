; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73558 () Bool)

(assert start!73558)

(declare-fun res!267324 () Bool)

(declare-fun e!234921 () Bool)

(assert (=> start!73558 (=> (not res!267324) (not e!234921))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(assert (=> start!73558 (= res!267324 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73558 e!234921))

(assert (=> start!73558 true))

(declare-fun b!325728 () Bool)

(declare-fun res!267325 () Bool)

(assert (=> b!325728 (=> (not res!267325) (not e!234921))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325728 (= res!267325 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun b!325729 () Bool)

(assert (=> b!325729 (= e!234921 (and (not (= currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentByte!20)))))))

(assert (= (and start!73558 res!267324) b!325728))

(assert (= (and b!325728 res!267325) b!325729))

(declare-fun m!463657 () Bool)

(assert (=> b!325728 m!463657))

(push 1)

(assert (not b!325728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

