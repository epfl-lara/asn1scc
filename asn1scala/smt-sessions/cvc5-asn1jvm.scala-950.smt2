; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26938 () Bool)

(assert start!26938)

(declare-fun b!138822 () Bool)

(declare-fun res!115734 () Bool)

(declare-fun e!92346 () Bool)

(assert (=> b!138822 (=> (not res!115734) (not e!92346))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6285 0))(
  ( (array!6286 (arr!3540 (Array (_ BitVec 32) (_ BitVec 8))) (size!2845 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4954 0))(
  ( (BitStream!4955 (buf!3258 array!6285) (currentByte!6077 (_ BitVec 32)) (currentBit!6072 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4954)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138822 (= res!115734 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2845 (buf!3258 thiss!1634))) ((_ sign_extend 32) (currentByte!6077 thiss!1634)) ((_ sign_extend 32) (currentBit!6072 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!115733 () Bool)

(assert (=> start!26938 (=> (not res!115733) (not e!92346))))

(declare-fun arr!237 () array!6285)

(assert (=> start!26938 (= res!115733 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2845 arr!237))))))

(assert (=> start!26938 e!92346))

(assert (=> start!26938 true))

(declare-fun array_inv!2634 (array!6285) Bool)

(assert (=> start!26938 (array_inv!2634 arr!237)))

(declare-fun e!92349 () Bool)

(declare-fun inv!12 (BitStream!4954) Bool)

(assert (=> start!26938 (and (inv!12 thiss!1634) e!92349)))

(declare-fun b!138824 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138824 (= e!92346 (not (invariant!0 (currentBit!6072 thiss!1634) (currentByte!6077 thiss!1634) (size!2845 (buf!3258 thiss!1634)))))))

(declare-fun isPrefixOf!0 (BitStream!4954 BitStream!4954) Bool)

(assert (=> b!138824 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8646 0))(
  ( (Unit!8647) )
))
(declare-fun lt!216669 () Unit!8646)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4954) Unit!8646)

