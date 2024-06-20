; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61728 () Bool)

(assert start!61728)

(declare-fun res!230062 () Bool)

(declare-fun e!196881 () Bool)

(assert (=> start!61728 (=> (not res!230062) (not e!196881))))

(declare-datatypes ((array!15855 0))(
  ( (array!15856 (arr!7859 (Array (_ BitVec 32) (_ BitVec 8))) (size!6863 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12540 0))(
  ( (BitStream!12541 (buf!7331 array!15855) (currentByte!13581 (_ BitVec 32)) (currentBit!13576 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12540)

(declare-fun b2!124 () BitStream!12540)

(assert (=> start!61728 (= res!230062 (= (size!6863 (buf!7331 thiss!872)) (size!6863 (buf!7331 b2!124))))))

(assert (=> start!61728 e!196881))

(declare-fun e!196880 () Bool)

(declare-fun inv!12 (BitStream!12540) Bool)

(assert (=> start!61728 (and (inv!12 thiss!872) e!196880)))

(declare-fun e!196879 () Bool)

(assert (=> start!61728 (and (inv!12 b2!124) e!196879)))

(declare-fun b!276955 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276955 (= e!196881 (not (invariant!0 (currentBit!13576 thiss!872) (currentByte!13581 thiss!872) (size!6863 (buf!7331 thiss!872)))))))

(declare-fun b!276956 () Bool)

(declare-fun array_inv!6587 (array!15855) Bool)

(assert (=> b!276956 (= e!196880 (array_inv!6587 (buf!7331 thiss!872)))))

(declare-fun b!276957 () Bool)

(assert (=> b!276957 (= e!196879 (array_inv!6587 (buf!7331 b2!124)))))

(assert (= (and start!61728 res!230062) b!276955))

(assert (= start!61728 b!276956))

(assert (= start!61728 b!276957))

(declare-fun m!410151 () Bool)

(assert (=> start!61728 m!410151))

(declare-fun m!410153 () Bool)

(assert (=> start!61728 m!410153))

(declare-fun m!410155 () Bool)

(assert (=> b!276955 m!410155))

(declare-fun m!410157 () Bool)

(assert (=> b!276956 m!410157))

(declare-fun m!410159 () Bool)

(assert (=> b!276957 m!410159))

(check-sat (not b!276955) (not b!276957) (not start!61728) (not b!276956))
(check-sat)
(get-model)

(declare-fun d!95520 () Bool)

(assert (=> d!95520 (= (invariant!0 (currentBit!13576 thiss!872) (currentByte!13581 thiss!872) (size!6863 (buf!7331 thiss!872))) (and (bvsge (currentBit!13576 thiss!872) #b00000000000000000000000000000000) (bvslt (currentBit!13576 thiss!872) #b00000000000000000000000000001000) (bvsge (currentByte!13581 thiss!872) #b00000000000000000000000000000000) (or (bvslt (currentByte!13581 thiss!872) (size!6863 (buf!7331 thiss!872))) (and (= (currentBit!13576 thiss!872) #b00000000000000000000000000000000) (= (currentByte!13581 thiss!872) (size!6863 (buf!7331 thiss!872)))))))))

(assert (=> b!276955 d!95520))

(declare-fun d!95526 () Bool)

(assert (=> d!95526 (= (array_inv!6587 (buf!7331 b2!124)) (bvsge (size!6863 (buf!7331 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!276957 d!95526))

(declare-fun d!95528 () Bool)

(assert (=> d!95528 (= (inv!12 thiss!872) (invariant!0 (currentBit!13576 thiss!872) (currentByte!13581 thiss!872) (size!6863 (buf!7331 thiss!872))))))

(declare-fun bs!24089 () Bool)

(assert (= bs!24089 d!95528))

(assert (=> bs!24089 m!410155))

(assert (=> start!61728 d!95528))

(declare-fun d!95530 () Bool)

(assert (=> d!95530 (= (inv!12 b2!124) (invariant!0 (currentBit!13576 b2!124) (currentByte!13581 b2!124) (size!6863 (buf!7331 b2!124))))))

(declare-fun bs!24090 () Bool)

(assert (= bs!24090 d!95530))

(declare-fun m!410173 () Bool)

(assert (=> bs!24090 m!410173))

(assert (=> start!61728 d!95530))

(declare-fun d!95534 () Bool)

(assert (=> d!95534 (= (array_inv!6587 (buf!7331 thiss!872)) (bvsge (size!6863 (buf!7331 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!276956 d!95534))

(check-sat (not d!95530) (not d!95528))
