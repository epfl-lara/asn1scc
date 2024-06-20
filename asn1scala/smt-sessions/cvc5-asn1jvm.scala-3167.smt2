; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72760 () Bool)

(assert start!72760)

(declare-fun b!324475 () Bool)

(declare-fun e!233910 () Bool)

(declare-datatypes ((array!20858 0))(
  ( (array!20859 (arr!10159 (Array (_ BitVec 32) (_ BitVec 8))) (size!9067 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14296 0))(
  ( (BitStream!14297 (buf!8209 array!20858) (currentByte!15176 (_ BitVec 32)) (currentBit!15171 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14296)

(declare-fun array_inv!8619 (array!20858) Bool)

(assert (=> b!324475 (= e!233910 (array_inv!8619 (buf!8209 thiss!877)))))

(declare-fun b!324472 () Bool)

(declare-fun res!266292 () Bool)

(declare-fun e!233908 () Bool)

(assert (=> b!324472 (=> (not res!266292) (not e!233908))))

(assert (=> b!324472 (= res!266292 (bvslt (currentBit!15171 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324473 () Bool)

(declare-fun res!266293 () Bool)

(assert (=> b!324473 (=> (not res!266293) (not e!233908))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324473 (= res!266293 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9067 (buf!8209 thiss!877)) (currentByte!15176 thiss!877) (currentBit!15171 thiss!877))) (bitIndex!0 (size!9067 (buf!8209 thiss!877)) (currentByte!15176 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15171 thiss!877)))))))

(declare-fun b!324474 () Bool)

(assert (=> b!324474 (= e!233908 (and (bvsle ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15176 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15171 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15176 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15171 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!266291 () Bool)

(assert (=> start!72760 (=> (not res!266291) (not e!233908))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72760 (= res!266291 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))) ((_ sign_extend 32) (currentByte!15176 thiss!877)) ((_ sign_extend 32) (currentBit!15171 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72760 e!233908))

(declare-fun inv!12 (BitStream!14296) Bool)

(assert (=> start!72760 (and (inv!12 thiss!877) e!233910)))

(assert (= (and start!72760 res!266291) b!324472))

(assert (= (and b!324472 res!266292) b!324473))

(assert (= (and b!324473 res!266293) b!324474))

(assert (= start!72760 b!324475))

(declare-fun m!462589 () Bool)

(assert (=> b!324475 m!462589))

(declare-fun m!462591 () Bool)

(assert (=> b!324473 m!462591))

(declare-fun m!462593 () Bool)

(assert (=> b!324473 m!462593))

(declare-fun m!462595 () Bool)

(assert (=> start!72760 m!462595))

(declare-fun m!462597 () Bool)

(assert (=> start!72760 m!462597))

(push 1)

(assert (not start!72760))

(assert (not b!324475))

(assert (not b!324473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106678 () Bool)

(assert (=> d!106678 (= (remainingBits!0 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))) ((_ sign_extend 32) (currentByte!15176 thiss!877)) ((_ sign_extend 32) (currentBit!15171 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15176 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15171 thiss!877)))))))

(assert (=> start!72760 d!106678))

(declare-fun d!106680 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106680 (= (inv!12 thiss!877) (invariant!0 (currentBit!15171 thiss!877) (currentByte!15176 thiss!877) (size!9067 (buf!8209 thiss!877))))))

(declare-fun bs!28103 () Bool)

(assert (= bs!28103 d!106680))

(declare-fun m!462625 () Bool)

(assert (=> bs!28103 m!462625))

(assert (=> start!72760 d!106680))

(declare-fun d!106686 () Bool)

(assert (=> d!106686 (= (array_inv!8619 (buf!8209 thiss!877)) (bvsge (size!9067 (buf!8209 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324475 d!106686))

(declare-fun d!106688 () Bool)

(declare-fun e!233939 () Bool)

(assert (=> d!106688 e!233939))

(declare-fun res!266332 () Bool)

(assert (=> d!106688 (=> (not res!266332) (not e!233939))))

(declare-fun lt!447032 () (_ BitVec 64))

(declare-fun lt!447028 () (_ BitVec 64))

(declare-fun lt!447030 () (_ BitVec 64))

(assert (=> d!106688 (= res!266332 (= lt!447030 (bvsub lt!447028 lt!447032)))))

(assert (=> d!106688 (or (= (bvand lt!447028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447028 lt!447032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106688 (= lt!447032 (remainingBits!0 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))) ((_ sign_extend 32) (currentByte!15176 thiss!877)) ((_ sign_extend 32) (currentBit!15171 thiss!877))))))

(declare-fun lt!447031 () (_ BitVec 64))

(declare-fun lt!447029 () (_ BitVec 64))

(assert (=> d!106688 (= lt!447028 (bvmul lt!447031 lt!447029))))

(assert (=> d!106688 (or (= lt!447031 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447029 (bvsdiv (bvmul lt!447031 lt!447029) lt!447031)))))

(assert (=> d!106688 (= lt!447029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106688 (= lt!447031 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))))))

(assert (=> d!106688 (= lt!447030 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15176 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15171 thiss!877))))))

(assert (=> d!106688 (invariant!0 (currentBit!15171 thiss!877) (currentByte!15176 thiss!877) (size!9067 (buf!8209 thiss!877)))))

(assert (=> d!106688 (= (bitIndex!0 (size!9067 (buf!8209 thiss!877)) (currentByte!15176 thiss!877) (currentBit!15171 thiss!877)) lt!447030)))

(declare-fun b!324520 () Bool)

(declare-fun res!266333 () Bool)

(assert (=> b!324520 (=> (not res!266333) (not e!233939))))

(assert (=> b!324520 (= res!266333 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447030))))

(declare-fun b!324521 () Bool)

(declare-fun lt!447027 () (_ BitVec 64))

(assert (=> b!324521 (= e!233939 (bvsle lt!447030 (bvmul lt!447027 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324521 (or (= lt!447027 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447027 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447027)))))

(assert (=> b!324521 (= lt!447027 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))))))

(assert (= (and d!106688 res!266332) b!324520))

(assert (= (and b!324520 res!266333) b!324521))

(assert (=> d!106688 m!462595))

(assert (=> d!106688 m!462625))

(assert (=> b!324473 d!106688))

(declare-fun d!106704 () Bool)

(declare-fun e!233940 () Bool)

(assert (=> d!106704 e!233940))

(declare-fun res!266334 () Bool)

(assert (=> d!106704 (=> (not res!266334) (not e!233940))))

(declare-fun lt!447034 () (_ BitVec 64))

(declare-fun lt!447038 () (_ BitVec 64))

(declare-fun lt!447036 () (_ BitVec 64))

(assert (=> d!106704 (= res!266334 (= lt!447036 (bvsub lt!447034 lt!447038)))))

(assert (=> d!106704 (or (= (bvand lt!447034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447038 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447034 lt!447038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106704 (= lt!447038 (remainingBits!0 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))) ((_ sign_extend 32) (currentByte!15176 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15171 thiss!877)))))))

(declare-fun lt!447037 () (_ BitVec 64))

(declare-fun lt!447035 () (_ BitVec 64))

(assert (=> d!106704 (= lt!447034 (bvmul lt!447037 lt!447035))))

(assert (=> d!106704 (or (= lt!447037 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447035 (bvsdiv (bvmul lt!447037 lt!447035) lt!447037)))))

(assert (=> d!106704 (= lt!447035 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106704 (= lt!447037 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))))))