(assert (=> b!138824 (= lt!216669 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!138825 () Bool)

(assert (=> b!138825 (= e!92349 (array_inv!2634 (buf!3258 thiss!1634)))))

(declare-fun b!138823 () Bool)

(declare-fun res!115732 () Bool)

(assert (=> b!138823 (=> (not res!115732) (not e!92346))))

(assert (=> b!138823 (= res!115732 (bvsge from!447 to!404))))

(assert (= (and start!26938 res!115733) b!138822))

(assert (= (and b!138822 res!115734) b!138823))

(assert (= (and b!138823 res!115732) b!138824))

(assert (= start!26938 b!138825))

(declare-fun m!213737 () Bool)

(assert (=> b!138822 m!213737))

(declare-fun m!213739 () Bool)

(assert (=> start!26938 m!213739))

(declare-fun m!213741 () Bool)

(assert (=> start!26938 m!213741))

(declare-fun m!213743 () Bool)

(assert (=> b!138824 m!213743))

(declare-fun m!213745 () Bool)

(assert (=> b!138824 m!213745))

(declare-fun m!213747 () Bool)

(assert (=> b!138824 m!213747))

(declare-fun m!213749 () Bool)

(assert (=> b!138825 m!213749))

(push 1)

(assert (not start!26938))

(assert (not b!138825))

(assert (not b!138824))

(assert (not b!138822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44647 () Bool)

(assert (=> d!44647 (= (array_inv!2634 arr!237) (bvsge (size!2845 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26938 d!44647))

(declare-fun d!44651 () Bool)

(assert (=> d!44651 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6072 thiss!1634) (currentByte!6077 thiss!1634) (size!2845 (buf!3258 thiss!1634))))))

(declare-fun bs!10910 () Bool)

(assert (= bs!10910 d!44651))

(assert (=> bs!10910 m!213743))

(assert (=> start!26938 d!44651))

(declare-fun d!44655 () Bool)

(assert (=> d!44655 (= (array_inv!2634 (buf!3258 thiss!1634)) (bvsge (size!2845 (buf!3258 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!138825 d!44655))

(declare-fun d!44657 () Bool)

(assert (=> d!44657 (= (invariant!0 (currentBit!6072 thiss!1634) (currentByte!6077 thiss!1634) (size!2845 (buf!3258 thiss!1634))) (and (bvsge (currentBit!6072 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6072 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6077 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6077 thiss!1634) (size!2845 (buf!3258 thiss!1634))) (and (= (currentBit!6072 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6077 thiss!1634) (size!2845 (buf!3258 thiss!1634)))))))))

(assert (=> b!138824 d!44657))

(declare-fun d!44663 () Bool)

(declare-fun res!115766 () Bool)

(declare-fun e!92382 () Bool)

(assert (=> d!44663 (=> (not res!115766) (not e!92382))))

(assert (=> d!44663 (= res!115766 (= (size!2845 (buf!3258 thiss!1634)) (size!2845 (buf!3258 thiss!1634))))))

(assert (=> d!44663 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92382)))

(declare-fun b!138863 () Bool)

(declare-fun res!115770 () Bool)

(assert (=> b!138863 (=> (not res!115770) (not e!92382))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138863 (= res!115770 (bvsle (bitIndex!0 (size!2845 (buf!3258 thiss!1634)) (currentByte!6077 thiss!1634) (currentBit!6072 thiss!1634)) (bitIndex!0 (size!2845 (buf!3258 thiss!1634)) (currentByte!6077 thiss!1634) (currentBit!6072 thiss!1634))))))

(declare-fun b!138865 () Bool)

(declare-fun e!92385 () Bool)

(assert (=> b!138865 (= e!92382 e!92385)))

(declare-fun res!115768 () Bool)

(assert (=> b!138865 (=> res!115768 e!92385)))

(assert (=> b!138865 (= res!115768 (= (size!2845 (buf!3258 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138867 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6285 array!6285 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138867 (= e!92385 (arrayBitRangesEq!0 (buf!3258 thiss!1634) (buf!3258 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2845 (buf!3258 thiss!1634)) (currentByte!6077 thiss!1634) (currentBit!6072 thiss!1634))))))

(assert (= (and d!44663 res!115766) b!138863))

(assert (= (and b!138863 res!115770) b!138865))

(assert (= (and b!138865 (not res!115768)) b!138867))

(declare-fun m!213780 () Bool)

(assert (=> b!138863 m!213780))

(assert (=> b!138863 m!213780))

(assert (=> b!138867 m!213780))

(assert (=> b!138867 m!213780))

(declare-fun m!213785 () Bool)

(assert (=> b!138867 m!213785))

(assert (=> b!138824 d!44663))

(declare-fun d!44673 () Bool)

(assert (=> d!44673 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216681 () Unit!8646)

(declare-fun choose!11 (BitStream!4954) Unit!8646)

(assert (=> d!44673 (= lt!216681 (choose!11 thiss!1634))))

(assert (=> d!44673 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!216681)))

(declare-fun bs!10916 () Bool)

(assert (= bs!10916 d!44673))

(assert (=> bs!10916 m!213745))

(declare-fun m!213788 () Bool)

(assert (=> bs!10916 m!213788))

(assert (=> b!138824 d!44673))

(declare-fun d!44679 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44679 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2845 (buf!3258 thiss!1634))) ((_ sign_extend 32) (currentByte!6077 thiss!1634)) ((_ sign_extend 32) (currentBit!6072 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2845 (buf!3258 thiss!1634))) ((_ sign_extend 32) (currentByte!6077 thiss!1634)) ((_ sign_extend 32) (currentBit!6072 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10918 () Bool)

(assert (= bs!10918 d!44679))

(declare-fun m!213793 () Bool)

(assert (=> bs!10918 m!213793))

(assert (=> b!138822 d!44679))

(push 1)

(assert (not b!138867))

(assert (not d!44651))

(assert (not d!44679))

(assert (not b!138863))

(assert (not d!44673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

