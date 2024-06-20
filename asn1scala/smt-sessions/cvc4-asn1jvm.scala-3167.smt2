; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72764 () Bool)

(assert start!72764)

(declare-fun b!324497 () Bool)

(declare-fun res!266309 () Bool)

(declare-fun e!233928 () Bool)

(assert (=> b!324497 (=> (not res!266309) (not e!233928))))

(declare-datatypes ((array!20862 0))(
  ( (array!20863 (arr!10161 (Array (_ BitVec 32) (_ BitVec 8))) (size!9069 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14300 0))(
  ( (BitStream!14301 (buf!8211 array!20862) (currentByte!15178 (_ BitVec 32)) (currentBit!15173 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14300)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324497 (= res!266309 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9069 (buf!8211 thiss!877)) (currentByte!15178 thiss!877) (currentBit!15173 thiss!877))) (bitIndex!0 (size!9069 (buf!8211 thiss!877)) (currentByte!15178 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)))))))

(declare-fun b!324499 () Bool)

(declare-fun e!233927 () Bool)

(declare-fun array_inv!8621 (array!20862) Bool)

(assert (=> b!324499 (= e!233927 (array_inv!8621 (buf!8211 thiss!877)))))

(declare-fun res!266311 () Bool)

(assert (=> start!72764 (=> (not res!266311) (not e!233928))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72764 (= res!266311 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) ((_ sign_extend 32) (currentByte!15178 thiss!877)) ((_ sign_extend 32) (currentBit!15173 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72764 e!233928))

(declare-fun inv!12 (BitStream!14300) Bool)

(assert (=> start!72764 (and (inv!12 thiss!877) e!233927)))

(declare-fun b!324496 () Bool)

(declare-fun res!266310 () Bool)

(assert (=> b!324496 (=> (not res!266310) (not e!233928))))

(assert (=> b!324496 (= res!266310 (bvslt (currentBit!15173 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324498 () Bool)

(assert (=> b!324498 (= e!233928 (and (bvsle ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15178 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15173 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15178 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15173 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!72764 res!266311) b!324496))

(assert (= (and b!324496 res!266310) b!324497))

(assert (= (and b!324497 res!266309) b!324498))

(assert (= start!72764 b!324499))

(declare-fun m!462609 () Bool)

(assert (=> b!324497 m!462609))

(declare-fun m!462611 () Bool)

(assert (=> b!324497 m!462611))

(declare-fun m!462613 () Bool)

(assert (=> b!324499 m!462613))

(declare-fun m!462615 () Bool)

(assert (=> start!72764 m!462615))

(declare-fun m!462617 () Bool)

(assert (=> start!72764 m!462617))

(push 1)

(assert (not b!324497))

(assert (not start!72764))

(assert (not b!324499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106692 () Bool)

(declare-fun e!233935 () Bool)

(assert (=> d!106692 e!233935))

(declare-fun res!266325 () Bool)

(assert (=> d!106692 (=> (not res!266325) (not e!233935))))

(declare-fun lt!447004 () (_ BitVec 64))

(declare-fun lt!447006 () (_ BitVec 64))

(declare-fun lt!447007 () (_ BitVec 64))

(assert (=> d!106692 (= res!266325 (= lt!447006 (bvsub lt!447004 lt!447007)))))

(assert (=> d!106692 (or (= (bvand lt!447004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447004 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447004 lt!447007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106692 (= lt!447007 (remainingBits!0 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) ((_ sign_extend 32) (currentByte!15178 thiss!877)) ((_ sign_extend 32) (currentBit!15173 thiss!877))))))

(declare-fun lt!447008 () (_ BitVec 64))

(declare-fun lt!447005 () (_ BitVec 64))

(assert (=> d!106692 (= lt!447004 (bvmul lt!447008 lt!447005))))

(assert (=> d!106692 (or (= lt!447008 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447005 (bvsdiv (bvmul lt!447008 lt!447005) lt!447008)))))

(assert (=> d!106692 (= lt!447005 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106692 (= lt!447008 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))))))

(assert (=> d!106692 (= lt!447006 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15178 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15173 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106692 (invariant!0 (currentBit!15173 thiss!877) (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877)))))

(assert (=> d!106692 (= (bitIndex!0 (size!9069 (buf!8211 thiss!877)) (currentByte!15178 thiss!877) (currentBit!15173 thiss!877)) lt!447006)))

(declare-fun b!324512 () Bool)

(declare-fun res!266324 () Bool)

(assert (=> b!324512 (=> (not res!266324) (not e!233935))))

(assert (=> b!324512 (= res!266324 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447006))))

(declare-fun b!324513 () Bool)

(declare-fun lt!447003 () (_ BitVec 64))

(assert (=> b!324513 (= e!233935 (bvsle lt!447006 (bvmul lt!447003 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324513 (or (= lt!447003 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447003 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447003)))))

(assert (=> b!324513 (= lt!447003 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))))))

(assert (= (and d!106692 res!266325) b!324512))

(assert (= (and b!324512 res!266324) b!324513))

(assert (=> d!106692 m!462615))

(declare-fun m!462627 () Bool)

(assert (=> d!106692 m!462627))

(assert (=> b!324497 d!106692))

(declare-fun d!106696 () Bool)

(declare-fun e!233936 () Bool)

(assert (=> d!106696 e!233936))

(declare-fun res!266327 () Bool)

(assert (=> d!106696 (=> (not res!266327) (not e!233936))))

(declare-fun lt!447013 () (_ BitVec 64))

(declare-fun lt!447012 () (_ BitVec 64))

(declare-fun lt!447010 () (_ BitVec 64))

(assert (=> d!106696 (= res!266327 (= lt!447012 (bvsub lt!447010 lt!447013)))))

(assert (=> d!106696 (or (= (bvand lt!447010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447010 lt!447013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106696 (= lt!447013 (remainingBits!0 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) ((_ sign_extend 32) (currentByte!15178 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)))))))

(declare-fun lt!447014 () (_ BitVec 64))

(declare-fun lt!447011 () (_ BitVec 64))

(assert (=> d!106696 (= lt!447010 (bvmul lt!447014 lt!447011))))

(assert (=> d!106696 (or (= lt!447014 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447011 (bvsdiv (bvmul lt!447014 lt!447011) lt!447014)))))

(assert (=> d!106696 (= lt!447011 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106696 (= lt!447014 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))))))

(assert (=> d!106696 (= lt!447012 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15178 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)))))))

(assert (=> d!106696 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)) (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877)))))

