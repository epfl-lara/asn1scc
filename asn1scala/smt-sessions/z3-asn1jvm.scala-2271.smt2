; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57518 () Bool)

(assert start!57518)

(declare-fun b!263653 () Bool)

(declare-fun e!183851 () Bool)

(declare-datatypes ((array!14710 0))(
  ( (array!14711 (arr!7406 (Array (_ BitVec 32) (_ BitVec 8))) (size!6419 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11652 0))(
  ( (BitStream!11653 (buf!6887 array!14710) (currentByte!12748 (_ BitVec 32)) (currentBit!12743 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11652)

(declare-fun w2!580 () BitStream!11652)

(declare-fun arrayBitRangesEq!0 (array!14710 array!14710 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263653 (= e!183851 (not (arrayBitRangesEq!0 (buf!6887 w1!584) (buf!6887 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584)))))))

(declare-fun b!263654 () Bool)

(declare-fun e!183847 () Bool)

(declare-fun e!183848 () Bool)

(assert (=> b!263654 (= e!183847 (not e!183848))))

(declare-fun res!220528 () Bool)

(assert (=> b!263654 (=> res!220528 e!183848)))

(assert (=> b!263654 (= res!220528 e!183851)))

(declare-fun res!220529 () Bool)

(assert (=> b!263654 (=> (not res!220529) (not e!183851))))

(assert (=> b!263654 (= res!220529 (not (= (size!6419 (buf!6887 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11652 BitStream!11652) Bool)

(assert (=> b!263654 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18788 0))(
  ( (Unit!18789) )
))
(declare-fun lt!405083 () Unit!18788)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11652) Unit!18788)

(assert (=> b!263654 (= lt!405083 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405084 () BitStream!11652)

(assert (=> b!263654 (isPrefixOf!0 lt!405084 lt!405084)))

(declare-fun lt!405087 () Unit!18788)

(assert (=> b!263654 (= lt!405087 (lemmaIsPrefixRefl!0 lt!405084))))

(assert (=> b!263654 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405082 () Unit!18788)

(assert (=> b!263654 (= lt!405082 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263654 (= lt!405084 (BitStream!11653 (buf!6887 w2!580) (currentByte!12748 w1!584) (currentBit!12743 w1!584)))))

(declare-fun b!263655 () Bool)

(declare-fun e!183852 () Unit!18788)

(declare-fun lt!405086 () Unit!18788)

(assert (=> b!263655 (= e!183852 lt!405086)))

(declare-fun lt!405085 () (_ BitVec 64))

(assert (=> b!263655 (= lt!405085 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14710 array!14710 (_ BitVec 64) (_ BitVec 64)) Unit!18788)

(assert (=> b!263655 (= lt!405086 (arrayBitRangesEqSymmetric!0 (buf!6887 w1!584) (buf!6887 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085))))

(assert (=> b!263655 (arrayBitRangesEq!0 (buf!6887 w2!580) (buf!6887 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085)))

(declare-fun b!263656 () Bool)

(declare-fun e!183850 () Bool)

(assert (=> b!263656 (= e!183848 e!183850)))

(declare-fun res!220531 () Bool)

(assert (=> b!263656 (=> res!220531 e!183850)))

(assert (=> b!263656 (= res!220531 (= (size!6419 (buf!6887 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!405089 () Unit!18788)

(assert (=> b!263656 (= lt!405089 e!183852)))

(declare-fun c!12051 () Bool)

(assert (=> b!263656 (= c!12051 (not (= (size!6419 (buf!6887 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263657 () Bool)

(declare-fun Unit!18790 () Unit!18788)

(assert (=> b!263657 (= e!183852 Unit!18790)))

(declare-fun lt!405088 () (_ BitVec 64))

(declare-fun b!263658 () Bool)

(assert (=> b!263658 (= e!183850 (or (bvsgt (size!6419 (buf!6887 w2!580)) (size!6419 (buf!6887 w1!584))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405088) (bvsle lt!405088 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6419 (buf!6887 w2!580))))))))))

(assert (=> b!263658 (= lt!405088 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584)))))

(declare-fun res!220530 () Bool)

(assert (=> start!57518 (=> (not res!220530) (not e!183847))))

(assert (=> start!57518 (= res!220530 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57518 e!183847))

(declare-fun e!183849 () Bool)

(declare-fun inv!12 (BitStream!11652) Bool)

(assert (=> start!57518 (and (inv!12 w1!584) e!183849)))

(declare-fun e!183846 () Bool)

(assert (=> start!57518 (and (inv!12 w2!580) e!183846)))

(declare-fun b!263659 () Bool)

(declare-fun array_inv!6143 (array!14710) Bool)

(assert (=> b!263659 (= e!183846 (array_inv!6143 (buf!6887 w2!580)))))

(declare-fun b!263660 () Bool)

(assert (=> b!263660 (= e!183849 (array_inv!6143 (buf!6887 w1!584)))))

(assert (= (and start!57518 res!220530) b!263654))

(assert (= (and b!263654 res!220529) b!263653))

(assert (= (and b!263654 (not res!220528)) b!263656))

(assert (= (and b!263656 c!12051) b!263655))

(assert (= (and b!263656 (not c!12051)) b!263657))

(assert (= (and b!263656 (not res!220531)) b!263658))

(assert (= start!57518 b!263660))

(assert (= start!57518 b!263659))

(declare-fun m!393977 () Bool)

(assert (=> start!57518 m!393977))

(declare-fun m!393979 () Bool)

(assert (=> start!57518 m!393979))

(declare-fun m!393981 () Bool)

(assert (=> start!57518 m!393981))

(declare-fun m!393983 () Bool)

(assert (=> b!263660 m!393983))

(declare-fun m!393985 () Bool)

(assert (=> b!263659 m!393985))

(declare-fun m!393987 () Bool)

(assert (=> b!263654 m!393987))

(declare-fun m!393989 () Bool)

(assert (=> b!263654 m!393989))

(declare-fun m!393991 () Bool)

(assert (=> b!263654 m!393991))

(declare-fun m!393993 () Bool)

(assert (=> b!263654 m!393993))

(declare-fun m!393995 () Bool)

(assert (=> b!263654 m!393995))

(declare-fun m!393997 () Bool)

(assert (=> b!263654 m!393997))

(declare-fun m!393999 () Bool)

(assert (=> b!263655 m!393999))

(declare-fun m!394001 () Bool)

(assert (=> b!263655 m!394001))

(declare-fun m!394003 () Bool)

(assert (=> b!263655 m!394003))

(assert (=> b!263653 m!393999))

(assert (=> b!263653 m!393999))

(declare-fun m!394005 () Bool)

(assert (=> b!263653 m!394005))

(assert (=> b!263658 m!393999))

(check-sat (not b!263660) (not start!57518) (not b!263659) (not b!263653) (not b!263658) (not b!263654) (not b!263655))
(check-sat)
(get-model)

(declare-fun d!88986 () Bool)

(declare-fun res!220551 () Bool)

(declare-fun e!183885 () Bool)

(assert (=> d!88986 (=> (not res!220551) (not e!183885))))

(assert (=> d!88986 (= res!220551 (= (size!6419 (buf!6887 w1!584)) (size!6419 (buf!6887 w2!580))))))

(assert (=> d!88986 (= (isPrefixOf!0 w1!584 w2!580) e!183885)))

(declare-fun b!263691 () Bool)

(declare-fun res!220550 () Bool)

(assert (=> b!263691 (=> (not res!220550) (not e!183885))))

(assert (=> b!263691 (= res!220550 (bvsle (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584)) (bitIndex!0 (size!6419 (buf!6887 w2!580)) (currentByte!12748 w2!580) (currentBit!12743 w2!580))))))

(declare-fun b!263692 () Bool)

(declare-fun e!183884 () Bool)

(assert (=> b!263692 (= e!183885 e!183884)))

(declare-fun res!220552 () Bool)

(assert (=> b!263692 (=> res!220552 e!183884)))

(assert (=> b!263692 (= res!220552 (= (size!6419 (buf!6887 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263693 () Bool)

(assert (=> b!263693 (= e!183884 (arrayBitRangesEq!0 (buf!6887 w1!584) (buf!6887 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584))))))

(assert (= (and d!88986 res!220551) b!263691))

(assert (= (and b!263691 res!220550) b!263692))

(assert (= (and b!263692 (not res!220552)) b!263693))

(assert (=> b!263691 m!393999))

(declare-fun m!394037 () Bool)

(assert (=> b!263691 m!394037))

(assert (=> b!263693 m!393999))

(assert (=> b!263693 m!393999))

(assert (=> b!263693 m!394005))

(assert (=> start!57518 d!88986))

(declare-fun d!88990 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88990 (= (inv!12 w1!584) (invariant!0 (currentBit!12743 w1!584) (currentByte!12748 w1!584) (size!6419 (buf!6887 w1!584))))))

(declare-fun bs!22581 () Bool)

(assert (= bs!22581 d!88990))

(declare-fun m!394039 () Bool)

(assert (=> bs!22581 m!394039))

(assert (=> start!57518 d!88990))

(declare-fun d!88992 () Bool)

(assert (=> d!88992 (= (inv!12 w2!580) (invariant!0 (currentBit!12743 w2!580) (currentByte!12748 w2!580) (size!6419 (buf!6887 w2!580))))))

(declare-fun bs!22582 () Bool)

(assert (= bs!22582 d!88992))

(declare-fun m!394041 () Bool)

(assert (=> bs!22582 m!394041))

(assert (=> start!57518 d!88992))

(declare-fun d!88994 () Bool)

(declare-fun e!183906 () Bool)

(assert (=> d!88994 e!183906))

(declare-fun res!220573 () Bool)

(assert (=> d!88994 (=> (not res!220573) (not e!183906))))

(declare-fun lt!405143 () (_ BitVec 64))

(declare-fun lt!405144 () (_ BitVec 64))

(declare-fun lt!405142 () (_ BitVec 64))

(assert (=> d!88994 (= res!220573 (= lt!405143 (bvsub lt!405142 lt!405144)))))

(assert (=> d!88994 (or (= (bvand lt!405142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405142 lt!405144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88994 (= lt!405144 (remainingBits!0 ((_ sign_extend 32) (size!6419 (buf!6887 w1!584))) ((_ sign_extend 32) (currentByte!12748 w1!584)) ((_ sign_extend 32) (currentBit!12743 w1!584))))))

(declare-fun lt!405139 () (_ BitVec 64))

(declare-fun lt!405140 () (_ BitVec 64))

(assert (=> d!88994 (= lt!405142 (bvmul lt!405139 lt!405140))))

(assert (=> d!88994 (or (= lt!405139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405140 (bvsdiv (bvmul lt!405139 lt!405140) lt!405139)))))

(assert (=> d!88994 (= lt!405140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88994 (= lt!405139 ((_ sign_extend 32) (size!6419 (buf!6887 w1!584))))))

(assert (=> d!88994 (= lt!405143 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12748 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12743 w1!584))))))

(assert (=> d!88994 (invariant!0 (currentBit!12743 w1!584) (currentByte!12748 w1!584) (size!6419 (buf!6887 w1!584)))))

(assert (=> d!88994 (= (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584)) lt!405143)))

(declare-fun b!263719 () Bool)

(declare-fun res!220572 () Bool)

(assert (=> b!263719 (=> (not res!220572) (not e!183906))))

(assert (=> b!263719 (= res!220572 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405143))))

(declare-fun b!263720 () Bool)

(declare-fun lt!405141 () (_ BitVec 64))

(assert (=> b!263720 (= e!183906 (bvsle lt!405143 (bvmul lt!405141 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263720 (or (= lt!405141 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405141 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405141)))))

(assert (=> b!263720 (= lt!405141 ((_ sign_extend 32) (size!6419 (buf!6887 w1!584))))))

(assert (= (and d!88994 res!220573) b!263719))

(assert (= (and b!263719 res!220572) b!263720))

(declare-fun m!394063 () Bool)

(assert (=> d!88994 m!394063))

(assert (=> d!88994 m!394039))

(assert (=> b!263655 d!88994))

(declare-fun d!89006 () Bool)

(assert (=> d!89006 (arrayBitRangesEq!0 (buf!6887 w2!580) (buf!6887 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085)))

(declare-fun lt!405147 () Unit!18788)

(declare-fun choose!8 (array!14710 array!14710 (_ BitVec 64) (_ BitVec 64)) Unit!18788)

(assert (=> d!89006 (= lt!405147 (choose!8 (buf!6887 w1!584) (buf!6887 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085))))

(assert (=> d!89006 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085))))

(assert (=> d!89006 (= (arrayBitRangesEqSymmetric!0 (buf!6887 w1!584) (buf!6887 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085) lt!405147)))

(declare-fun bs!22586 () Bool)

(assert (= bs!22586 d!89006))

(assert (=> bs!22586 m!394003))

(declare-fun m!394065 () Bool)

(assert (=> bs!22586 m!394065))

(assert (=> b!263655 d!89006))

(declare-fun b!263777 () Bool)

(declare-fun res!220629 () Bool)

(declare-fun lt!405198 () (_ BitVec 32))

(assert (=> b!263777 (= res!220629 (= lt!405198 #b00000000000000000000000000000000))))

(declare-fun e!183949 () Bool)

(assert (=> b!263777 (=> res!220629 e!183949)))

(declare-fun e!183946 () Bool)

(assert (=> b!263777 (= e!183946 e!183949)))

(declare-fun b!263778 () Bool)

(declare-fun e!183947 () Bool)

(declare-fun call!4064 () Bool)

(assert (=> b!263778 (= e!183947 call!4064)))

(declare-fun b!263779 () Bool)

(declare-fun e!183950 () Bool)

(declare-fun e!183945 () Bool)

(assert (=> b!263779 (= e!183950 e!183945)))

(declare-fun res!220630 () Bool)

(assert (=> b!263779 (=> (not res!220630) (not e!183945))))

(declare-fun e!183948 () Bool)

(assert (=> b!263779 (= res!220630 e!183948)))

(declare-fun res!220628 () Bool)

(assert (=> b!263779 (=> res!220628 e!183948)))

(declare-datatypes ((tuple4!338 0))(
  ( (tuple4!339 (_1!12149 (_ BitVec 32)) (_2!12149 (_ BitVec 32)) (_3!949 (_ BitVec 32)) (_4!169 (_ BitVec 32))) )
))
(declare-fun lt!405197 () tuple4!338)

(assert (=> b!263779 (= res!220628 (bvsge (_1!12149 lt!405197) (_2!12149 lt!405197)))))

(assert (=> b!263779 (= lt!405198 ((_ extract 31 0) (bvsrem lt!405085 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405196 () (_ BitVec 32))

(assert (=> b!263779 (= lt!405196 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!338)

(assert (=> b!263779 (= lt!405197 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085))))

(declare-fun d!89008 () Bool)

(declare-fun res!220627 () Bool)

(assert (=> d!89008 (=> res!220627 e!183950)))

(assert (=> d!89008 (= res!220627 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085))))

(assert (=> d!89008 (= (arrayBitRangesEq!0 (buf!6887 w2!580) (buf!6887 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405085) e!183950)))

(declare-fun b!263780 () Bool)

(assert (=> b!263780 (= e!183945 e!183947)))

(declare-fun c!12060 () Bool)

(assert (=> b!263780 (= c!12060 (= (_3!949 lt!405197) (_4!169 lt!405197)))))

(declare-fun b!263781 () Bool)

(assert (=> b!263781 (= e!183949 call!4064)))

(declare-fun bm!4061 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4061 (= call!4064 (byteRangesEq!0 (ite c!12060 (select (arr!7406 (buf!6887 w2!580)) (_3!949 lt!405197)) (select (arr!7406 (buf!6887 w2!580)) (_4!169 lt!405197))) (ite c!12060 (select (arr!7406 (buf!6887 w1!584)) (_3!949 lt!405197)) (select (arr!7406 (buf!6887 w1!584)) (_4!169 lt!405197))) (ite c!12060 lt!405196 #b00000000000000000000000000000000) lt!405198))))

(declare-fun b!263782 () Bool)

(assert (=> b!263782 (= e!183947 e!183946)))

(declare-fun res!220626 () Bool)

(assert (=> b!263782 (= res!220626 (byteRangesEq!0 (select (arr!7406 (buf!6887 w2!580)) (_3!949 lt!405197)) (select (arr!7406 (buf!6887 w1!584)) (_3!949 lt!405197)) lt!405196 #b00000000000000000000000000001000))))

(assert (=> b!263782 (=> (not res!220626) (not e!183946))))

(declare-fun b!263783 () Bool)

(declare-fun arrayRangesEq!1005 (array!14710 array!14710 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263783 (= e!183948 (arrayRangesEq!1005 (buf!6887 w2!580) (buf!6887 w1!584) (_1!12149 lt!405197) (_2!12149 lt!405197)))))

(assert (= (and d!89008 (not res!220627)) b!263779))

(assert (= (and b!263779 (not res!220628)) b!263783))

(assert (= (and b!263779 res!220630) b!263780))

(assert (= (and b!263780 c!12060) b!263778))

(assert (= (and b!263780 (not c!12060)) b!263782))

(assert (= (and b!263782 res!220626) b!263777))

(assert (= (and b!263777 (not res!220629)) b!263781))

(assert (= (or b!263778 b!263781) bm!4061))

(declare-fun m!394103 () Bool)

(assert (=> b!263779 m!394103))

(declare-fun m!394105 () Bool)

(assert (=> bm!4061 m!394105))

(declare-fun m!394107 () Bool)

(assert (=> bm!4061 m!394107))

(declare-fun m!394109 () Bool)

(assert (=> bm!4061 m!394109))

(declare-fun m!394111 () Bool)

(assert (=> bm!4061 m!394111))

(declare-fun m!394113 () Bool)

(assert (=> bm!4061 m!394113))

(assert (=> b!263782 m!394111))

(assert (=> b!263782 m!394113))

(assert (=> b!263782 m!394111))

(assert (=> b!263782 m!394113))

(declare-fun m!394117 () Bool)

(assert (=> b!263782 m!394117))

(declare-fun m!394119 () Bool)

(assert (=> b!263783 m!394119))

(assert (=> b!263655 d!89008))

(declare-fun d!89044 () Bool)

(assert (=> d!89044 (= (array_inv!6143 (buf!6887 w1!584)) (bvsge (size!6419 (buf!6887 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263660 d!89044))

(declare-fun d!89048 () Bool)

(assert (=> d!89048 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405207 () Unit!18788)

(declare-fun choose!11 (BitStream!11652) Unit!18788)

(assert (=> d!89048 (= lt!405207 (choose!11 w2!580))))

(assert (=> d!89048 (= (lemmaIsPrefixRefl!0 w2!580) lt!405207)))

(declare-fun bs!22596 () Bool)

(assert (= bs!22596 d!89048))

(assert (=> bs!22596 m!393991))

(declare-fun m!394123 () Bool)

(assert (=> bs!22596 m!394123))

(assert (=> b!263654 d!89048))

(declare-fun d!89050 () Bool)

(assert (=> d!89050 (isPrefixOf!0 lt!405084 lt!405084)))

(declare-fun lt!405208 () Unit!18788)

(assert (=> d!89050 (= lt!405208 (choose!11 lt!405084))))

(assert (=> d!89050 (= (lemmaIsPrefixRefl!0 lt!405084) lt!405208)))

(declare-fun bs!22598 () Bool)

(assert (= bs!22598 d!89050))

(assert (=> bs!22598 m!393995))

(declare-fun m!394127 () Bool)

(assert (=> bs!22598 m!394127))

(assert (=> b!263654 d!89050))

(declare-fun d!89054 () Bool)

(assert (=> d!89054 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405212 () Unit!18788)

(assert (=> d!89054 (= lt!405212 (choose!11 w1!584))))

(assert (=> d!89054 (= (lemmaIsPrefixRefl!0 w1!584) lt!405212)))

(declare-fun bs!22599 () Bool)

(assert (= bs!22599 d!89054))

(assert (=> bs!22599 m!393989))

(declare-fun m!394129 () Bool)

(assert (=> bs!22599 m!394129))

(assert (=> b!263654 d!89054))

(declare-fun d!89056 () Bool)

(declare-fun res!220640 () Bool)

(declare-fun e!183960 () Bool)

(assert (=> d!89056 (=> (not res!220640) (not e!183960))))

(assert (=> d!89056 (= res!220640 (= (size!6419 (buf!6887 lt!405084)) (size!6419 (buf!6887 lt!405084))))))

(assert (=> d!89056 (= (isPrefixOf!0 lt!405084 lt!405084) e!183960)))

(declare-fun b!263794 () Bool)

(declare-fun res!220639 () Bool)

(assert (=> b!263794 (=> (not res!220639) (not e!183960))))

(assert (=> b!263794 (= res!220639 (bvsle (bitIndex!0 (size!6419 (buf!6887 lt!405084)) (currentByte!12748 lt!405084) (currentBit!12743 lt!405084)) (bitIndex!0 (size!6419 (buf!6887 lt!405084)) (currentByte!12748 lt!405084) (currentBit!12743 lt!405084))))))

(declare-fun b!263795 () Bool)

(declare-fun e!183959 () Bool)

(assert (=> b!263795 (= e!183960 e!183959)))

(declare-fun res!220641 () Bool)

(assert (=> b!263795 (=> res!220641 e!183959)))

(assert (=> b!263795 (= res!220641 (= (size!6419 (buf!6887 lt!405084)) #b00000000000000000000000000000000))))

(declare-fun b!263796 () Bool)

(assert (=> b!263796 (= e!183959 (arrayBitRangesEq!0 (buf!6887 lt!405084) (buf!6887 lt!405084) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 lt!405084)) (currentByte!12748 lt!405084) (currentBit!12743 lt!405084))))))

(assert (= (and d!89056 res!220640) b!263794))

(assert (= (and b!263794 res!220639) b!263795))

(assert (= (and b!263795 (not res!220641)) b!263796))

(declare-fun m!394131 () Bool)

(assert (=> b!263794 m!394131))

(assert (=> b!263794 m!394131))

(assert (=> b!263796 m!394131))

(assert (=> b!263796 m!394131))

(declare-fun m!394137 () Bool)

(assert (=> b!263796 m!394137))

(assert (=> b!263654 d!89056))

(declare-fun d!89058 () Bool)

(declare-fun res!220643 () Bool)

(declare-fun e!183962 () Bool)

(assert (=> d!89058 (=> (not res!220643) (not e!183962))))

(assert (=> d!89058 (= res!220643 (= (size!6419 (buf!6887 w1!584)) (size!6419 (buf!6887 w1!584))))))

(assert (=> d!89058 (= (isPrefixOf!0 w1!584 w1!584) e!183962)))

(declare-fun b!263797 () Bool)

(declare-fun res!220642 () Bool)

(assert (=> b!263797 (=> (not res!220642) (not e!183962))))

(assert (=> b!263797 (= res!220642 (bvsle (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584)) (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584))))))

(declare-fun b!263798 () Bool)

(declare-fun e!183961 () Bool)

(assert (=> b!263798 (= e!183962 e!183961)))

(declare-fun res!220644 () Bool)

(assert (=> b!263798 (=> res!220644 e!183961)))

(assert (=> b!263798 (= res!220644 (= (size!6419 (buf!6887 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263799 () Bool)

(assert (=> b!263799 (= e!183961 (arrayBitRangesEq!0 (buf!6887 w1!584) (buf!6887 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584))))))

(assert (= (and d!89058 res!220643) b!263797))

(assert (= (and b!263797 res!220642) b!263798))

(assert (= (and b!263798 (not res!220644)) b!263799))

(assert (=> b!263797 m!393999))

(assert (=> b!263797 m!393999))

(assert (=> b!263799 m!393999))

(assert (=> b!263799 m!393999))

(declare-fun m!394151 () Bool)

(assert (=> b!263799 m!394151))

(assert (=> b!263654 d!89058))

(declare-fun d!89060 () Bool)

(declare-fun res!220646 () Bool)

(declare-fun e!183964 () Bool)

(assert (=> d!89060 (=> (not res!220646) (not e!183964))))

(assert (=> d!89060 (= res!220646 (= (size!6419 (buf!6887 w2!580)) (size!6419 (buf!6887 w2!580))))))

(assert (=> d!89060 (= (isPrefixOf!0 w2!580 w2!580) e!183964)))

(declare-fun b!263800 () Bool)

(declare-fun res!220645 () Bool)

(assert (=> b!263800 (=> (not res!220645) (not e!183964))))

(assert (=> b!263800 (= res!220645 (bvsle (bitIndex!0 (size!6419 (buf!6887 w2!580)) (currentByte!12748 w2!580) (currentBit!12743 w2!580)) (bitIndex!0 (size!6419 (buf!6887 w2!580)) (currentByte!12748 w2!580) (currentBit!12743 w2!580))))))

(declare-fun b!263801 () Bool)

(declare-fun e!183963 () Bool)

(assert (=> b!263801 (= e!183964 e!183963)))

(declare-fun res!220647 () Bool)

(assert (=> b!263801 (=> res!220647 e!183963)))

(assert (=> b!263801 (= res!220647 (= (size!6419 (buf!6887 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263802 () Bool)

(assert (=> b!263802 (= e!183963 (arrayBitRangesEq!0 (buf!6887 w2!580) (buf!6887 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 w2!580)) (currentByte!12748 w2!580) (currentBit!12743 w2!580))))))

(assert (= (and d!89060 res!220646) b!263800))

(assert (= (and b!263800 res!220645) b!263801))

(assert (= (and b!263801 (not res!220647)) b!263802))

(assert (=> b!263800 m!394037))

(assert (=> b!263800 m!394037))

(assert (=> b!263802 m!394037))

(assert (=> b!263802 m!394037))

(declare-fun m!394153 () Bool)

(assert (=> b!263802 m!394153))

(assert (=> b!263654 d!89060))

(declare-fun d!89062 () Bool)

(assert (=> d!89062 (= (array_inv!6143 (buf!6887 w2!580)) (bvsge (size!6419 (buf!6887 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263659 d!89062))

(declare-fun b!263803 () Bool)

(declare-fun res!220651 () Bool)

(declare-fun lt!405215 () (_ BitVec 32))

(assert (=> b!263803 (= res!220651 (= lt!405215 #b00000000000000000000000000000000))))

(declare-fun e!183969 () Bool)

(assert (=> b!263803 (=> res!220651 e!183969)))

(declare-fun e!183966 () Bool)

(assert (=> b!263803 (= e!183966 e!183969)))

(declare-fun b!263804 () Bool)

(declare-fun e!183967 () Bool)

(declare-fun call!4066 () Bool)

(assert (=> b!263804 (= e!183967 call!4066)))

(declare-fun b!263805 () Bool)

(declare-fun e!183970 () Bool)

(declare-fun e!183965 () Bool)

(assert (=> b!263805 (= e!183970 e!183965)))

(declare-fun res!220652 () Bool)

(assert (=> b!263805 (=> (not res!220652) (not e!183965))))

(declare-fun e!183968 () Bool)

(assert (=> b!263805 (= res!220652 e!183968)))

(declare-fun res!220650 () Bool)

(assert (=> b!263805 (=> res!220650 e!183968)))

(declare-fun lt!405214 () tuple4!338)

(assert (=> b!263805 (= res!220650 (bvsge (_1!12149 lt!405214) (_2!12149 lt!405214)))))

(assert (=> b!263805 (= lt!405215 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405213 () (_ BitVec 32))

(assert (=> b!263805 (= lt!405213 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263805 (= lt!405214 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584))))))

(declare-fun d!89064 () Bool)

(declare-fun res!220649 () Bool)

(assert (=> d!89064 (=> res!220649 e!183970)))

(assert (=> d!89064 (= res!220649 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584))))))

(assert (=> d!89064 (= (arrayBitRangesEq!0 (buf!6887 w1!584) (buf!6887 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6419 (buf!6887 w1!584)) (currentByte!12748 w1!584) (currentBit!12743 w1!584))) e!183970)))

(declare-fun b!263806 () Bool)

(assert (=> b!263806 (= e!183965 e!183967)))

(declare-fun c!12062 () Bool)

(assert (=> b!263806 (= c!12062 (= (_3!949 lt!405214) (_4!169 lt!405214)))))

(declare-fun b!263807 () Bool)

(assert (=> b!263807 (= e!183969 call!4066)))

(declare-fun bm!4063 () Bool)

(assert (=> bm!4063 (= call!4066 (byteRangesEq!0 (ite c!12062 (select (arr!7406 (buf!6887 w1!584)) (_3!949 lt!405214)) (select (arr!7406 (buf!6887 w1!584)) (_4!169 lt!405214))) (ite c!12062 (select (arr!7406 (buf!6887 w2!580)) (_3!949 lt!405214)) (select (arr!7406 (buf!6887 w2!580)) (_4!169 lt!405214))) (ite c!12062 lt!405213 #b00000000000000000000000000000000) lt!405215))))

(declare-fun b!263808 () Bool)

(assert (=> b!263808 (= e!183967 e!183966)))

(declare-fun res!220648 () Bool)

(assert (=> b!263808 (= res!220648 (byteRangesEq!0 (select (arr!7406 (buf!6887 w1!584)) (_3!949 lt!405214)) (select (arr!7406 (buf!6887 w2!580)) (_3!949 lt!405214)) lt!405213 #b00000000000000000000000000001000))))

(assert (=> b!263808 (=> (not res!220648) (not e!183966))))

(declare-fun b!263809 () Bool)

(assert (=> b!263809 (= e!183968 (arrayRangesEq!1005 (buf!6887 w1!584) (buf!6887 w2!580) (_1!12149 lt!405214) (_2!12149 lt!405214)))))

(assert (= (and d!89064 (not res!220649)) b!263805))

(assert (= (and b!263805 (not res!220650)) b!263809))

(assert (= (and b!263805 res!220652) b!263806))

(assert (= (and b!263806 c!12062) b!263804))

(assert (= (and b!263806 (not c!12062)) b!263808))

(assert (= (and b!263808 res!220648) b!263803))

(assert (= (and b!263803 (not res!220651)) b!263807))

(assert (= (or b!263804 b!263807) bm!4063))

(assert (=> b!263805 m!393999))

(declare-fun m!394155 () Bool)

(assert (=> b!263805 m!394155))

(declare-fun m!394157 () Bool)

(assert (=> bm!4063 m!394157))

(declare-fun m!394159 () Bool)

(assert (=> bm!4063 m!394159))

(declare-fun m!394161 () Bool)

(assert (=> bm!4063 m!394161))

(declare-fun m!394163 () Bool)

(assert (=> bm!4063 m!394163))

(declare-fun m!394165 () Bool)

(assert (=> bm!4063 m!394165))

(assert (=> b!263808 m!394163))

(assert (=> b!263808 m!394165))

(assert (=> b!263808 m!394163))

(assert (=> b!263808 m!394165))

(declare-fun m!394167 () Bool)

(assert (=> b!263808 m!394167))

(declare-fun m!394169 () Bool)

(assert (=> b!263809 m!394169))

(assert (=> b!263653 d!89064))

(assert (=> b!263653 d!88994))

(assert (=> b!263658 d!88994))

(check-sat (not b!263796) (not b!263809) (not d!89050) (not d!88992) (not b!263691) (not d!89054) (not b!263783) (not bm!4063) (not d!88994) (not b!263800) (not b!263805) (not d!88990) (not b!263779) (not bm!4061) (not b!263797) (not b!263808) (not b!263799) (not b!263802) (not b!263693) (not d!89006) (not b!263782) (not b!263794) (not d!89048))
(check-sat)
