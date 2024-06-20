; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26900 () Bool)

(assert start!26900)

(declare-fun b!138786 () Bool)

(declare-fun e!92319 () Bool)

(declare-datatypes ((array!6280 0))(
  ( (array!6281 (arr!3539 (Array (_ BitVec 32) (_ BitVec 8))) (size!2844 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4952 0))(
  ( (BitStream!4953 (buf!3257 array!6280) (currentByte!6070 (_ BitVec 32)) (currentBit!6065 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4952)

(declare-fun array_inv!2633 (array!6280) Bool)

(assert (=> b!138786 (= e!92319 (array_inv!2633 (buf!3257 thiss!1634)))))

(declare-fun b!138784 () Bool)

(declare-fun res!115697 () Bool)

(declare-fun e!92318 () Bool)

(assert (=> b!138784 (=> (not res!115697) (not e!92318))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!138784 (= res!115697 (bvsge from!447 to!404))))

(declare-fun b!138783 () Bool)

(declare-fun res!115696 () Bool)

(assert (=> b!138783 (=> (not res!115696) (not e!92318))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138783 (= res!115696 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2844 (buf!3257 thiss!1634))) ((_ sign_extend 32) (currentByte!6070 thiss!1634)) ((_ sign_extend 32) (currentBit!6065 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138785 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138785 (= e!92318 (not (invariant!0 (currentBit!6065 thiss!1634) (currentByte!6070 thiss!1634) (size!2844 (buf!3257 thiss!1634)))))))

(declare-fun isPrefixOf!0 (BitStream!4952 BitStream!4952) Bool)

(assert (=> b!138785 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!8644 0))(
  ( (Unit!8645) )
))
(declare-fun lt!216657 () Unit!8644)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4952) Unit!8644)

(assert (=> b!138785 (= lt!216657 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!115698 () Bool)

(assert (=> start!26900 (=> (not res!115698) (not e!92318))))

(declare-fun arr!237 () array!6280)

(assert (=> start!26900 (= res!115698 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2844 arr!237))))))

(assert (=> start!26900 e!92318))

(assert (=> start!26900 true))

(assert (=> start!26900 (array_inv!2633 arr!237)))

(declare-fun inv!12 (BitStream!4952) Bool)

(assert (=> start!26900 (and (inv!12 thiss!1634) e!92319)))

(assert (= (and start!26900 res!115698) b!138783))

(assert (= (and b!138783 res!115696) b!138784))

(assert (= (and b!138784 res!115697) b!138785))

(assert (= start!26900 b!138786))

(declare-fun m!213699 () Bool)

(assert (=> b!138786 m!213699))

(declare-fun m!213701 () Bool)

(assert (=> b!138783 m!213701))

(declare-fun m!213703 () Bool)

(assert (=> b!138785 m!213703))

(declare-fun m!213705 () Bool)

(assert (=> b!138785 m!213705))

(declare-fun m!213707 () Bool)

(assert (=> b!138785 m!213707))

(declare-fun m!213709 () Bool)

(assert (=> start!26900 m!213709))

(declare-fun m!213711 () Bool)

(assert (=> start!26900 m!213711))

(push 1)

(assert (not b!138786))

(assert (not b!138785))

(assert (not start!26900))

(assert (not b!138783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44613 () Bool)

(assert (=> d!44613 (= (array_inv!2633 (buf!3257 thiss!1634)) (bvsge (size!2844 (buf!3257 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!138786 d!44613))

(declare-fun d!44617 () Bool)

(assert (=> d!44617 (= (invariant!0 (currentBit!6065 thiss!1634) (currentByte!6070 thiss!1634) (size!2844 (buf!3257 thiss!1634))) (and (bvsge (currentBit!6065 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6065 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6070 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6070 thiss!1634) (size!2844 (buf!3257 thiss!1634))) (and (= (currentBit!6065 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6070 thiss!1634) (size!2844 (buf!3257 thiss!1634)))))))))

(assert (=> b!138785 d!44617))

(declare-fun d!44619 () Bool)

(declare-fun res!115720 () Bool)

(declare-fun e!92335 () Bool)

(assert (=> d!44619 (=> (not res!115720) (not e!92335))))

(assert (=> d!44619 (= res!115720 (= (size!2844 (buf!3257 thiss!1634)) (size!2844 (buf!3257 thiss!1634))))))

(assert (=> d!44619 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!92335)))

(declare-fun b!138808 () Bool)

(declare-fun res!115721 () Bool)

(assert (=> b!138808 (=> (not res!115721) (not e!92335))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138808 (= res!115721 (bvsle (bitIndex!0 (size!2844 (buf!3257 thiss!1634)) (currentByte!6070 thiss!1634) (currentBit!6065 thiss!1634)) (bitIndex!0 (size!2844 (buf!3257 thiss!1634)) (currentByte!6070 thiss!1634) (currentBit!6065 thiss!1634))))))

(declare-fun b!138809 () Bool)

(declare-fun e!92334 () Bool)

(assert (=> b!138809 (= e!92335 e!92334)))

(declare-fun res!115722 () Bool)

(assert (=> b!138809 (=> res!115722 e!92334)))

(assert (=> b!138809 (= res!115722 (= (size!2844 (buf!3257 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138810 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6280 array!6280 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138810 (= e!92334 (arrayBitRangesEq!0 (buf!3257 thiss!1634) (buf!3257 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2844 (buf!3257 thiss!1634)) (currentByte!6070 thiss!1634) (currentBit!6065 thiss!1634))))))

(assert (= (and d!44619 res!115720) b!138808))

(assert (= (and b!138808 res!115721) b!138809))

(assert (= (and b!138809 (not res!115722)) b!138810))

(declare-fun m!213721 () Bool)

(assert (=> b!138808 m!213721))

(assert (=> b!138808 m!213721))

(assert (=> b!138810 m!213721))

(assert (=> b!138810 m!213721))

(declare-fun m!213723 () Bool)

(assert (=> b!138810 m!213723))

(assert (=> b!138785 d!44619))

(declare-fun d!44629 () Bool)

(assert (=> d!44629 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!216663 () Unit!8644)

(declare-fun choose!11 (BitStream!4952) Unit!8644)

(assert (=> d!44629 (= lt!216663 (choose!11 thiss!1634))))

(assert (=> d!44629 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!216663)))

(declare-fun bs!10900 () Bool)

(assert (= bs!10900 d!44629))

(assert (=> bs!10900 m!213705))

(declare-fun m!213729 () Bool)

