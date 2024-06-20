; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72474 () Bool)

(assert start!72474)

(declare-fun res!266061 () Bool)

(declare-fun e!233590 () Bool)

(assert (=> start!72474 (=> (not res!266061) (not e!233590))))

(declare-datatypes ((array!20771 0))(
  ( (array!20772 (arr!10128 (Array (_ BitVec 32) (_ BitVec 8))) (size!9036 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14234 0))(
  ( (BitStream!14235 (buf!8178 array!20771) (currentByte!15094 (_ BitVec 32)) (currentBit!15089 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14234)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72474 (= res!266061 (validate_offset_bit!0 ((_ sign_extend 32) (size!9036 (buf!8178 thiss!1702))) ((_ sign_extend 32) (currentByte!15094 thiss!1702)) ((_ sign_extend 32) (currentBit!15089 thiss!1702))))))

(assert (=> start!72474 e!233590))

(declare-fun e!233592 () Bool)

(declare-fun inv!12 (BitStream!14234) Bool)

(assert (=> start!72474 (and (inv!12 thiss!1702) e!233592)))

(declare-fun b!324149 () Bool)

(declare-fun res!266062 () Bool)

(assert (=> b!324149 (=> (not res!266062) (not e!233590))))

(declare-datatypes ((Unit!22072 0))(
  ( (Unit!22073) )
))
(declare-datatypes ((tuple2!23754 0))(
  ( (tuple2!23755 (_1!13506 Unit!22072) (_2!13506 BitStream!14234)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14234) tuple2!23754)

(assert (=> b!324149 (= res!266062 (= (buf!8178 (_2!13506 (increaseBitIndex!0 thiss!1702))) (buf!8178 thiss!1702)))))

(declare-fun b!324150 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324150 (= e!233590 (not (invariant!0 (currentBit!15089 thiss!1702) (currentByte!15094 thiss!1702) (size!9036 (buf!8178 thiss!1702)))))))

(declare-fun b!324151 () Bool)

(declare-fun array_inv!8588 (array!20771) Bool)

(assert (=> b!324151 (= e!233592 (array_inv!8588 (buf!8178 thiss!1702)))))

(assert (= (and start!72474 res!266061) b!324149))

(assert (= (and b!324149 res!266062) b!324150))

(assert (= start!72474 b!324151))

(declare-fun m!462235 () Bool)

(assert (=> start!72474 m!462235))

(declare-fun m!462237 () Bool)

(assert (=> start!72474 m!462237))

(declare-fun m!462239 () Bool)

(assert (=> b!324149 m!462239))

(declare-fun m!462241 () Bool)

(assert (=> b!324150 m!462241))

(declare-fun m!462243 () Bool)

(assert (=> b!324151 m!462243))

(push 1)

(assert (not b!324150))

(assert (not b!324149))

(assert (not b!324151))

(assert (not start!72474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106418 () Bool)

(assert (=> d!106418 (= (invariant!0 (currentBit!15089 thiss!1702) (currentByte!15094 thiss!1702) (size!9036 (buf!8178 thiss!1702))) (and (bvsge (currentBit!15089 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15089 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15094 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15094 thiss!1702) (size!9036 (buf!8178 thiss!1702))) (and (= (currentBit!15089 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15094 thiss!1702) (size!9036 (buf!8178 thiss!1702)))))))))

(assert (=> b!324150 d!106418))

(declare-fun d!106424 () Bool)

(declare-fun e!233595 () Bool)

(assert (=> d!106424 e!233595))

(declare-fun res!266068 () Bool)

(assert (=> d!106424 (=> (not res!266068) (not e!233595))))

(declare-fun lt!446689 () tuple2!23754)

(declare-fun lt!446693 () (_ BitVec 64))

(declare-fun lt!446690 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!106424 (= res!266068 (= (bvadd lt!446693 lt!446690) (bitIndex!0 (size!9036 (buf!8178 (_2!13506 lt!446689))) (currentByte!15094 (_2!13506 lt!446689)) (currentBit!15089 (_2!13506 lt!446689)))))))

(assert (=> d!106424 (or (not (= (bvand lt!446693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446690 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446693 lt!446690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106424 (= lt!446690 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106424 (= lt!446693 (bitIndex!0 (size!9036 (buf!8178 thiss!1702)) (currentByte!15094 thiss!1702) (currentBit!15089 thiss!1702)))))

(declare-fun Unit!22074 () Unit!22072)

(declare-fun Unit!22075 () Unit!22072)

(assert (=> d!106424 (= lt!446689 (ite (bvslt (currentBit!15089 thiss!1702) #b00000000000000000000000000000111) (tuple2!23755 Unit!22074 (BitStream!14235 (buf!8178 thiss!1702) (currentByte!15094 thiss!1702) (bvadd (currentBit!15089 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23755 Unit!22075 (BitStream!14235 (buf!8178 thiss!1702) (bvadd (currentByte!15094 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106424 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9036 (buf!8178 thiss!1702))) ((_ sign_extend 32) (currentByte!15094 thiss!1702)) ((_ sign_extend 32) (currentBit!15089 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106424 (= (increaseBitIndex!0 thiss!1702) lt!446689)))

(declare-fun b!324156 () Bool)

(declare-fun res!266067 () Bool)

(assert (=> b!324156 (=> (not res!266067) (not e!233595))))

(declare-fun lt!446692 () (_ BitVec 64))

(declare-fun lt!446691 () (_ BitVec 64))

(assert (=> b!324156 (= res!266067 (= (bvsub lt!446692 lt!446691) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324156 (or (= (bvand lt!446692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446691 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446692 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446692 lt!446691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324156 (= lt!446691 (remainingBits!0 ((_ sign_extend 32) (size!9036 (buf!8178 (_2!13506 lt!446689)))) ((_ sign_extend 32) (currentByte!15094 (_2!13506 lt!446689))) ((_ sign_extend 32) (currentBit!15089 (_2!13506 lt!446689)))))))

(assert (=> b!324156 (= lt!446692 (remainingBits!0 ((_ sign_extend 32) (size!9036 (buf!8178 thiss!1702))) ((_ sign_extend 32) (currentByte!15094 thiss!1702)) ((_ sign_extend 32) (currentBit!15089 thiss!1702))))))

(declare-fun b!324157 () Bool)

(assert (=> b!324157 (= e!233595 (= (size!9036 (buf!8178 thiss!1702)) (size!9036 (buf!8178 (_2!13506 lt!446689)))))))

(assert (= (and d!106424 res!266068) b!324156))

(assert (= (and b!324156 res!266067) b!324157))

(declare-fun m!462249 () Bool)

(assert (=> d!106424 m!462249))

(declare-fun m!462251 () Bool)

(assert (=> d!106424 m!462251))

(declare-fun m!462253 () Bool)

(assert (=> d!106424 m!462253))

(declare-fun m!462255 () Bool)

(assert (=> b!324156 m!462255))

(assert (=> b!324156 m!462253))

(assert (=> b!324149 d!106424))

(declare-fun d!106438 () Bool)

(assert (=> d!106438 (= (array_inv!8588 (buf!8178 thiss!1702)) (bvsge (size!9036 (buf!8178 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324151 d!106438))

(declare-fun d!106440 () Bool)

(assert (=> d!106440 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9036 (buf!8178 thiss!1702))) ((_ sign_extend 32) (currentByte!15094 thiss!1702)) ((_ sign_extend 32) (currentBit!15089 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9036 (buf!8178 thiss!1702))) ((_ sign_extend 32) (currentByte!15094 thiss!1702)) ((_ sign_extend 32) (currentBit!15089 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28034 () Bool)

(assert (= bs!28034 d!106440))

(assert (=> bs!28034 m!462253))

(assert (=> start!72474 d!106440))

(declare-fun d!106442 () Bool)

(assert (=> d!106442 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15089 thiss!1702) (currentByte!15094 thiss!1702) (size!9036 (buf!8178 thiss!1702))))))

(declare-fun bs!28035 () Bool)

(assert (= bs!28035 d!106442))

(assert (=> bs!28035 m!462241))

(assert (=> start!72474 d!106442))

(push 1)

(assert (not b!324156))

(assert (not d!106440))

(assert (not d!106424))

(assert (not d!106442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

