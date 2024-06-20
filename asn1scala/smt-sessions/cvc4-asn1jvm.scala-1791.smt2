; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48838 () Bool)

(assert start!48838)

(declare-fun b!231054 () Bool)

(declare-fun e!158843 () Bool)

(declare-datatypes ((array!11828 0))(
  ( (array!11829 (arr!6168 (Array (_ BitVec 32) (_ BitVec 8))) (size!5181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9458 0))(
  ( (BitStream!9459 (buf!5722 array!11828) (currentByte!10723 (_ BitVec 32)) (currentBit!10718 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9458)

(declare-fun array_inv!4922 (array!11828) Bool)

(assert (=> b!231054 (= e!158843 (array_inv!4922 (buf!5722 b1!101)))))

(declare-fun b!231055 () Bool)

(declare-fun res!193580 () Bool)

(declare-fun e!158842 () Bool)

(assert (=> b!231055 (=> (not res!193580) (not e!158842))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!231055 (= res!193580 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231056 () Bool)

(declare-fun lt!368526 () (_ BitVec 64))

(declare-fun lt!368525 () (_ BitVec 64))

(assert (=> b!231056 (= e!158842 (and (= lt!368526 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!368526 (bvand (bvadd lt!368525 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231056 (= lt!368526 (bvand lt!368525 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231056 (= lt!368525 (bitIndex!0 (size!5181 (buf!5722 b1!101)) (currentByte!10723 b1!101) (currentBit!10718 b1!101)))))

(declare-fun b!231057 () Bool)

(declare-fun res!193578 () Bool)

(assert (=> b!231057 (=> (not res!193578) (not e!158842))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231057 (= res!193578 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5181 (buf!5722 b1!101))) ((_ sign_extend 32) (currentByte!10723 b1!101)) ((_ sign_extend 32) (currentBit!10718 b1!101)) bytes!19))))

(declare-fun b!231058 () Bool)

(declare-fun e!158839 () Bool)

(declare-fun b2!99 () BitStream!9458)

(assert (=> b!231058 (= e!158839 (array_inv!4922 (buf!5722 b2!99)))))

(declare-fun b!231059 () Bool)

(declare-fun res!193581 () Bool)

(assert (=> b!231059 (=> (not res!193581) (not e!158842))))

(assert (=> b!231059 (= res!193581 (bvsle bits!86 (bitIndex!0 (size!5181 (buf!5722 b2!99)) (currentByte!10723 b2!99) (currentBit!10718 b2!99))))))

(declare-fun res!193579 () Bool)

(assert (=> start!48838 (=> (not res!193579) (not e!158842))))

(assert (=> start!48838 (= res!193579 (and (= (size!5181 (buf!5722 b1!101)) (size!5181 (buf!5722 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48838 e!158842))

(declare-fun inv!12 (BitStream!9458) Bool)

(assert (=> start!48838 (and (inv!12 b1!101) e!158843)))

(assert (=> start!48838 (and (inv!12 b2!99) e!158839)))

(assert (=> start!48838 true))

(assert (= (and start!48838 res!193579) b!231059))

(assert (= (and b!231059 res!193581) b!231055))

(assert (= (and b!231055 res!193580) b!231057))

(assert (= (and b!231057 res!193578) b!231056))

(assert (= start!48838 b!231054))

(assert (= start!48838 b!231058))

(declare-fun m!354261 () Bool)

(assert (=> b!231057 m!354261))

(declare-fun m!354263 () Bool)

(assert (=> b!231059 m!354263))

(declare-fun m!354265 () Bool)

(assert (=> start!48838 m!354265))

(declare-fun m!354267 () Bool)

(assert (=> start!48838 m!354267))

(declare-fun m!354269 () Bool)

(assert (=> b!231056 m!354269))

(declare-fun m!354271 () Bool)

(assert (=> b!231058 m!354271))

(declare-fun m!354273 () Bool)

(assert (=> b!231054 m!354273))

(push 1)

(assert (not b!231054))

(assert (not b!231059))

(assert (not b!231057))

(assert (not b!231058))

(assert (not start!48838))

(assert (not b!231056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!78438 () Bool)

(assert (=> d!78438 (= (array_inv!4922 (buf!5722 b2!99)) (bvsge (size!5181 (buf!5722 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!231058 d!78438))

(declare-fun d!78440 () Bool)

(assert (=> d!78440 (= (array_inv!4922 (buf!5722 b1!101)) (bvsge (size!5181 (buf!5722 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!231054 d!78440))

(declare-fun d!78442 () Bool)

(declare-fun e!158854 () Bool)

(assert (=> d!78442 e!158854))

(declare-fun res!193603 () Bool)

(assert (=> d!78442 (=> (not res!193603) (not e!158854))))

(declare-fun lt!368588 () (_ BitVec 64))

(declare-fun lt!368590 () (_ BitVec 64))

(declare-fun lt!368587 () (_ BitVec 64))

(assert (=> d!78442 (= res!193603 (= lt!368587 (bvsub lt!368588 lt!368590)))))

(assert (=> d!78442 (or (= (bvand lt!368588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368588 lt!368590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!78442 (= lt!368590 (remainingBits!0 ((_ sign_extend 32) (size!5181 (buf!5722 b2!99))) ((_ sign_extend 32) (currentByte!10723 b2!99)) ((_ sign_extend 32) (currentBit!10718 b2!99))))))

(declare-fun lt!368589 () (_ BitVec 64))

(declare-fun lt!368591 () (_ BitVec 64))

(assert (=> d!78442 (= lt!368588 (bvmul lt!368589 lt!368591))))

(assert (=> d!78442 (or (= lt!368589 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368591 (bvsdiv (bvmul lt!368589 lt!368591) lt!368589)))))

(assert (=> d!78442 (= lt!368591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78442 (= lt!368589 ((_ sign_extend 32) (size!5181 (buf!5722 b2!99))))))

(assert (=> d!78442 (= lt!368587 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10723 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10718 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!78442 (invariant!0 (currentBit!10718 b2!99) (currentByte!10723 b2!99) (size!5181 (buf!5722 b2!99)))))

(assert (=> d!78442 (= (bitIndex!0 (size!5181 (buf!5722 b2!99)) (currentByte!10723 b2!99) (currentBit!10718 b2!99)) lt!368587)))

(declare-fun b!231080 () Bool)

(declare-fun res!193602 () Bool)

(assert (=> b!231080 (=> (not res!193602) (not e!158854))))

(assert (=> b!231080 (= res!193602 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368587))))

(declare-fun b!231081 () Bool)

(declare-fun lt!368592 () (_ BitVec 64))

(assert (=> b!231081 (= e!158854 (bvsle lt!368587 (bvmul lt!368592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!231081 (or (= lt!368592 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368592 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368592)))))

(assert (=> b!231081 (= lt!368592 ((_ sign_extend 32) (size!5181 (buf!5722 b2!99))))))

(assert (= (and d!78442 res!193603) b!231080))

(assert (= (and b!231080 res!193602) b!231081))

(declare-fun m!354291 () Bool)

(assert (=> d!78442 m!354291))

(declare-fun m!354293 () Bool)

(assert (=> d!78442 m!354293))

(assert (=> b!231059 d!78442))

(declare-fun d!78444 () Bool)

(declare-fun e!158855 () Bool)

(assert (=> d!78444 e!158855))

(declare-fun res!193605 () Bool)

(assert (=> d!78444 (=> (not res!193605) (not e!158855))))

(declare-fun lt!368593 () (_ BitVec 64))

(declare-fun lt!368594 () (_ BitVec 64))

(declare-fun lt!368596 () (_ BitVec 64))

(assert (=> d!78444 (= res!193605 (= lt!368593 (bvsub lt!368594 lt!368596)))))

(assert (=> d!78444 (or (= (bvand lt!368594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!368596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!368594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!368594 lt!368596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!78444 (= lt!368596 (remainingBits!0 ((_ sign_extend 32) (size!5181 (buf!5722 b1!101))) ((_ sign_extend 32) (currentByte!10723 b1!101)) ((_ sign_extend 32) (currentBit!10718 b1!101))))))

(declare-fun lt!368595 () (_ BitVec 64))

(declare-fun lt!368597 () (_ BitVec 64))

(assert (=> d!78444 (= lt!368594 (bvmul lt!368595 lt!368597))))

(assert (=> d!78444 (or (= lt!368595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!368597 (bvsdiv (bvmul lt!368595 lt!368597) lt!368595)))))

(assert (=> d!78444 (= lt!368597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!78444 (= lt!368595 ((_ sign_extend 32) (size!5181 (buf!5722 b1!101))))))

(assert (=> d!78444 (= lt!368593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10723 b1!101)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10718 b1!101))))))

(assert (=> d!78444 (invariant!0 (currentBit!10718 b1!101) (currentByte!10723 b1!101) (size!5181 (buf!5722 b1!101)))))

(assert (=> d!78444 (= (bitIndex!0 (size!5181 (buf!5722 b1!101)) (currentByte!10723 b1!101) (currentBit!10718 b1!101)) lt!368593)))

(declare-fun b!231082 () Bool)

(declare-fun res!193604 () Bool)

(assert (=> b!231082 (=> (not res!193604) (not e!158855))))

(assert (=> b!231082 (= res!193604 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!368593))))

(declare-fun b!231083 () Bool)

(declare-fun lt!368598 () (_ BitVec 64))

(assert (=> b!231083 (= e!158855 (bvsle lt!368593 (bvmul lt!368598 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!231083 (or (= lt!368598 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!368598 #b0000000000000000000000000000000000000000000000000000000000001000) lt!368598)))))

(assert (=> b!231083 (= lt!368598 ((_ sign_extend 32) (size!5181 (buf!5722 b1!101))))))

(assert (= (and d!78444 res!193605) b!231082))

(assert (= (and b!231082 res!193604) b!231083))

(declare-fun m!354295 () Bool)

(assert (=> d!78444 m!354295))

(declare-fun m!354297 () Bool)

(assert (=> d!78444 m!354297))

(assert (=> b!231056 d!78444))

(declare-fun d!78446 () Bool)

(assert (=> d!78446 (= (inv!12 b1!101) (invariant!0 (currentBit!10718 b1!101) (currentByte!10723 b1!101) (size!5181 (buf!5722 b1!101))))))

(declare-fun bs!19237 () Bool)

(assert (= bs!19237 d!78446))

(assert (=> bs!19237 m!354297))

(assert (=> start!48838 d!78446))

(declare-fun d!78448 () Bool)

(assert (=> d!78448 (= (inv!12 b2!99) (invariant!0 (currentBit!10718 b2!99) (currentByte!10723 b2!99) (size!5181 (buf!5722 b2!99))))))

(declare-fun bs!19238 () Bool)

(assert (= bs!19238 d!78448))

(assert (=> bs!19238 m!354293))

(assert (=> start!48838 d!78448))

(declare-fun d!78450 () Bool)

(assert (=> d!78450 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!5181 (buf!5722 b1!101))) ((_ sign_extend 32) (currentByte!10723 b1!101)) ((_ sign_extend 32) (currentBit!10718 b1!101)) bytes!19) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5181 (buf!5722 b1!101))) ((_ sign_extend 32) (currentByte!10723 b1!101)) ((_ sign_extend 32) (currentBit!10718 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!19239 () Bool)

(assert (= bs!19239 d!78450))

(assert (=> bs!19239 m!354295))

(assert (=> b!231057 d!78450))

(push 1)

(assert (not d!78448))

(assert (not d!78450))

(assert (not d!78444))

(assert (not d!78446))

(assert (not d!78442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