(assert (=> d!106704 (= lt!447036 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15176 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15171 thiss!877)))))))

(assert (=> d!106704 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15171 thiss!877)) (currentByte!15176 thiss!877) (size!9067 (buf!8209 thiss!877)))))

(assert (=> d!106704 (= (bitIndex!0 (size!9067 (buf!8209 thiss!877)) (currentByte!15176 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15171 thiss!877))) lt!447036)))

(declare-fun b!324522 () Bool)

(declare-fun res!266335 () Bool)

(assert (=> b!324522 (=> (not res!266335) (not e!233940))))

(assert (=> b!324522 (= res!266335 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447036))))

(declare-fun b!324523 () Bool)

(declare-fun lt!447033 () (_ BitVec 64))

(assert (=> b!324523 (= e!233940 (bvsle lt!447036 (bvmul lt!447033 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324523 (or (= lt!447033 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447033 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447033)))))

(assert (=> b!324523 (= lt!447033 ((_ sign_extend 32) (size!9067 (buf!8209 thiss!877))))))

(assert (= (and d!106704 res!266334) b!324522))

(assert (= (and b!324522 res!266335) b!324523))

(declare-fun m!462633 () Bool)

(assert (=> d!106704 m!462633))

(declare-fun m!462635 () Bool)

(assert (=> d!106704 m!462635))

(assert (=> b!324473 d!106704))

(push 1)

(assert (not d!106680))

(assert (not d!106704))

(assert (not d!106688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

