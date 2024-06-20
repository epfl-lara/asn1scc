; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27310 () Bool)

(assert start!27310)

(declare-fun b!140260 () Bool)

(declare-fun res!116935 () Bool)

(declare-fun e!93486 () Bool)

(assert (=> b!140260 (=> (not res!116935) (not e!93486))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6403 0))(
  ( (array!6404 (arr!3605 (Array (_ BitVec 32) (_ BitVec 8))) (size!2898 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5054 0))(
  ( (BitStream!5055 (buf!3319 array!6403) (currentByte!6161 (_ BitVec 32)) (currentBit!6156 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5054)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140260 (= res!116935 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2898 (buf!3319 thiss!1634))) ((_ sign_extend 32) (currentByte!6161 thiss!1634)) ((_ sign_extend 32) (currentBit!6156 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140261 () Bool)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!140261 (= e!93486 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!2898 (buf!3319 thiss!1634))) ((_ sign_extend 32) (currentByte!6161 thiss!1634)) ((_ sign_extend 32) (currentBit!6156 thiss!1634)))))))

(declare-fun b!140262 () Bool)

(declare-fun res!116936 () Bool)

(assert (=> b!140262 (=> (not res!116936) (not e!93486))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140262 (= res!116936 (invariant!0 (currentBit!6156 thiss!1634) (currentByte!6161 thiss!1634) (size!2898 (buf!3319 thiss!1634))))))

(declare-fun b!140263 () Bool)

(declare-fun res!116937 () Bool)

(assert (=> b!140263 (=> (not res!116937) (not e!93486))))

(assert (=> b!140263 (= res!116937 (bvslt from!447 to!404))))

(declare-fun res!116938 () Bool)

(assert (=> start!27310 (=> (not res!116938) (not e!93486))))

(declare-fun arr!237 () array!6403)

(assert (=> start!27310 (= res!116938 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2898 arr!237))))))

(assert (=> start!27310 e!93486))

(assert (=> start!27310 true))

(declare-fun array_inv!2687 (array!6403) Bool)

(assert (=> start!27310 (array_inv!2687 arr!237)))

(declare-fun e!93488 () Bool)

(declare-fun inv!12 (BitStream!5054) Bool)

(assert (=> start!27310 (and (inv!12 thiss!1634) e!93488)))

(declare-fun b!140264 () Bool)

(assert (=> b!140264 (= e!93488 (array_inv!2687 (buf!3319 thiss!1634)))))

(assert (= (and start!27310 res!116938) b!140260))

(assert (= (and b!140260 res!116935) b!140263))

(assert (= (and b!140263 res!116937) b!140262))

(assert (= (and b!140262 res!116936) b!140261))

(assert (= start!27310 b!140264))

(declare-fun m!216047 () Bool)

(assert (=> b!140260 m!216047))

(declare-fun m!216049 () Bool)

(assert (=> b!140262 m!216049))

(declare-fun m!216051 () Bool)

(assert (=> b!140264 m!216051))

(declare-fun m!216053 () Bool)

(assert (=> start!27310 m!216053))

(declare-fun m!216055 () Bool)

(assert (=> start!27310 m!216055))

(declare-fun m!216057 () Bool)

(assert (=> b!140261 m!216057))

(push 1)

(assert (not b!140262))

(assert (not b!140260))

(assert (not b!140261))

(assert (not start!27310))

(assert (not b!140264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45278 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45278 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2898 (buf!3319 thiss!1634))) ((_ sign_extend 32) (currentByte!6161 thiss!1634)) ((_ sign_extend 32) (currentBit!6156 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2898 (buf!3319 thiss!1634))) ((_ sign_extend 32) (currentByte!6161 thiss!1634)) ((_ sign_extend 32) (currentBit!6156 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11101 () Bool)

(assert (= bs!11101 d!45278))

(declare-fun m!216063 () Bool)

(assert (=> bs!11101 m!216063))

(assert (=> b!140260 d!45278))

(declare-fun d!45282 () Bool)

(assert (=> d!45282 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2898 (buf!3319 thiss!1634))) ((_ sign_extend 32) (currentByte!6161 thiss!1634)) ((_ sign_extend 32) (currentBit!6156 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2898 (buf!3319 thiss!1634))) ((_ sign_extend 32) (currentByte!6161 thiss!1634)) ((_ sign_extend 32) (currentBit!6156 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11103 () Bool)

(assert (= bs!11103 d!45282))

(assert (=> bs!11103 m!216063))

(assert (=> b!140261 d!45282))

(declare-fun d!45286 () Bool)

(assert (=> d!45286 (= (invariant!0 (currentBit!6156 thiss!1634) (currentByte!6161 thiss!1634) (size!2898 (buf!3319 thiss!1634))) (and (bvsge (currentBit!6156 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6156 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6161 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6161 thiss!1634) (size!2898 (buf!3319 thiss!1634))) (and (= (currentBit!6156 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6161 thiss!1634) (size!2898 (buf!3319 thiss!1634)))))))))

(assert (=> b!140262 d!45286))

(declare-fun d!45288 () Bool)

(assert (=> d!45288 (= (array_inv!2687 arr!237) (bvsge (size!2898 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27310 d!45288))

(declare-fun d!45290 () Bool)

(assert (=> d!45290 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6156 thiss!1634) (currentByte!6161 thiss!1634) (size!2898 (buf!3319 thiss!1634))))))

(declare-fun bs!11104 () Bool)

(assert (= bs!11104 d!45290))

(assert (=> bs!11104 m!216049))

(assert (=> start!27310 d!45290))

(declare-fun d!45292 () Bool)

(assert (=> d!45292 (= (array_inv!2687 (buf!3319 thiss!1634)) (bvsge (size!2898 (buf!3319 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!140264 d!45292))

(push 1)

(assert (not d!45278))

(assert (not d!45282))

(assert (not d!45290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

