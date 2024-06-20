; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41560 () Bool)

(assert start!41560)

(declare-fun res!163358 () Bool)

(declare-fun e!134277 () Bool)

(assert (=> start!41560 (=> (not res!163358) (not e!134277))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41560 (= res!163358 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41560 e!134277))

(assert (=> start!41560 true))

(declare-datatypes ((array!10018 0))(
  ( (array!10019 (arr!5348 (Array (_ BitVec 32) (_ BitVec 8))) (size!4418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7944 0))(
  ( (BitStream!7945 (buf!4904 array!10018) (currentByte!9200 (_ BitVec 32)) (currentBit!9195 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7944)

(declare-fun e!134278 () Bool)

(declare-fun inv!12 (BitStream!7944) Bool)

(assert (=> start!41560 (and (inv!12 thiss!1204) e!134278)))

(declare-fun b!195291 () Bool)

(declare-fun res!163359 () Bool)

(assert (=> b!195291 (=> (not res!163359) (not e!134277))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195291 (= res!163359 (validate_offset_bits!1 ((_ sign_extend 32) (size!4418 (buf!4904 thiss!1204))) ((_ sign_extend 32) (currentByte!9200 thiss!1204)) ((_ sign_extend 32) (currentBit!9195 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195292 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195292 (= e!134277 (not (invariant!0 (currentBit!9195 thiss!1204) (currentByte!9200 thiss!1204) (size!4418 (buf!4904 thiss!1204)))))))

(declare-fun b!195293 () Bool)

(declare-fun array_inv!4159 (array!10018) Bool)

(assert (=> b!195293 (= e!134278 (array_inv!4159 (buf!4904 thiss!1204)))))

(assert (= (and start!41560 res!163358) b!195291))

(assert (= (and b!195291 res!163359) b!195292))

(assert (= start!41560 b!195293))

(declare-fun m!302533 () Bool)

(assert (=> start!41560 m!302533))

(declare-fun m!302535 () Bool)

(assert (=> b!195291 m!302535))

(declare-fun m!302537 () Bool)

(assert (=> b!195292 m!302537))

(declare-fun m!302539 () Bool)

(assert (=> b!195293 m!302539))

(check-sat (not start!41560) (not b!195292) (not b!195293) (not b!195291))
(check-sat)
(get-model)

(declare-fun d!66223 () Bool)

(assert (=> d!66223 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9195 thiss!1204) (currentByte!9200 thiss!1204) (size!4418 (buf!4904 thiss!1204))))))

(declare-fun bs!16460 () Bool)

(assert (= bs!16460 d!66223))

(assert (=> bs!16460 m!302537))

(assert (=> start!41560 d!66223))

(declare-fun d!66227 () Bool)

(assert (=> d!66227 (= (invariant!0 (currentBit!9195 thiss!1204) (currentByte!9200 thiss!1204) (size!4418 (buf!4904 thiss!1204))) (and (bvsge (currentBit!9195 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9195 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9200 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9200 thiss!1204) (size!4418 (buf!4904 thiss!1204))) (and (= (currentBit!9195 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9200 thiss!1204) (size!4418 (buf!4904 thiss!1204)))))))))

(assert (=> b!195292 d!66227))

(declare-fun d!66233 () Bool)

(assert (=> d!66233 (= (array_inv!4159 (buf!4904 thiss!1204)) (bvsge (size!4418 (buf!4904 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!195293 d!66233))

(declare-fun d!66237 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66237 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4418 (buf!4904 thiss!1204))) ((_ sign_extend 32) (currentByte!9200 thiss!1204)) ((_ sign_extend 32) (currentBit!9195 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4418 (buf!4904 thiss!1204))) ((_ sign_extend 32) (currentByte!9200 thiss!1204)) ((_ sign_extend 32) (currentBit!9195 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16461 () Bool)

(assert (= bs!16461 d!66237))

