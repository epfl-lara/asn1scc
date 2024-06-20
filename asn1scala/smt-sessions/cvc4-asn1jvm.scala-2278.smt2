; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57712 () Bool)

(assert start!57712)

(declare-fun b!264833 () Bool)

(declare-fun e!184915 () Bool)

(declare-fun e!184913 () Bool)

(assert (=> b!264833 (= e!184915 (not e!184913))))

(declare-fun res!221360 () Bool)

(assert (=> b!264833 (=> res!221360 e!184913)))

(declare-fun e!184912 () Bool)

(assert (=> b!264833 (= res!221360 e!184912)))

(declare-fun res!221365 () Bool)

(assert (=> b!264833 (=> (not res!221365) (not e!184912))))

(declare-datatypes ((array!14763 0))(
  ( (array!14764 (arr!7428 (Array (_ BitVec 32) (_ BitVec 8))) (size!6441 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11696 0))(
  ( (BitStream!11697 (buf!6909 array!14763) (currentByte!12785 (_ BitVec 32)) (currentBit!12780 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11696)

(assert (=> b!264833 (= res!221365 (not (= (size!6441 (buf!6909 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11696)

(declare-fun isPrefixOf!0 (BitStream!11696 BitStream!11696) Bool)

(assert (=> b!264833 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18854 0))(
  ( (Unit!18855) )
))
(declare-fun lt!406033 () Unit!18854)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11696) Unit!18854)

(assert (=> b!264833 (= lt!406033 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406035 () BitStream!11696)

(assert (=> b!264833 (isPrefixOf!0 lt!406035 lt!406035)))

(declare-fun lt!406032 () Unit!18854)

(assert (=> b!264833 (= lt!406032 (lemmaIsPrefixRefl!0 lt!406035))))

(assert (=> b!264833 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406036 () Unit!18854)

(assert (=> b!264833 (= lt!406036 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264833 (= lt!406035 (BitStream!11697 (buf!6909 w2!580) (currentByte!12785 w1!584) (currentBit!12780 w1!584)))))

(declare-fun b!264834 () Bool)

(declare-fun e!184911 () Unit!18854)

(declare-fun lt!406030 () Unit!18854)

(assert (=> b!264834 (= e!184911 lt!406030)))

(declare-fun lt!406037 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264834 (= lt!406037 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14763 array!14763 (_ BitVec 64) (_ BitVec 64)) Unit!18854)

(assert (=> b!264834 (= lt!406030 (arrayBitRangesEqSymmetric!0 (buf!6909 w1!584) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037))))

(declare-fun arrayBitRangesEq!0 (array!14763 array!14763 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!264834 (arrayBitRangesEq!0 (buf!6909 w2!580) (buf!6909 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037)))

(declare-fun b!264835 () Bool)

(declare-fun e!184916 () Bool)

(assert (=> b!264835 (= e!184913 e!184916)))

(declare-fun res!221363 () Bool)

(assert (=> b!264835 (=> res!221363 e!184916)))

(declare-fun e!184919 () Bool)

(assert (=> b!264835 (= res!221363 e!184919)))

(declare-fun res!221364 () Bool)

(assert (=> b!264835 (=> (not res!221364) (not e!184919))))

(assert (=> b!264835 (= res!221364 (not (= (size!6441 (buf!6909 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!406029 () Unit!18854)

(assert (=> b!264835 (= lt!406029 e!184911)))

(declare-fun c!12159 () Bool)

(assert (=> b!264835 (= c!12159 (not (= (size!6441 (buf!6909 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264836 () Bool)

(declare-fun res!221361 () Bool)

(assert (=> b!264836 (=> res!221361 e!184916)))

(assert (=> b!264836 (= res!221361 (not (isPrefixOf!0 lt!406035 w1!584)))))

(declare-fun b!264837 () Bool)

(declare-fun e!184918 () Bool)

(declare-fun array_inv!6165 (array!14763) Bool)

(assert (=> b!264837 (= e!184918 (array_inv!6165 (buf!6909 w1!584)))))

(declare-fun b!264838 () Bool)

(declare-fun e!184920 () Bool)

(assert (=> b!264838 (= e!184920 (array_inv!6165 (buf!6909 w2!580)))))

(declare-fun res!221362 () Bool)

(assert (=> start!57712 (=> (not res!221362) (not e!184915))))

(assert (=> start!57712 (= res!221362 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57712 e!184915))

(declare-fun inv!12 (BitStream!11696) Bool)

(assert (=> start!57712 (and (inv!12 w1!584) e!184918)))

(assert (=> start!57712 (and (inv!12 w2!580) e!184920)))

(declare-fun b!264839 () Bool)

(declare-fun Unit!18856 () Unit!18854)

(assert (=> b!264839 (= e!184911 Unit!18856)))

(declare-fun b!264840 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!11696 (_ BitVec 64)) Bool)

(assert (=> b!264840 (= e!184916 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580)))))))

(declare-fun lt!406031 () Unit!18854)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11696 BitStream!11696 BitStream!11696) Unit!18854)

(assert (=> b!264840 (= lt!406031 (lemmaIsPrefixTransitive!0 lt!406035 w2!580 w2!580))))

(assert (=> b!264840 (isPrefixOf!0 lt!406035 w2!580)))

(declare-fun lt!406034 () Unit!18854)

(assert (=> b!264840 (= lt!406034 (lemmaIsPrefixTransitive!0 lt!406035 w1!584 w2!580))))

(declare-fun b!264841 () Bool)

(assert (=> b!264841 (= e!184912 (not (arrayBitRangesEq!0 (buf!6909 w1!584) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)))))))

(declare-fun b!264842 () Bool)

(assert (=> b!264842 (= e!184919 (not (arrayBitRangesEq!0 (buf!6909 w2!580) (buf!6909 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)))))))

(assert (= (and start!57712 res!221362) b!264833))

(assert (= (and b!264833 res!221365) b!264841))

(assert (= (and b!264833 (not res!221360)) b!264835))

(assert (= (and b!264835 c!12159) b!264834))

(assert (= (and b!264835 (not c!12159)) b!264839))

(assert (= (and b!264835 res!221364) b!264842))

(assert (= (and b!264835 (not res!221363)) b!264836))

(assert (= (and b!264836 (not res!221361)) b!264840))

(assert (= start!57712 b!264837))

(assert (= start!57712 b!264838))

(declare-fun m!395433 () Bool)

(assert (=> b!264841 m!395433))

(assert (=> b!264841 m!395433))

(declare-fun m!395435 () Bool)

(assert (=> b!264841 m!395435))

(declare-fun m!395437 () Bool)

(assert (=> b!264837 m!395437))

(declare-fun m!395439 () Bool)

(assert (=> b!264833 m!395439))

(declare-fun m!395441 () Bool)

(assert (=> b!264833 m!395441))

(declare-fun m!395443 () Bool)

(assert (=> b!264833 m!395443))

(declare-fun m!395445 () Bool)

(assert (=> b!264833 m!395445))

(declare-fun m!395447 () Bool)

(assert (=> b!264833 m!395447))

(declare-fun m!395449 () Bool)

(assert (=> b!264833 m!395449))

(assert (=> b!264842 m!395433))

(assert (=> b!264842 m!395433))

(declare-fun m!395451 () Bool)

(assert (=> b!264842 m!395451))

(assert (=> b!264834 m!395433))

(declare-fun m!395453 () Bool)

(assert (=> b!264834 m!395453))

(declare-fun m!395455 () Bool)

(assert (=> b!264834 m!395455))

(assert (=> b!264840 m!395433))

(declare-fun m!395457 () Bool)

(assert (=> b!264840 m!395457))

(declare-fun m!395459 () Bool)

(assert (=> b!264840 m!395459))

(declare-fun m!395461 () Bool)

(assert (=> b!264840 m!395461))

(declare-fun m!395463 () Bool)

(assert (=> b!264840 m!395463))

(declare-fun m!395465 () Bool)

(assert (=> b!264840 m!395465))

(declare-fun m!395467 () Bool)

(assert (=> b!264838 m!395467))

(declare-fun m!395469 () Bool)

(assert (=> start!57712 m!395469))

(declare-fun m!395471 () Bool)

(assert (=> start!57712 m!395471))

(declare-fun m!395473 () Bool)

(assert (=> start!57712 m!395473))

(declare-fun m!395475 () Bool)

(assert (=> b!264836 m!395475))

(push 1)

(assert (not b!264837))

(assert (not b!264833))

(assert (not b!264842))

(assert (not b!264838))

(assert (not b!264841))

(assert (not b!264836))

(assert (not start!57712))

(assert (not b!264834))

(assert (not b!264840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89352 () Bool)

(assert (=> d!89352 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406045 () Unit!18854)

(declare-fun choose!11 (BitStream!11696) Unit!18854)

(assert (=> d!89352 (= lt!406045 (choose!11 w2!580))))

(assert (=> d!89352 (= (lemmaIsPrefixRefl!0 w2!580) lt!406045)))

(declare-fun bs!22682 () Bool)

(assert (= bs!22682 d!89352))

(assert (=> bs!22682 m!395445))

(declare-fun m!395491 () Bool)

(assert (=> bs!22682 m!395491))

(assert (=> b!264833 d!89352))

(declare-fun d!89360 () Bool)

(declare-fun res!221387 () Bool)

(declare-fun e!184935 () Bool)

(assert (=> d!89360 (=> (not res!221387) (not e!184935))))

(assert (=> d!89360 (= res!221387 (= (size!6441 (buf!6909 lt!406035)) (size!6441 (buf!6909 lt!406035))))))

(assert (=> d!89360 (= (isPrefixOf!0 lt!406035 lt!406035) e!184935)))

(declare-fun b!264864 () Bool)

(declare-fun res!221389 () Bool)

(assert (=> b!264864 (=> (not res!221389) (not e!184935))))

(assert (=> b!264864 (= res!221389 (bvsle (bitIndex!0 (size!6441 (buf!6909 lt!406035)) (currentByte!12785 lt!406035) (currentBit!12780 lt!406035)) (bitIndex!0 (size!6441 (buf!6909 lt!406035)) (currentByte!12785 lt!406035) (currentBit!12780 lt!406035))))))

(declare-fun b!264865 () Bool)

(declare-fun e!184936 () Bool)

(assert (=> b!264865 (= e!184935 e!184936)))

(declare-fun res!221388 () Bool)

(assert (=> b!264865 (=> res!221388 e!184936)))

(assert (=> b!264865 (= res!221388 (= (size!6441 (buf!6909 lt!406035)) #b00000000000000000000000000000000))))

(declare-fun b!264866 () Bool)

(assert (=> b!264866 (= e!184936 (arrayBitRangesEq!0 (buf!6909 lt!406035) (buf!6909 lt!406035) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 lt!406035)) (currentByte!12785 lt!406035) (currentBit!12780 lt!406035))))))

(assert (= (and d!89360 res!221387) b!264864))

(assert (= (and b!264864 res!221389) b!264865))

(assert (= (and b!264865 (not res!221388)) b!264866))

(declare-fun m!395493 () Bool)

(assert (=> b!264864 m!395493))

(assert (=> b!264864 m!395493))

(assert (=> b!264866 m!395493))

(assert (=> b!264866 m!395493))

(declare-fun m!395495 () Bool)

(assert (=> b!264866 m!395495))

(assert (=> b!264833 d!89360))

(declare-fun d!89362 () Bool)

(assert (=> d!89362 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406052 () Unit!18854)

(assert (=> d!89362 (= lt!406052 (choose!11 w1!584))))

(assert (=> d!89362 (= (lemmaIsPrefixRefl!0 w1!584) lt!406052)))

(declare-fun bs!22683 () Bool)

(assert (= bs!22683 d!89362))

(assert (=> bs!22683 m!395443))

(declare-fun m!395497 () Bool)

(assert (=> bs!22683 m!395497))

(assert (=> b!264833 d!89362))

(declare-fun d!89364 () Bool)

(assert (=> d!89364 (isPrefixOf!0 lt!406035 lt!406035)))

(declare-fun lt!406053 () Unit!18854)

(assert (=> d!89364 (= lt!406053 (choose!11 lt!406035))))

(assert (=> d!89364 (= (lemmaIsPrefixRefl!0 lt!406035) lt!406053)))

(declare-fun bs!22684 () Bool)

(assert (= bs!22684 d!89364))

(assert (=> bs!22684 m!395439))

(declare-fun m!395499 () Bool)

(assert (=> bs!22684 m!395499))

(assert (=> b!264833 d!89364))

(declare-fun d!89366 () Bool)

(declare-fun res!221398 () Bool)

(declare-fun e!184947 () Bool)

(assert (=> d!89366 (=> (not res!221398) (not e!184947))))

(assert (=> d!89366 (= res!221398 (= (size!6441 (buf!6909 w1!584)) (size!6441 (buf!6909 w1!584))))))

(assert (=> d!89366 (= (isPrefixOf!0 w1!584 w1!584) e!184947)))

(declare-fun b!264877 () Bool)

(declare-fun res!221400 () Bool)

(assert (=> b!264877 (=> (not res!221400) (not e!184947))))

(assert (=> b!264877 (= res!221400 (bvsle (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(declare-fun b!264878 () Bool)

(declare-fun e!184948 () Bool)

(assert (=> b!264878 (= e!184947 e!184948)))

(declare-fun res!221399 () Bool)

(assert (=> b!264878 (=> res!221399 e!184948)))

(assert (=> b!264878 (= res!221399 (= (size!6441 (buf!6909 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264879 () Bool)

(assert (=> b!264879 (= e!184948 (arrayBitRangesEq!0 (buf!6909 w1!584) (buf!6909 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(assert (= (and d!89366 res!221398) b!264877))

(assert (= (and b!264877 res!221400) b!264878))

(assert (= (and b!264878 (not res!221399)) b!264879))

(assert (=> b!264877 m!395433))

(assert (=> b!264877 m!395433))

(assert (=> b!264879 m!395433))

(assert (=> b!264879 m!395433))

(declare-fun m!395501 () Bool)

(assert (=> b!264879 m!395501))

(assert (=> b!264833 d!89366))

(declare-fun d!89368 () Bool)

(declare-fun res!221403 () Bool)

(declare-fun e!184951 () Bool)

(assert (=> d!89368 (=> (not res!221403) (not e!184951))))

(assert (=> d!89368 (= res!221403 (= (size!6441 (buf!6909 w2!580)) (size!6441 (buf!6909 w2!580))))))

(assert (=> d!89368 (= (isPrefixOf!0 w2!580 w2!580) e!184951)))

(declare-fun b!264884 () Bool)

(declare-fun res!221405 () Bool)

(assert (=> b!264884 (=> (not res!221405) (not e!184951))))

(assert (=> b!264884 (= res!221405 (bvsle (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580))))))

(declare-fun b!264885 () Bool)

(declare-fun e!184952 () Bool)

(assert (=> b!264885 (= e!184951 e!184952)))

(declare-fun res!221404 () Bool)

(assert (=> b!264885 (=> res!221404 e!184952)))

(assert (=> b!264885 (= res!221404 (= (size!6441 (buf!6909 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!264886 () Bool)

(assert (=> b!264886 (= e!184952 (arrayBitRangesEq!0 (buf!6909 w2!580) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580))))))

(assert (= (and d!89368 res!221403) b!264884))

(assert (= (and b!264884 res!221405) b!264885))

(assert (= (and b!264885 (not res!221404)) b!264886))

(assert (=> b!264884 m!395457))

(assert (=> b!264884 m!395457))

(assert (=> b!264886 m!395457))

(assert (=> b!264886 m!395457))

(declare-fun m!395503 () Bool)

(assert (=> b!264886 m!395503))

(assert (=> b!264833 d!89368))

(declare-fun d!89370 () Bool)

(assert (=> d!89370 (= (array_inv!6165 (buf!6909 w2!580)) (bvsge (size!6441 (buf!6909 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264838 d!89370))

(declare-fun d!89372 () Bool)

(declare-fun res!221416 () Bool)

(declare-fun e!184965 () Bool)

(assert (=> d!89372 (=> (not res!221416) (not e!184965))))

(assert (=> d!89372 (= res!221416 (= (size!6441 (buf!6909 w1!584)) (size!6441 (buf!6909 w2!580))))))

(assert (=> d!89372 (= (isPrefixOf!0 w1!584 w2!580) e!184965)))

(declare-fun b!264901 () Bool)

(declare-fun res!221418 () Bool)

(assert (=> b!264901 (=> (not res!221418) (not e!184965))))

(assert (=> b!264901 (= res!221418 (bvsle (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580))))))

(declare-fun b!264902 () Bool)

(declare-fun e!184966 () Bool)

(assert (=> b!264902 (= e!184965 e!184966)))

(declare-fun res!221417 () Bool)

(assert (=> b!264902 (=> res!221417 e!184966)))

(assert (=> b!264902 (= res!221417 (= (size!6441 (buf!6909 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264903 () Bool)

(assert (=> b!264903 (= e!184966 (arrayBitRangesEq!0 (buf!6909 w1!584) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(assert (= (and d!89372 res!221416) b!264901))

(assert (= (and b!264901 res!221418) b!264902))

(assert (= (and b!264902 (not res!221417)) b!264903))

(assert (=> b!264901 m!395433))

(assert (=> b!264901 m!395457))

(assert (=> b!264903 m!395433))

(assert (=> b!264903 m!395433))

(assert (=> b!264903 m!395435))

(assert (=> start!57712 d!89372))

(declare-fun d!89374 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89374 (= (inv!12 w1!584) (invariant!0 (currentBit!12780 w1!584) (currentByte!12785 w1!584) (size!6441 (buf!6909 w1!584))))))

(declare-fun bs!22685 () Bool)

(assert (= bs!22685 d!89374))

(declare-fun m!395505 () Bool)

(assert (=> bs!22685 m!395505))

(assert (=> start!57712 d!89374))

(declare-fun d!89376 () Bool)

(assert (=> d!89376 (= (inv!12 w2!580) (invariant!0 (currentBit!12780 w2!580) (currentByte!12785 w2!580) (size!6441 (buf!6909 w2!580))))))

(declare-fun bs!22686 () Bool)

(assert (= bs!22686 d!89376))

(declare-fun m!395507 () Bool)

(assert (=> bs!22686 m!395507))

(assert (=> start!57712 d!89376))

(declare-fun d!89378 () Bool)

(assert (=> d!89378 (= (array_inv!6165 (buf!6909 w1!584)) (bvsge (size!6441 (buf!6909 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264837 d!89378))

(declare-fun b!264963 () Bool)

(declare-datatypes ((tuple4!358 0))(
  ( (tuple4!359 (_1!12159 (_ BitVec 32)) (_2!12159 (_ BitVec 32)) (_3!959 (_ BitVec 32)) (_4!179 (_ BitVec 32))) )
))
(declare-fun lt!406116 () tuple4!358)

(declare-fun e!185010 () Bool)

(declare-fun lt!406117 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264963 (= e!185010 (byteRangesEq!0 (select (arr!7428 (buf!6909 w2!580)) (_4!179 lt!406116)) (select (arr!7428 (buf!6909 w1!584)) (_4!179 lt!406116)) #b00000000000000000000000000000000 lt!406117))))

(declare-fun b!264964 () Bool)

(declare-fun e!185013 () Bool)

(declare-fun e!185012 () Bool)

(assert (=> b!264964 (= e!185013 e!185012)))

(declare-fun res!221471 () Bool)

(assert (=> b!264964 (=> (not res!221471) (not e!185012))))

(declare-fun e!185011 () Bool)

(assert (=> b!264964 (= res!221471 e!185011)))

(declare-fun res!221472 () Bool)

(assert (=> b!264964 (=> res!221472 e!185011)))

(assert (=> b!264964 (= res!221472 (bvsge (_1!12159 lt!406116) (_2!12159 lt!406116)))))

(assert (=> b!264964 (= lt!406117 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406118 () (_ BitVec 32))

(assert (=> b!264964 (= lt!406118 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!358)

(assert (=> b!264964 (= lt!406116 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(declare-fun b!264965 () Bool)

(declare-fun res!221470 () Bool)

(assert (=> b!264965 (= res!221470 (= lt!406117 #b00000000000000000000000000000000))))

(assert (=> b!264965 (=> res!221470 e!185010)))

(declare-fun e!185014 () Bool)

(assert (=> b!264965 (= e!185014 e!185010)))

(declare-fun b!264966 () Bool)

(declare-fun e!185015 () Bool)

(assert (=> b!264966 (= e!185012 e!185015)))

(declare-fun c!12168 () Bool)

(assert (=> b!264966 (= c!12168 (= (_3!959 lt!406116) (_4!179 lt!406116)))))

(declare-fun b!264967 () Bool)

(declare-fun call!4109 () Bool)

(assert (=> b!264967 (= e!185015 call!4109)))

(declare-fun d!89380 () Bool)

(declare-fun res!221469 () Bool)

(assert (=> d!89380 (=> res!221469 e!185013)))

(assert (=> d!89380 (= res!221469 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(assert (=> d!89380 (= (arrayBitRangesEq!0 (buf!6909 w2!580) (buf!6909 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))) e!185013)))

(declare-fun b!264968 () Bool)

(declare-fun arrayRangesEq!1015 (array!14763 array!14763 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264968 (= e!185011 (arrayRangesEq!1015 (buf!6909 w2!580) (buf!6909 w1!584) (_1!12159 lt!406116) (_2!12159 lt!406116)))))

(declare-fun bm!4106 () Bool)

(assert (=> bm!4106 (= call!4109 (byteRangesEq!0 (select (arr!7428 (buf!6909 w2!580)) (_3!959 lt!406116)) (select (arr!7428 (buf!6909 w1!584)) (_3!959 lt!406116)) lt!406118 (ite c!12168 lt!406117 #b00000000000000000000000000001000)))))

(declare-fun b!264969 () Bool)

(assert (=> b!264969 (= e!185015 e!185014)))

(declare-fun res!221473 () Bool)

(assert (=> b!264969 (= res!221473 call!4109)))

(assert (=> b!264969 (=> (not res!221473) (not e!185014))))

(assert (= (and d!89380 (not res!221469)) b!264964))

(assert (= (and b!264964 (not res!221472)) b!264968))

(assert (= (and b!264964 res!221471) b!264966))

(assert (= (and b!264966 c!12168) b!264967))

(assert (= (and b!264966 (not c!12168)) b!264969))

(assert (= (and b!264969 res!221473) b!264965))

(assert (= (and b!264965 (not res!221470)) b!264963))

(assert (= (or b!264967 b!264969) bm!4106))

(declare-fun m!395565 () Bool)

(assert (=> b!264963 m!395565))

(declare-fun m!395567 () Bool)

(assert (=> b!264963 m!395567))

(assert (=> b!264963 m!395565))

(assert (=> b!264963 m!395567))

(declare-fun m!395569 () Bool)

(assert (=> b!264963 m!395569))

(assert (=> b!264964 m!395433))

(declare-fun m!395571 () Bool)

(assert (=> b!264964 m!395571))

(declare-fun m!395573 () Bool)

(assert (=> b!264968 m!395573))

(declare-fun m!395575 () Bool)

(assert (=> bm!4106 m!395575))

(declare-fun m!395577 () Bool)

(assert (=> bm!4106 m!395577))

(assert (=> bm!4106 m!395575))

(assert (=> bm!4106 m!395577))

(declare-fun m!395579 () Bool)

(assert (=> bm!4106 m!395579))

(assert (=> b!264842 d!89380))

(declare-fun d!89408 () Bool)

(declare-fun e!185059 () Bool)

(assert (=> d!89408 e!185059))

(declare-fun res!221523 () Bool)

(assert (=> d!89408 (=> (not res!221523) (not e!185059))))

(declare-fun lt!406174 () (_ BitVec 64))

(declare-fun lt!406177 () (_ BitVec 64))

(declare-fun lt!406175 () (_ BitVec 64))

(assert (=> d!89408 (= res!221523 (= lt!406177 (bvsub lt!406175 lt!406174)))))

(assert (=> d!89408 (or (= (bvand lt!406175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406175 lt!406174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89408 (= lt!406174 (remainingBits!0 ((_ sign_extend 32) (size!6441 (buf!6909 w1!584))) ((_ sign_extend 32) (currentByte!12785 w1!584)) ((_ sign_extend 32) (currentBit!12780 w1!584))))))

(declare-fun lt!406172 () (_ BitVec 64))

(declare-fun lt!406173 () (_ BitVec 64))

(assert (=> d!89408 (= lt!406175 (bvmul lt!406172 lt!406173))))

(assert (=> d!89408 (or (= lt!406172 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406173 (bvsdiv (bvmul lt!406172 lt!406173) lt!406172)))))

(assert (=> d!89408 (= lt!406173 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89408 (= lt!406172 ((_ sign_extend 32) (size!6441 (buf!6909 w1!584))))))

(assert (=> d!89408 (= lt!406177 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12785 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12780 w1!584))))))

(assert (=> d!89408 (invariant!0 (currentBit!12780 w1!584) (currentByte!12785 w1!584) (size!6441 (buf!6909 w1!584)))))

(assert (=> d!89408 (= (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) lt!406177)))

(declare-fun b!265028 () Bool)

(declare-fun res!221524 () Bool)

(assert (=> b!265028 (=> (not res!221524) (not e!185059))))

(assert (=> b!265028 (= res!221524 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406177))))

(declare-fun b!265029 () Bool)

(declare-fun lt!406176 () (_ BitVec 64))

(assert (=> b!265029 (= e!185059 (bvsle lt!406177 (bvmul lt!406176 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265029 (or (= lt!406176 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406176 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406176)))))

(assert (=> b!265029 (= lt!406176 ((_ sign_extend 32) (size!6441 (buf!6909 w1!584))))))

(assert (= (and d!89408 res!221523) b!265028))

(assert (= (and b!265028 res!221524) b!265029))

(declare-fun m!395667 () Bool)

(assert (=> d!89408 m!395667))

(assert (=> d!89408 m!395505))

(assert (=> b!264842 d!89408))

(declare-fun d!89456 () Bool)

(declare-fun res!221525 () Bool)

(declare-fun e!185060 () Bool)

(assert (=> d!89456 (=> (not res!221525) (not e!185060))))

(assert (=> d!89456 (= res!221525 (= (size!6441 (buf!6909 lt!406035)) (size!6441 (buf!6909 w1!584))))))

(assert (=> d!89456 (= (isPrefixOf!0 lt!406035 w1!584) e!185060)))

(declare-fun b!265030 () Bool)

(declare-fun res!221527 () Bool)

(assert (=> b!265030 (=> (not res!221527) (not e!185060))))

(assert (=> b!265030 (= res!221527 (bvsle (bitIndex!0 (size!6441 (buf!6909 lt!406035)) (currentByte!12785 lt!406035) (currentBit!12780 lt!406035)) (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(declare-fun b!265031 () Bool)

(declare-fun e!185061 () Bool)

(assert (=> b!265031 (= e!185060 e!185061)))

(declare-fun res!221526 () Bool)

(assert (=> b!265031 (=> res!221526 e!185061)))

(assert (=> b!265031 (= res!221526 (= (size!6441 (buf!6909 lt!406035)) #b00000000000000000000000000000000))))

(declare-fun b!265032 () Bool)

(assert (=> b!265032 (= e!185061 (arrayBitRangesEq!0 (buf!6909 lt!406035) (buf!6909 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 lt!406035)) (currentByte!12785 lt!406035) (currentBit!12780 lt!406035))))))

(assert (= (and d!89456 res!221525) b!265030))

(assert (= (and b!265030 res!221527) b!265031))

(assert (= (and b!265031 (not res!221526)) b!265032))

(assert (=> b!265030 m!395493))

(assert (=> b!265030 m!395433))

(assert (=> b!265032 m!395493))

(assert (=> b!265032 m!395493))

(declare-fun m!395669 () Bool)

(assert (=> b!265032 m!395669))

(assert (=> b!264836 d!89456))

(declare-fun lt!406179 () (_ BitVec 32))

(declare-fun b!265033 () Bool)

(declare-fun e!185062 () Bool)

(declare-fun lt!406178 () tuple4!358)

(assert (=> b!265033 (= e!185062 (byteRangesEq!0 (select (arr!7428 (buf!6909 w1!584)) (_4!179 lt!406178)) (select (arr!7428 (buf!6909 w2!580)) (_4!179 lt!406178)) #b00000000000000000000000000000000 lt!406179))))

(declare-fun b!265034 () Bool)

(declare-fun e!185065 () Bool)

(declare-fun e!185064 () Bool)

(assert (=> b!265034 (= e!185065 e!185064)))

(declare-fun res!221530 () Bool)

(assert (=> b!265034 (=> (not res!221530) (not e!185064))))

(declare-fun e!185063 () Bool)

(assert (=> b!265034 (= res!221530 e!185063)))

(declare-fun res!221531 () Bool)

(assert (=> b!265034 (=> res!221531 e!185063)))

(assert (=> b!265034 (= res!221531 (bvsge (_1!12159 lt!406178) (_2!12159 lt!406178)))))

(assert (=> b!265034 (= lt!406179 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406180 () (_ BitVec 32))

(assert (=> b!265034 (= lt!406180 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265034 (= lt!406178 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(declare-fun b!265035 () Bool)

(declare-fun res!221529 () Bool)

(assert (=> b!265035 (= res!221529 (= lt!406179 #b00000000000000000000000000000000))))

(assert (=> b!265035 (=> res!221529 e!185062)))

(declare-fun e!185066 () Bool)

(assert (=> b!265035 (= e!185066 e!185062)))

(declare-fun b!265036 () Bool)

(declare-fun e!185067 () Bool)

(assert (=> b!265036 (= e!185064 e!185067)))

(declare-fun c!12173 () Bool)

(assert (=> b!265036 (= c!12173 (= (_3!959 lt!406178) (_4!179 lt!406178)))))

(declare-fun b!265037 () Bool)

(declare-fun call!4114 () Bool)

(assert (=> b!265037 (= e!185067 call!4114)))

(declare-fun d!89458 () Bool)

(declare-fun res!221528 () Bool)

(assert (=> d!89458 (=> res!221528 e!185065)))

(assert (=> d!89458 (= res!221528 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))))))

(assert (=> d!89458 (= (arrayBitRangesEq!0 (buf!6909 w1!584) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584))) e!185065)))

(declare-fun b!265038 () Bool)

(assert (=> b!265038 (= e!185063 (arrayRangesEq!1015 (buf!6909 w1!584) (buf!6909 w2!580) (_1!12159 lt!406178) (_2!12159 lt!406178)))))

(declare-fun bm!4111 () Bool)

(assert (=> bm!4111 (= call!4114 (byteRangesEq!0 (select (arr!7428 (buf!6909 w1!584)) (_3!959 lt!406178)) (select (arr!7428 (buf!6909 w2!580)) (_3!959 lt!406178)) lt!406180 (ite c!12173 lt!406179 #b00000000000000000000000000001000)))))

(declare-fun b!265039 () Bool)

(assert (=> b!265039 (= e!185067 e!185066)))

(declare-fun res!221532 () Bool)

(assert (=> b!265039 (= res!221532 call!4114)))

(assert (=> b!265039 (=> (not res!221532) (not e!185066))))

(assert (= (and d!89458 (not res!221528)) b!265034))

(assert (= (and b!265034 (not res!221531)) b!265038))

(assert (= (and b!265034 res!221530) b!265036))

(assert (= (and b!265036 c!12173) b!265037))

(assert (= (and b!265036 (not c!12173)) b!265039))

(assert (= (and b!265039 res!221532) b!265035))

(assert (= (and b!265035 (not res!221529)) b!265033))

(assert (= (or b!265037 b!265039) bm!4111))

(declare-fun m!395671 () Bool)

(assert (=> b!265033 m!395671))

(declare-fun m!395673 () Bool)

(assert (=> b!265033 m!395673))

(assert (=> b!265033 m!395671))

(assert (=> b!265033 m!395673))

(declare-fun m!395675 () Bool)

(assert (=> b!265033 m!395675))

(assert (=> b!265034 m!395433))

(assert (=> b!265034 m!395571))

(declare-fun m!395677 () Bool)

(assert (=> b!265038 m!395677))

(declare-fun m!395679 () Bool)

(assert (=> bm!4111 m!395679))

(declare-fun m!395681 () Bool)

(assert (=> bm!4111 m!395681))

(assert (=> bm!4111 m!395679))

(assert (=> bm!4111 m!395681))

(declare-fun m!395683 () Bool)

(assert (=> bm!4111 m!395683))

(assert (=> b!264841 d!89458))

(assert (=> b!264841 d!89408))

(declare-fun d!89460 () Bool)

(declare-fun res!221535 () Bool)

(declare-fun e!185070 () Bool)

(assert (=> d!89460 (=> (not res!221535) (not e!185070))))

(assert (=> d!89460 (= res!221535 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6441 (buf!6909 w2!580)))) (bvsub (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580)))) (bvsle (bvsub (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6441 (buf!6909 w2!580)))))))))

(assert (=> d!89460 (= (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580)))) e!185070)))

(declare-fun b!265043 () Bool)

(declare-fun lt!406183 () (_ BitVec 64))

(assert (=> b!265043 (= e!185070 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406183) (bvsle lt!406183 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6441 (buf!6909 w2!580)))))))))

(assert (=> b!265043 (= lt!406183 (bvadd (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580)) (bvsub (bitIndex!0 (size!6441 (buf!6909 w1!584)) (currentByte!12785 w1!584) (currentBit!12780 w1!584)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580)))))))

(assert (= (and d!89460 res!221535) b!265043))

(assert (=> b!265043 m!395457))

(assert (=> b!264840 d!89460))

(declare-fun d!89462 () Bool)

(declare-fun e!185071 () Bool)

(assert (=> d!89462 e!185071))

(declare-fun res!221536 () Bool)

(assert (=> d!89462 (=> (not res!221536) (not e!185071))))

(declare-fun lt!406186 () (_ BitVec 64))

(declare-fun lt!406187 () (_ BitVec 64))

(declare-fun lt!406189 () (_ BitVec 64))

(assert (=> d!89462 (= res!221536 (= lt!406189 (bvsub lt!406187 lt!406186)))))

(assert (=> d!89462 (or (= (bvand lt!406187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406186 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406187 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406187 lt!406186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!89462 (= lt!406186 (remainingBits!0 ((_ sign_extend 32) (size!6441 (buf!6909 w2!580))) ((_ sign_extend 32) (currentByte!12785 w2!580)) ((_ sign_extend 32) (currentBit!12780 w2!580))))))

(declare-fun lt!406184 () (_ BitVec 64))

(declare-fun lt!406185 () (_ BitVec 64))

(assert (=> d!89462 (= lt!406187 (bvmul lt!406184 lt!406185))))

(assert (=> d!89462 (or (= lt!406184 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406185 (bvsdiv (bvmul lt!406184 lt!406185) lt!406184)))))

(assert (=> d!89462 (= lt!406185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89462 (= lt!406184 ((_ sign_extend 32) (size!6441 (buf!6909 w2!580))))))

(assert (=> d!89462 (= lt!406189 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12785 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12780 w2!580))))))

(assert (=> d!89462 (invariant!0 (currentBit!12780 w2!580) (currentByte!12785 w2!580) (size!6441 (buf!6909 w2!580)))))

(assert (=> d!89462 (= (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580)) lt!406189)))

(declare-fun b!265044 () Bool)

(declare-fun res!221537 () Bool)

(assert (=> b!265044 (=> (not res!221537) (not e!185071))))

(assert (=> b!265044 (= res!221537 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406189))))

(declare-fun b!265045 () Bool)

(declare-fun lt!406188 () (_ BitVec 64))

(assert (=> b!265045 (= e!185071 (bvsle lt!406189 (bvmul lt!406188 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265045 (or (= lt!406188 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406188 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406188)))))

(assert (=> b!265045 (= lt!406188 ((_ sign_extend 32) (size!6441 (buf!6909 w2!580))))))

(assert (= (and d!89462 res!221536) b!265044))

(assert (= (and b!265044 res!221537) b!265045))

(declare-fun m!395685 () Bool)

(assert (=> d!89462 m!395685))

(assert (=> d!89462 m!395507))

(assert (=> b!264840 d!89462))

(declare-fun d!89464 () Bool)

(assert (=> d!89464 (isPrefixOf!0 lt!406035 w2!580)))

(declare-fun lt!406192 () Unit!18854)

(declare-fun choose!30 (BitStream!11696 BitStream!11696 BitStream!11696) Unit!18854)

(assert (=> d!89464 (= lt!406192 (choose!30 lt!406035 w2!580 w2!580))))

(assert (=> d!89464 (isPrefixOf!0 lt!406035 w2!580)))

(assert (=> d!89464 (= (lemmaIsPrefixTransitive!0 lt!406035 w2!580 w2!580) lt!406192)))

(declare-fun bs!22701 () Bool)

(assert (= bs!22701 d!89464))

(assert (=> bs!22701 m!395459))

(declare-fun m!395687 () Bool)

(assert (=> bs!22701 m!395687))

(assert (=> bs!22701 m!395459))

(assert (=> b!264840 d!89464))

(declare-fun d!89466 () Bool)

(declare-fun res!221538 () Bool)

(declare-fun e!185072 () Bool)

(assert (=> d!89466 (=> (not res!221538) (not e!185072))))

(assert (=> d!89466 (= res!221538 (= (size!6441 (buf!6909 lt!406035)) (size!6441 (buf!6909 w2!580))))))

(assert (=> d!89466 (= (isPrefixOf!0 lt!406035 w2!580) e!185072)))

(declare-fun b!265046 () Bool)

(declare-fun res!221540 () Bool)

(assert (=> b!265046 (=> (not res!221540) (not e!185072))))

(assert (=> b!265046 (= res!221540 (bvsle (bitIndex!0 (size!6441 (buf!6909 lt!406035)) (currentByte!12785 lt!406035) (currentBit!12780 lt!406035)) (bitIndex!0 (size!6441 (buf!6909 w2!580)) (currentByte!12785 w2!580) (currentBit!12780 w2!580))))))

(declare-fun b!265047 () Bool)

(declare-fun e!185073 () Bool)

(assert (=> b!265047 (= e!185072 e!185073)))

(declare-fun res!221539 () Bool)

(assert (=> b!265047 (=> res!221539 e!185073)))

(assert (=> b!265047 (= res!221539 (= (size!6441 (buf!6909 lt!406035)) #b00000000000000000000000000000000))))

(declare-fun b!265048 () Bool)

(assert (=> b!265048 (= e!185073 (arrayBitRangesEq!0 (buf!6909 lt!406035) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6441 (buf!6909 lt!406035)) (currentByte!12785 lt!406035) (currentBit!12780 lt!406035))))))

(assert (= (and d!89466 res!221538) b!265046))

(assert (= (and b!265046 res!221540) b!265047))

(assert (= (and b!265047 (not res!221539)) b!265048))

(assert (=> b!265046 m!395493))

(assert (=> b!265046 m!395457))

(assert (=> b!265048 m!395493))

(assert (=> b!265048 m!395493))

(declare-fun m!395689 () Bool)

(assert (=> b!265048 m!395689))

(assert (=> b!264840 d!89466))

(assert (=> b!264840 d!89408))

(declare-fun d!89468 () Bool)

(assert (=> d!89468 (isPrefixOf!0 lt!406035 w2!580)))

(declare-fun lt!406193 () Unit!18854)

(assert (=> d!89468 (= lt!406193 (choose!30 lt!406035 w1!584 w2!580))))

(assert (=> d!89468 (isPrefixOf!0 lt!406035 w1!584)))

(assert (=> d!89468 (= (lemmaIsPrefixTransitive!0 lt!406035 w1!584 w2!580) lt!406193)))

(declare-fun bs!22702 () Bool)

(assert (= bs!22702 d!89468))

(assert (=> bs!22702 m!395459))

(declare-fun m!395691 () Bool)

(assert (=> bs!22702 m!395691))

(assert (=> bs!22702 m!395475))

(assert (=> b!264840 d!89468))

(assert (=> b!264834 d!89408))

(declare-fun d!89470 () Bool)

(assert (=> d!89470 (arrayBitRangesEq!0 (buf!6909 w2!580) (buf!6909 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037)))

(declare-fun lt!406196 () Unit!18854)

(declare-fun choose!8 (array!14763 array!14763 (_ BitVec 64) (_ BitVec 64)) Unit!18854)

(assert (=> d!89470 (= lt!406196 (choose!8 (buf!6909 w1!584) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037))))

(assert (=> d!89470 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037))))

(assert (=> d!89470 (= (arrayBitRangesEqSymmetric!0 (buf!6909 w1!584) (buf!6909 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037) lt!406196)))

(declare-fun bs!22703 () Bool)

(assert (= bs!22703 d!89470))

(assert (=> bs!22703 m!395455))

(declare-fun m!395693 () Bool)

(assert (=> bs!22703 m!395693))

(assert (=> b!264834 d!89470))

(declare-fun lt!406197 () tuple4!358)

(declare-fun b!265049 () Bool)

(declare-fun e!185074 () Bool)

(declare-fun lt!406198 () (_ BitVec 32))

(assert (=> b!265049 (= e!185074 (byteRangesEq!0 (select (arr!7428 (buf!6909 w2!580)) (_4!179 lt!406197)) (select (arr!7428 (buf!6909 w1!584)) (_4!179 lt!406197)) #b00000000000000000000000000000000 lt!406198))))

(declare-fun b!265050 () Bool)

(declare-fun e!185077 () Bool)

(declare-fun e!185076 () Bool)

(assert (=> b!265050 (= e!185077 e!185076)))

(declare-fun res!221543 () Bool)

(assert (=> b!265050 (=> (not res!221543) (not e!185076))))

(declare-fun e!185075 () Bool)

(assert (=> b!265050 (= res!221543 e!185075)))

(declare-fun res!221544 () Bool)

(assert (=> b!265050 (=> res!221544 e!185075)))

(assert (=> b!265050 (= res!221544 (bvsge (_1!12159 lt!406197) (_2!12159 lt!406197)))))

(assert (=> b!265050 (= lt!406198 ((_ extract 31 0) (bvsrem lt!406037 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406199 () (_ BitVec 32))

(assert (=> b!265050 (= lt!406199 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265050 (= lt!406197 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037))))

(declare-fun b!265051 () Bool)

(declare-fun res!221542 () Bool)

(assert (=> b!265051 (= res!221542 (= lt!406198 #b00000000000000000000000000000000))))

(assert (=> b!265051 (=> res!221542 e!185074)))

(declare-fun e!185078 () Bool)

(assert (=> b!265051 (= e!185078 e!185074)))

(declare-fun b!265052 () Bool)

(declare-fun e!185079 () Bool)

(assert (=> b!265052 (= e!185076 e!185079)))

(declare-fun c!12174 () Bool)

(assert (=> b!265052 (= c!12174 (= (_3!959 lt!406197) (_4!179 lt!406197)))))

(declare-fun b!265053 () Bool)

(declare-fun call!4115 () Bool)

(assert (=> b!265053 (= e!185079 call!4115)))

(declare-fun d!89472 () Bool)

(declare-fun res!221541 () Bool)

(assert (=> d!89472 (=> res!221541 e!185077)))

(assert (=> d!89472 (= res!221541 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037))))

(assert (=> d!89472 (= (arrayBitRangesEq!0 (buf!6909 w2!580) (buf!6909 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406037) e!185077)))

(declare-fun b!265054 () Bool)

(assert (=> b!265054 (= e!185075 (arrayRangesEq!1015 (buf!6909 w2!580) (buf!6909 w1!584) (_1!12159 lt!406197) (_2!12159 lt!406197)))))

(declare-fun bm!4112 () Bool)

(assert (=> bm!4112 (= call!4115 (byteRangesEq!0 (select (arr!7428 (buf!6909 w2!580)) (_3!959 lt!406197)) (select (arr!7428 (buf!6909 w1!584)) (_3!959 lt!406197)) lt!406199 (ite c!12174 lt!406198 #b00000000000000000000000000001000)))))

(declare-fun b!265055 () Bool)

(assert (=> b!265055 (= e!185079 e!185078)))

(declare-fun res!221545 () Bool)

(assert (=> b!265055 (= res!221545 call!4115)))

(assert (=> b!265055 (=> (not res!221545) (not e!185078))))

(assert (= (and d!89472 (not res!221541)) b!265050))

(assert (= (and b!265050 (not res!221544)) b!265054))

(assert (= (and b!265050 res!221543) b!265052))

(assert (= (and b!265052 c!12174) b!265053))

(assert (= (and b!265052 (not c!12174)) b!265055))

(assert (= (and b!265055 res!221545) b!265051))

(assert (= (and b!265051 (not res!221542)) b!265049))

(assert (= (or b!265053 b!265055) bm!4112))

(declare-fun m!395695 () Bool)

(assert (=> b!265049 m!395695))

(declare-fun m!395697 () Bool)

(assert (=> b!265049 m!395697))

(assert (=> b!265049 m!395695))

(assert (=> b!265049 m!395697))

(declare-fun m!395699 () Bool)

(assert (=> b!265049 m!395699))

(declare-fun m!395701 () Bool)

(assert (=> b!265050 m!395701))

(declare-fun m!395703 () Bool)

(assert (=> b!265054 m!395703))

(declare-fun m!395705 () Bool)

(assert (=> bm!4112 m!395705))

(declare-fun m!395707 () Bool)

(assert (=> bm!4112 m!395707))

(assert (=> bm!4112 m!395705))

(assert (=> bm!4112 m!395707))

(declare-fun m!395709 () Bool)

(assert (=> bm!4112 m!395709))

(assert (=> b!264834 d!89472))

(push 1)

(assert (not b!264903))

(assert (not b!265048))

(assert (not d!89468))

(assert (not bm!4111))

(assert (not b!264968))

(assert (not b!264964))

(assert (not d!89364))

(assert (not d!89352))

(assert (not d!89376))

(assert (not b!265034))

(assert (not b!264879))

(assert (not d!89374))

(assert (not b!265032))

(assert (not b!265033))

(assert (not b!264901))

(assert (not bm!4106))

(assert (not d!89462))

(assert (not bm!4112))

(assert (not b!264877))

(assert (not b!265046))

(assert (not b!265049))

(assert (not b!264963))

(assert (not d!89470))

(assert (not b!264864))

(assert (not b!264884))

(assert (not b!265030))

(assert (not b!265043))

(assert (not b!264886))

(assert (not b!264866))

(assert (not d!89408))

(assert (not b!265050))

(assert (not d!89464))

(assert (not b!265038))

(assert (not d!89362))

(assert (not b!265054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