(assert (=> d!106696 (= (bitIndex!0 (size!9069 (buf!8211 thiss!877)) (currentByte!15178 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877))) lt!447012)))

(declare-fun b!324514 () Bool)

(declare-fun res!266326 () Bool)

(assert (=> b!324514 (=> (not res!266326) (not e!233936))))

(assert (=> b!324514 (= res!266326 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447012))))

(declare-fun b!324515 () Bool)

(declare-fun lt!447009 () (_ BitVec 64))

(assert (=> b!324515 (= e!233936 (bvsle lt!447012 (bvmul lt!447009 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324515 (or (= lt!447009 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447009 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447009)))))

(assert (=> b!324515 (= lt!447009 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))))))

(assert (= (and d!106696 res!266327) b!324514))

(assert (= (and b!324514 res!266326) b!324515))

(declare-fun m!462629 () Bool)

(assert (=> d!106696 m!462629))

(declare-fun m!462631 () Bool)

(assert (=> d!106696 m!462631))

(assert (=> b!324497 d!106696))

(declare-fun d!106698 () Bool)

(assert (=> d!106698 (= (remainingBits!0 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) ((_ sign_extend 32) (currentByte!15178 thiss!877)) ((_ sign_extend 32) (currentBit!15173 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15178 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15173 thiss!877)))))))

(assert (=> start!72764 d!106698))

(declare-fun d!106700 () Bool)

(assert (=> d!106700 (= (inv!12 thiss!877) (invariant!0 (currentBit!15173 thiss!877) (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877))))))

(declare-fun bs!28105 () Bool)

(assert (= bs!28105 d!106700))

(assert (=> bs!28105 m!462627))

(assert (=> start!72764 d!106700))

(declare-fun d!106702 () Bool)

(assert (=> d!106702 (= (array_inv!8621 (buf!8211 thiss!877)) (bvsge (size!9069 (buf!8211 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324499 d!106702))

(push 1)

(assert (not d!106700))

(assert (not d!106692))

(assert (not d!106696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106706 () Bool)

(assert (=> d!106706 (= (invariant!0 (currentBit!15173 thiss!877) (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877))) (and (bvsge (currentBit!15173 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15173 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15178 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877))) (and (= (currentBit!15173 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877)))))))))

(assert (=> d!106700 d!106706))

(assert (=> d!106692 d!106698))

(assert (=> d!106692 d!106706))

(declare-fun d!106708 () Bool)

(assert (=> d!106708 (= (remainingBits!0 ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) ((_ sign_extend 32) (currentByte!15178 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)))) (bvsub (bvmul ((_ sign_extend 32) (size!9069 (buf!8211 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15178 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877))))))))

(assert (=> d!106696 d!106708))

(declare-fun d!106710 () Bool)

(assert (=> d!106710 (= (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)) (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877))) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)) #b00000000000000000000000000001000) (bvsge (currentByte!15178 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877))) (and (= (bvadd #b00000000000000000000000000000001 (currentBit!15173 thiss!877)) #b00000000000000000000000000000000) (= (currentByte!15178 thiss!877) (size!9069 (buf!8211 thiss!877)))))))))

(assert (=> d!106696 d!106710))

(push 1)

(check-sat)

(pop 1)

