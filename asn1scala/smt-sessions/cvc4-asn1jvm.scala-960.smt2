; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27090 () Bool)

(assert start!27090)

(declare-fun b!139396 () Bool)

(declare-fun res!116192 () Bool)

(declare-fun e!92865 () Bool)

(assert (=> b!139396 (=> (not res!116192) (not e!92865))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!139396 (= res!116192 (bvslt from!447 to!404))))

(declare-fun b!139397 () Bool)

(declare-datatypes ((array!6355 0))(
  ( (array!6356 (arr!3572 (Array (_ BitVec 32) (_ BitVec 8))) (size!2877 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5018 0))(
  ( (BitStream!5019 (buf!3293 array!6355) (currentByte!6123 (_ BitVec 32)) (currentBit!6118 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5018)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139397 (= e!92865 (not (invariant!0 (currentBit!6118 thiss!1634) (currentByte!6123 thiss!1634) (size!2877 (buf!3293 thiss!1634)))))))

(declare-fun res!116193 () Bool)

(assert (=> start!27090 (=> (not res!116193) (not e!92865))))

(declare-fun arr!237 () array!6355)

(assert (=> start!27090 (= res!116193 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2877 arr!237))))))

(assert (=> start!27090 e!92865))

(assert (=> start!27090 true))

(declare-fun array_inv!2666 (array!6355) Bool)

(assert (=> start!27090 (array_inv!2666 arr!237)))

(declare-fun e!92867 () Bool)

(declare-fun inv!12 (BitStream!5018) Bool)

(assert (=> start!27090 (and (inv!12 thiss!1634) e!92867)))

(declare-fun b!139395 () Bool)

(declare-fun res!116191 () Bool)

(assert (=> b!139395 (=> (not res!116191) (not e!92865))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139395 (= res!116191 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2877 (buf!3293 thiss!1634))) ((_ sign_extend 32) (currentByte!6123 thiss!1634)) ((_ sign_extend 32) (currentBit!6118 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139398 () Bool)

(assert (=> b!139398 (= e!92867 (array_inv!2666 (buf!3293 thiss!1634)))))

(assert (= (and start!27090 res!116193) b!139395))

(assert (= (and b!139395 res!116191) b!139396))

(assert (= (and b!139396 res!116192) b!139397))

(assert (= start!27090 b!139398))

(declare-fun m!214425 () Bool)

(assert (=> b!139397 m!214425))

(declare-fun m!214427 () Bool)

(assert (=> start!27090 m!214427))

(declare-fun m!214429 () Bool)

(assert (=> start!27090 m!214429))

(declare-fun m!214431 () Bool)

(assert (=> b!139395 m!214431))

(declare-fun m!214433 () Bool)

(assert (=> b!139398 m!214433))

(push 1)

(assert (not b!139395))

(assert (not b!139397))

(assert (not start!27090))

(assert (not b!139398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44781 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44781 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2877 (buf!3293 thiss!1634))) ((_ sign_extend 32) (currentByte!6123 thiss!1634)) ((_ sign_extend 32) (currentBit!6118 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2877 (buf!3293 thiss!1634))) ((_ sign_extend 32) (currentByte!6123 thiss!1634)) ((_ sign_extend 32) (currentBit!6118 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10973 () Bool)

(assert (= bs!10973 d!44781))

(declare-fun m!214437 () Bool)

(assert (=> bs!10973 m!214437))

(assert (=> b!139395 d!44781))

(declare-fun d!44789 () Bool)

(assert (=> d!44789 (= (invariant!0 (currentBit!6118 thiss!1634) (currentByte!6123 thiss!1634) (size!2877 (buf!3293 thiss!1634))) (and (bvsge (currentBit!6118 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6118 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6123 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6123 thiss!1634) (size!2877 (buf!3293 thiss!1634))) (and (= (currentBit!6118 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6123 thiss!1634) (size!2877 (buf!3293 thiss!1634)))))))))

(assert (=> b!139397 d!44789))

(declare-fun d!44797 () Bool)

(assert (=> d!44797 (= (array_inv!2666 arr!237) (bvsge (size!2877 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27090 d!44797))

(declare-fun d!44799 () Bool)

(assert (=> d!44799 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6118 thiss!1634) (currentByte!6123 thiss!1634) (size!2877 (buf!3293 thiss!1634))))))

(declare-fun bs!10976 () Bool)

(assert (= bs!10976 d!44799))

(assert (=> bs!10976 m!214425))

(assert (=> start!27090 d!44799))

(declare-fun d!44801 () Bool)

(assert (=> d!44801 (= (array_inv!2666 (buf!3293 thiss!1634)) (bvsge (size!2877 (buf!3293 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139398 d!44801))

(push 1)

